import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skin_care_255/main.dart';
import 'package:skin_care_255/models/photo_hive_model/photo_hive_model.dart';

class NoteDetailScreen extends StatelessWidget {
  const NoteDetailScreen({super.key, required this.model});
  final PhotoHiveModel model;

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
              Container(
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
                      model.date,
                      style: TextStyle(
                        fontSize: 14.h,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
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
                padding: const EdgeInsets.all(16),
                height: 180.h,
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
                child: SingleChildScrollView(
                  child: Text(
                    model.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              if (model.image != null)
                Text(
                  'Photo',
                  style: TextStyle(
                    fontFamily: family,
                    fontSize: 16.h,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              if (model.image != null)
                Container(
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.memory(
                      Uint8List.fromList(model.image!.codeUnits),
                      fit: BoxFit.cover,
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
