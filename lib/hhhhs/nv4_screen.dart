import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skin_care_255/main.dart';

class Nv4Screen extends StatelessWidget {
  const Nv4Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Notifications'),
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
              onTap: () {},
              child: Image.asset(
                'assets/images/add.png',
                height: 32.h,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(),
        ],
      ),
    );
  }
}
