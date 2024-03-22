import 'package:apphud/apphud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skin_care_255/hhhhs/navbar_screen.dart';
import 'package:skin_care_255/main.dart';
import 'package:url_launcher/url_launcher.dart';

class Esafaf extends StatelessWidget {
  const Esafaf({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            launchUrl(Uri.parse(
                'https://doc-hosting.flycricket.io/pureaura-skincare-hub-terms-of-use/6ffa2aab-20bb-45f2-84e8-3d99bddd2819/terms'));
          },
          child: Text(
            'Term of Service',
            style: TextStyle(
              fontSize: 15.h,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              color: color ?? Colors.black.withOpacity(0.4),
              decoration: TextDecoration.underline,
              decorationColor: color ?? Colors.black.withOpacity(0.4),
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 1,
          height: 15.h,
          color: color ?? Colors.black.withOpacity(0.4),
        ),
        const Spacer(),
        InkWell(
          onTap: () async {
            final hasPremiumAccess = await Apphud.hasPremiumAccess();
            final hasActiveSubscription = await Apphud.hasActiveSubscription();
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
          child: Text(
            'Restore',
            style: TextStyle(
              fontSize: 15.h,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              color: color ?? Colors.black.withOpacity(0.4),
              decoration: TextDecoration.underline,
              decorationColor: color ?? Colors.black.withOpacity(0.4),
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 1,
          height: 15.h,
          color: color ?? Colors.black.withOpacity(0.4),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            launchUrl(Uri.parse(
                'https://doc-hosting.flycricket.io/pureaura-skincare-hub-privacy-policy/a2155d62-31bd-4cc9-ad3d-8ff7a90d8eed/privacy'));
          },
          child: Text(
            'Privacy Policy',
            style: TextStyle(
              fontSize: 15.h,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              color: color ?? Colors.black.withOpacity(0.4),
              decoration: TextDecoration.underline,
              decorationColor: color ?? Colors.black.withOpacity(0.4),
            ),
          ),
        ),
      ],
    );
  }
}
