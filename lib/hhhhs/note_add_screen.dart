import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:skin_care_255/main.dart';
import 'package:skin_care_255/models/photo_hive_model/photo_hive_model.dart';
import 'package:skin_care_255/widgets/my_text_field.dart';

class NoteAddScreen extends StatefulWidget {
  const NoteAddScreen({super.key});

  @override
  State<NoteAddScreen> createState() => _NoteAddScreenState();
}

class _NoteAddScreenState extends State<NoteAddScreen> {
  final TextEditingController _controllerNote = TextEditingController();
  File? _image;
  Uint8List? _bytes;
  String? photo;

  DateTime selectDate = DateTime.now();
  String selectDateString = 'Select Date';

  @override
  void dispose() {
    _controllerNote.dispose();
    super.dispose();
  }

  Future pickImage() async {
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile == null) return null;

      setState(() => _image = File(pickedFile.path));
      _bytes = _image!.readAsBytesSync();
      photo = String.fromCharCodes(_bytes!);
    } on PlatformException catch (e) {
      print('Failed to select image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Note'),
        titleTextStyle: TextStyle(
          fontFamily: family,
          fontSize: 28.h,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Text(
                'Date',
                style: TextStyle(
                  fontFamily: family,
                  fontSize: 16.h,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => Wrap(
                      children: [
                        SelectDateTIme(
                          child: CupertinoDatePicker(
                            backgroundColor: Colors.white,
                            initialDateTime: selectDate,
                            onDateTimeChanged: (DateTime newTime) {
                              setState(() {
                                selectDate = newTime;
                                selectDateString =
                                    DateFormat('dd.MM.yyyy').format(selectDate);
                              });
                            },
                            mode: CupertinoDatePickerMode.date,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.r),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        color: Color(0xff009DFF),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        selectDateString,
                        style: TextStyle(
                          fontSize: 14.h,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Note',
                style: TextStyle(
                  fontFamily: family,
                  fontSize: 16.h,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4.r),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white,
                ),
                child: MyTextField(
                  controller: _controllerNote,
                  hintText: 'Enter note',
                  maxLine: 5,
                  borderColor: Colors.white,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Photo',
                style: TextStyle(
                  fontFamily: family,
                  fontSize: 16.h,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  pickImage();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.r),
                  width: MediaQuery.of(context).size.width,
                  height: 240.h,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white,
                  ),
                  child: _image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Image.file(
                            _image!,
                            width: MediaQuery.of(context).size.width,
                            height: 240.h,
                            fit: BoxFit.fill,
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle,
                              size: 32.r,
                              color: const Color(0xff009DFF),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Add photo',
                              style: TextStyle(
                                fontFamily: family,
                                fontSize: 12.h,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              SizedBox(height: 24.h),
              InkWell(
                onTap: () async {
                  if (selectDateString != 'Select Date' &&
                      _controllerNote.text.isNotEmpty &&
                      photo != null) {
                    await photoHive.add(
                      PhotoHiveModel(
                        date: selectDateString,
                        title: _controllerNote.text,
                        image: photo!,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  height: 52.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color(0xff009DFF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontFamily: family,
                        fontSize: 18.h,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectDateTIme extends StatelessWidget {
  const SelectDateTIme({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(top: 20.r, right: 20.r, bottom: 10.r),
              child: const Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.close),
              ),
            ),
          ),
          Container(
            height: 200,
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            width: double.infinity,
            color: Colors.white,
            child: child,
          ),
          SizedBox(height: 30.h)
        ],
      ),
    );
  }
}
