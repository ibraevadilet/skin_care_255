import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skin_care_255/hhhhs/premdfasf.dart';
import 'package:skin_care_255/main.dart';
import 'package:skin_care_255/widgets/adfs_widgets.dart';

class PagevScreen extends StatefulWidget {
  const PagevScreen({super.key});

  @override
  State<PagevScreen> createState() => _PagevScreenState();
}

class _PagevScreenState extends State<PagevScreen> {
  int currantPage = 0;
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const ClampingScrollPhysics(),
            onPageChanged: (value) {
              currantPage = value;
            },
            controller: controller,
            children: const [
              PGWIDGET(
                image: 'assets/images/pg1.png',
                title: 'Skin type testing',
                descr:
                    'Take a test to determine your skin type and get recommendations',
              ),
              PGWIDGET(
                image: 'assets/images/pg2.png',
                title: 'Video tutorials',
                descr: 'Watch video tutorials on proper skin care methods',
              ),
              PGWIDGET(
                image: 'assets/images/pg3.png',
                title: 'Photo diary',
                descr:
                    'Input and record your progress during your skin care routine',
              ),
            ],
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 12,
            child: SafeArea(
              child: Column(
                children: [
                  IntrinsicHeight(
                    child: InkWell(
                      onTap: () {
                        if (currantPage == 2) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Premdfasf(),
                            ),
                            (protected) => false,
                          );
                        } else {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        }
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
                          'Next',
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
                  SizedBox(height: 24.h),
                  Esafaf(
                    color: Colors.white.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PGWIDGET extends StatelessWidget {
  const PGWIDGET({
    super.key,
    required this.image,
    required this.title,
    required this.descr,
  });
  final String image;
  final String title;
  final String descr;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 24,
          right: 24,
          bottom: MediaQuery.of(context).size.height / 4,
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: family,
                  fontSize: 28.h,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                descr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: family,
                  fontSize: 16.h,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
