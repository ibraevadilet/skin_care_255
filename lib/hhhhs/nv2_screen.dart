import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skin_care_255/main.dart';

class Nv2Screen extends StatelessWidget {
  const Nv2Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Video tutorials'),
        titleTextStyle: TextStyle(
          fontFamily: family,
          fontSize: 28.h,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Container(),
        ],
      ),
    );
  }
}
