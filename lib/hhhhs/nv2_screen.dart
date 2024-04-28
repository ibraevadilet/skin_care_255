import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skin_care_255/hhhhs/premdfasf.dart';
import 'package:skin_care_255/hhhhs/vd_screen.dart';
import 'package:skin_care_255/main.dart';
import 'package:skin_care_255/widgets/vd_ss.dart';

class Nv2Screen extends StatelessWidget {
  const Nv2Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: const Text('Lessons'),
        titleTextStyle: TextStyle(
          fontFamily: family,
          fontSize: 28.h,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 16.r),
        shrinkWrap: true,
        itemCount: listVd.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) => VdWidget(
          model: listVd[index],
          indx: index + 1,
        ),
      ),
    );
  }
}

class VdWidget extends StatefulWidget {
  const VdWidget({
    super.key,
    required this.model,
    required this.indx,
  });
  final VdSs model;
  final int indx;

  @override
  State<VdWidget> createState() => _VdWidgetState();
}

class _VdWidgetState extends State<VdWidget> {
  bool isPrem = false;
  @override
  void initState() {
    isPrem = localData.getBool('prem') ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (widget.model.isPrem && !isPrem) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Premdfasf(isClose: true),
            ),
          );
        } else {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VdScreen(
                model: widget.model,
                indx: widget.indx,
              ),
            ),
          );
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.r),
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.model.image,
                    width: MediaQuery.of(context).size.width,
                    height: 160.h,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 160.h,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade500,
                          highlightColor: Colors.grey.shade200,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  if (widget.model.isPrem && !isPrem)
                    Image.asset(
                      'assets/images/lock_icon.png',
                      height: 40.h,
                    ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80.w,
                    height: 24.h,
                    decoration: BoxDecoration(
                      color: const Color(0xff009DFF).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        widget.model.care,
                        style: TextStyle(
                          fontSize: 12.h,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff009DFF),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    widget.model.title,
                    style: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      const Icon(
                        Icons.watch_later_outlined,
                        color: Color(0xff009DFF),
                        size: 16,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '${widget.model.time} min',
                        style: TextStyle(
                          fontSize: 12.h,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
