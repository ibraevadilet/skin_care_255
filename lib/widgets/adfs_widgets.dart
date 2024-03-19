import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            launchUrl(Uri.parse('https://google.com'));
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
            // await PremiumFitnessZone.buyFitnessZone(context);
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
            launchUrl(Uri.parse('https://google.com'));
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
