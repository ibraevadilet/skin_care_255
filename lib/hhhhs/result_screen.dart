import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skin_care_255/hhhhs/navbar_screen.dart';
import 'package:skin_care_255/hhhhs/premdfasf.dart';
import 'package:skin_care_255/hhhhs/test_screen.dart';
import 'package:skin_care_255/main.dart';
import 'package:skin_care_255/models/result_model_data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.otvets});

  final List<OtvetModel> otvets;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: family,
          fontSize: 24.h,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const NavbarScreen(),
                ),
                (protected) => false,
              );
            },
            child: const Icon(
              Icons.close_rounded,
              color: Colors.black,
              size: 33,
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: ResultBody(model: calculateResult(otvets)),
    );
  }
}

ResultModel calculateResult(List<OtvetModel> otvets) {
  final types = otvets.map<String>((e) => e.type).toList();
  int type1 = 0;
  int type2 = 0;
  int type3 = 0;

  for (var e in types) {
    if (e == '1') {
      type1++;
    }
    if (e == '2') {
      type2++;
    }
    if (e == '3') {
      type3++;
    }
  }

  if (type1 >= 8) {
    return resultList[0];
  } else if (type2 >= 8) {
    return resultList[1];
  } else if (type3 >= 8) {
    return resultList[2];
  } else if (type1 >= 4 && type1 <= 6 && type3 >= 4 && type3 <= 6) {
    return resultList[3];
  } else {
    return resultList.last;
  }
}

class ResultBody extends StatefulWidget {
  const ResultBody({
    super.key,
    required this.model,
  });

  final ResultModel model;

  @override
  State<ResultBody> createState() => _ResultBodyState();
}

class _ResultBodyState extends State<ResultBody> {
  bool isPrem = false;
  @override
  void initState() {
    isPrem = localData.getBool('prem') ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: !isPrem
          ? const NeverScrollableScrollPhysics()
          : const ClampingScrollPhysics(),
      child: Column(
        children: [
          CachedNetworkImage(
            height: 240.h,
            width: double.infinity,
            fit: BoxFit.cover,
            imageUrl: widget.model.image,
            placeholder: (context, url) => SizedBox(
              height: 240.h,
              width: double.infinity,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.4),
                highlightColor: Colors.white,
                child: Container(
                  height: 240.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: const CircularProgressIndicator.adaptive(),
                ),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Container(
            alignment: Alignment.center,
            width: 240.w,
            height: 56.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xff009DFF).withOpacity(0.2),
            ),
            child: Text(
              widget.model.title,
              style: TextStyle(
                fontFamily: family,
                fontSize: 24.h,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  widget.model.desk,
                  style: TextStyle(
                    fontFamily: family,
                    fontSize: 14.h,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    height: 1.7,
                  ),
                ),
              ),
              if (!isPrem)
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      blendMode: BlendMode.srcOver,
                      child: const SizedBox(),
                    ),
                  ),
                ),
              if (!isPrem)
                Positioned(
                  left: 24,
                  right: 24,
                  top: MediaQuery.of(context).size.height / 3,
                  child: SafeArea(
                    child: InkWell(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Premdfasf(
                              isClose: true,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xff009DFF),
                        ),
                        child: const Text(
                          'Buy Premium for \$0,99',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Inter',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
