import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:skin_care_255/hhhhs/note_add_screen.dart';
import 'package:skin_care_255/main.dart';
import 'package:skin_care_255/models/photo_hive_model/photo_hive_model.dart';

class Nv3Screen extends StatefulWidget {
  const Nv3Screen({super.key});

  @override
  State<Nv3Screen> createState() => _Nv3ScreenState();
}

class _Nv3ScreenState extends State<Nv3Screen> {
  List<PhotoHiveModel> photos = [];

  @override
  void initState() {
    photos = List.from(photoHive.values.toList().reversed);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Photo diary'),
        titleTextStyle: TextStyle(
          fontFamily: family,
          fontSize: 28.h,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 21),
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NoteAddScreen(),
                  ),
                );
                photos = List.from(photoHive.values.toList().reversed);
                setState(() {});
              },
              child: Image.asset(
                'assets/images/add.png',
                height: 32.h,
              ),
            ),
          ),
        ],
      ),
      body: photos.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 53),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/empty_photo.png',
                      height: 97,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Leave your notes on your skin care progress',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: family,
                        fontSize: 16.h,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : MasonryGridView.count(
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 17.w,
              itemCount: photos.length,
              crossAxisCount: 2,
              itemBuilder: (context, index) =>
                  PhotoWidget(model: photos[index]),
            ),
    );
  }
}

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({
    super.key,
    required this.model,
  });

  final PhotoHiveModel model;

  @override
  Widget build(BuildContext context) {
    late Uint8List outputAsUint8List =
        Uint8List.fromList(model.image.codeUnits);

    return Container(
      alignment: AlignmentDirectional.bottomCenter,
      height: 140.h,
      width: 155.w,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: MemoryImage(outputAsUint8List), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: 12.w),
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
    );
  }
}
