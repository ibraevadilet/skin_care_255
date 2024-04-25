import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skin_care_255/main.dart';
import 'package:skin_care_255/widgets/vd_ss.dart';

class VdScreen extends StatelessWidget {
  const VdScreen({super.key, required this.model, required this.indx});
  final VdSs model;
  final int indx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leading: const BackButton(color: Colors.black),
          title: Text('Lesson $indx'),
          titleTextStyle: TextStyle(
            fontFamily: family,
            fontSize: 24.h,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.r),
              child: InkWell(
                onTap: () {
                  Share.share(model.image);
                },
                child: const Icon(
                  Icons.ios_share,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: model.image,
                  width: MediaQuery.of(context).size.width,
                  height: 280.h,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 280.h,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade500,
                        highlightColor: Colors.grey.shade200,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.r),
                  child: Text(
                    model.description,
                    style: TextStyle(
                      fontFamily: family,
                      fontSize: 16.h,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        ));
  }
}
