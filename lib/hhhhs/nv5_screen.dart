import 'package:apphud/apphud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skin_care_255/hhhhs/navbar_screen.dart';
import 'package:skin_care_255/hhhhs/premdfasf.dart';
import 'package:skin_care_255/main.dart';
import 'package:url_launcher/url_launcher.dart';

class Nv5Screen extends StatefulWidget {
  const Nv5Screen({super.key});

  @override
  State<Nv5Screen> createState() => _Nv5ScreenState();
}

class _Nv5ScreenState extends State<Nv5Screen> {
  bool isPrem = false;
  @override
  void initState() {
    isPrem = localData.getBool('prem') ?? false;
    super.initState();
  }

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
              onTap: () {
                launchUrl(Uri.parse(
                    'https://doc-hosting.flycricket.io/pureaura-skincare-hub-privacy-policy/a2155d62-31bd-4cc9-ad3d-8ff7a90d8eed/privacy'));
              },
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
              onTap: () {
                launchUrl(Uri.parse(
                    'https://doc-hosting.flycricket.io/pureaura-skincare-hub-terms-of-use/6ffa2aab-20bb-45f2-84e8-3d99bddd2819/terms'));
              },
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
              onTap: () {
                launchUrl(Uri.parse(
                    'https://sites.google.com/view/pureaura/support-form'));
              },
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
              onTap: () async {
                final hasPremiumAccess = await Apphud.hasPremiumAccess();
                final hasActiveSubscription =
                    await Apphud.hasActiveSubscription();
                if (hasPremiumAccess || hasActiveSubscription) {
                  await localData.setBool('prem', true);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: const Text('Success!'),
                      content: const Text('Your purchase has been restored!'),
                      actions: [
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const NavbarScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          child: const Text('Ok'),
                        ),
                      ],
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: const Text('Restore purchase'),
                      content: const Text(
                          'Your purchase is not found. Write to support: https://sites.google.com/view/pureaura/support-form'),
                      actions: [
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          onPressed: () => {Navigator.of(context).pop()},
                          child: const Text('Ok'),
                        ),
                      ],
                    ),
                  );
                }
              },
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
            SizedBox(height: 24.h),
            if (!isPrem)
              InkWell(
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
          ],
        ),
      ),
    );
  }
}
