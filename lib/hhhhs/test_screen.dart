// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skin_care_255/hhhhs/result_screen.dart';
import 'package:skin_care_255/main.dart';
import 'package:skin_care_255/models/test_model_data.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final controller = PageController();
  int currPage = 0;

  List<OtvetModel> otvets = [];

  @override
  void initState() {
    for (var e in tests) {
      otvets.add(
        OtvetModel(qwest: e.qwestion),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
        titleTextStyle: TextStyle(
          fontFamily: family,
          fontSize: 24.h,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currPage = value;
                });
              },
              controller: controller,
              itemCount: tests.length,
              itemBuilder: (context, index) => pageTestWidget(
                tests[index],
                index + 1,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: currPage != 0
                        ? InkWell(
                            onTap: () {
                              controller.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                            child: Text(
                              'Previous',
                              style: TextStyle(
                                fontFamily: family,
                                fontSize: 16.h,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff009DFF),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),
                  Expanded(
                    flex: 4,
                    child: InkWell(
                      onTap: () {
                        final single = otvets.singleWhere(
                            (e) => e.qwest == tests[currPage].qwestion);

                        if (single.otvet.isNotEmpty) {
                          if (currPage != 11) {
                            controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          } else {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ResultScreen(otvets: otvets),
                              ),
                              (protected) => false,
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 2),
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              content: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFF1100),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  'Please select a test answer',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: family,
                                    fontSize: 16.h,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(56),
                          color: const Color(0xff009DFF),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(56),
                                  color: Colors.white,
                                ),
                                child: Text(
                                  currPage != 11
                                      ? 'Next question'
                                      : 'Finish test',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: family,
                                    fontSize: 16.h,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff009DFF),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            const Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.white,
                              size: 33,
                            ),
                            SizedBox(width: 4.w),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget pageTestWidget(TestModel model, int number) {
    final single = otvets.singleWhere((e) => e.qwest == model.qwestion);
    return Column(
      children: [
        CachedNetworkImage(
          height: 240.h,
          width: double.infinity,
          fit: BoxFit.cover,
          // imageUrl: widget.model.image,
          imageUrl: model.image,
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
        SizedBox(height: 32.h),
        Text(
          '$number/12',
          style: TextStyle(
            fontFamily: family,
            fontSize: 32.h,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 24.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xff009DFF).withOpacity(0.6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.qwestion,
                  style: TextStyle(
                    fontFamily: family,
                    fontSize: 16.h,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 24.h),
                Column(
                  children: model.otvets
                      .map<Widget>(
                        (otvet) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                single.otvet = otvet;
                                single.type = (model.otvets.indexOf(otvet) + 1)
                                    .toString();
                              });
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                single.otvet == otvet
                                    ? Image.asset(
                                        'assets/images/unSelectedTest.png',
                                        height: 16.h,
                                      )
                                    : Image.asset(
                                        'assets/images/selectedTest.png',
                                        height: 16,
                                      ),
                                const SizedBox(width: 8),
                                Flexible(
                                  child: Text(
                                    otvet,
                                    style: TextStyle(
                                      fontFamily: family,
                                      fontSize: 12.h,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class OtvetModel {
  final String qwest;
  String otvet;
  String type;
  OtvetModel({
    required this.qwest,
    this.otvet = '',
    this.type = '',
  });
}
