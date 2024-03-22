import 'package:apphud/apphud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skin_care_255/hhhhs/navbar_screen.dart';
import 'package:skin_care_255/main.dart';
import 'package:skin_care_255/widgets/adfs_widgets.dart';

class Premdfasf extends StatefulWidget {
  const Premdfasf({super.key, this.isClose = false});
  final bool isClose;

  @override
  State<Premdfasf> createState() => _PremdfasfState();
}

class _PremdfasfState extends State<Premdfasf> {
  bool sfasfas = false;
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
                  if (widget.isClose) {
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
                      setState(() {
                        sfasfas = true;
                      });

                      final apphudPaywalls = await Apphud.paywalls();
                      print(apphudPaywalls);
                      await Apphud.purchase(
                        product: apphudPaywalls?.paywalls.first.products?.first,
                      ).whenComplete(
                        () async {
                          if (await Apphud.hasPremiumAccess() ||
                              await Apphud.hasActiveSubscription()) {
                            final hasPremiumAccess =
                                await Apphud.hasPremiumAccess();
                            final hasActiveSubscription =
                                await Apphud.hasActiveSubscription();
                            if (hasPremiumAccess || hasActiveSubscription) {
                              await localData.setBool('prem', true);
                              showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    CupertinoAlertDialog(
                                  title: const Text('Success!'),
                                  content: const Text(
                                      'Your purchase has been restored!'),
                                  actions: [
                                    CupertinoDialogAction(
                                      isDefaultAction: true,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                const NavbarScreen(),
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
                                builder: (BuildContext context) =>
                                    CupertinoAlertDialog(
                                  title: const Text('Restore purchase'),
                                  content: const Text(
                                      'Your purchase is not found. Write to support: https://sites.google.com/view/pureaura/support-form'),
                                  actions: [
                                    CupertinoDialogAction(
                                      isDefaultAction: true,
                                      onPressed: () =>
                                          {Navigator.of(context).pop()},
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                ),
                              );
                            }
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const NavbarScreen(),
                              ),
                              (route) => false,
                            );
                          }
                        },
                      );
                      setState(() {
                        sfasfas = false;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xff009DFF),
                      ),
                      child: sfasfas
                          ? const CircularProgressIndicator.adaptive()
                          : const Text(
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
