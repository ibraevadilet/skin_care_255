import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skin_care_255/hhhhs/navbar_screen.dart';
import 'package:skin_care_255/main.dart';
import 'package:skin_care_255/widgets/adfs_widgets.dart';

class Premdfasf extends StatelessWidget {
  const Premdfasf({super.key, this.isClose = false});
  final bool isClose;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              Expanded(
                child: Image.asset(
                  'assets/images/pr1.png',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
            ],
          ),
          Positioned(
            top: 20,
            right: 20,
            child: SafeArea(
              child: InkWell(
                onTap: () {
                  if (isClose) {
                    Navigator.pop(context);
                  } else {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavbarScreen(),
                      ),
                      (protected) => false,
                    );
                  }
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ),
          IntrinsicHeight(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 32.h),
                  Text(
                    'Premium',
                    style: TextStyle(
                      fontFamily: family,
                      fontSize: 28.h,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Image.asset('assets/images/pr_info.png'),
                  SizedBox(height: 24.h),
                  InkWell(
                    onTap: () async {
                      await localData.setBool('prem', true);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavbarScreen(),
                        ),
                        (protected) => false,
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
                  SizedBox(height: 24.h),
                  const SafeArea(
                    top: false,
                    child: Esafaf(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
