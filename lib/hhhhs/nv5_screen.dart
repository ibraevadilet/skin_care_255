import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skin_care_255/main.dart';

class Nv5Screen extends StatelessWidget {
  const Nv5Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Settings'),
        titleTextStyle: TextStyle(
          fontFamily: family,
          fontSize: 28.h,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.r),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            InkWell(
              onTap: () {},
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                          fontSize: 16.h,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 26.h,
              color: Colors.black.withOpacity(0.4),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Terms and Conditions',
                      style: TextStyle(
                          fontSize: 16.h,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 26.h,
              color: Colors.black.withOpacity(0.4),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Support',
                      style: TextStyle(
                          fontSize: 16.h,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 26.h,
              color: Colors.black.withOpacity(0.4),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Restore',
                      style: TextStyle(
                          fontSize: 16.h,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 26.h,
              color: Colors.black.withOpacity(0.4),
            ),
          ],
        ),
      ),
    );
  }
}
