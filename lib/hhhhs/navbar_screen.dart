import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skin_care_255/hhhhs/nv1_screen.dart';
import 'package:skin_care_255/hhhhs/nv2_screen.dart';
import 'package:skin_care_255/hhhhs/nv3_screen.dart';
import 'package:skin_care_255/hhhhs/nv4_screen.dart';
import 'package:skin_care_255/hhhhs/nv5_screen.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key, this.indexIndexFrom = 0});
  final int indexIndexFrom;

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  late int currantIndex = widget.indexIndexFrom;

  final widgets = <Widget>[
    const Nv1Screen(),
    const Nv2Screen(),
    const Nv3Screen(),
    const Nv4Screen(),
    const Nv5Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currantIndex,
        children: widgets,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: const Color(0xff009DFF),
        child: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () => setState(() => currantIndex = 0),
                child: Image.asset(
                  'assets/images/nv1.png',
                  color: currantIndex == 0
                      ? Colors.white
                      : Colors.white.withOpacity(0.6),
                  width: 32.w,
                ),
              ),
              InkWell(
                onTap: () => setState(() => currantIndex = 1),
                child: Image.asset(
                  'assets/images/nv2.png',
                  color: currantIndex == 1
                      ? Colors.white
                      : Colors.white.withOpacity(0.6),
                  width: 32.w,
                ),
              ),
              InkWell(
                onTap: () => setState(() => currantIndex = 2),
                child: Image.asset(
                  'assets/images/nv3.png',
                  color: currantIndex == 2
                      ? Colors.white
                      : Colors.white.withOpacity(0.6),
                  width: 32.w,
                ),
              ),
              InkWell(
                onTap: () => setState(() => currantIndex = 3),
                child: Image.asset(
                  'assets/images/nv4.png',
                  color: currantIndex == 3
                      ? Colors.white
                      : Colors.white.withOpacity(0.6),
                  width: 32.w,
                ),
              ),
              InkWell(
                onTap: () => setState(() => currantIndex = 4),
                child: Image.asset(
                  'assets/images/nv5.png',
                  color: currantIndex == 4
                      ? Colors.white
                      : Colors.white.withOpacity(0.6),
                  width: 32.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
