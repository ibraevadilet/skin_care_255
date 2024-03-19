import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skin_care_255/hhhhs/navbar_screen.dart';
import 'package:skin_care_255/hhhhs/pagev_screen.dart';
import 'package:skin_care_255/widgets/notification_handler.dart';
import 'package:skin_care_255/models/notification_model/notification_hive_model.dart';
import 'package:skin_care_255/models/photo_hive_model/photo_hive_model.dart';

late final SharedPreferences localData;
const String family = 'SF-Pro';
late final Box<PhotoHiveModel> photoHive;
late final Box<NotificationHiveModel> notificatonHive;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await NotificationService().init(); //
  await NotificationService().requestIOSPermissions(); //
  await Hive.initFlutter();
  Hive.registerAdapter(PhotoHiveModelAdapter());
  Hive.registerAdapter(NotificationHiveModelAdapter());
  photoHive = await Hive.openBox<PhotoHiveModel>('photoHive');
  notificatonHive = await Hive.openBox<NotificationHiveModel>('notifHive');
  localData = await SharedPreferences.getInstance();
  final isOpend = localData.getBool('iff') ?? false;

  await localData.setBool('iff', true);
  if (isOpend) {
    runApp(const PrNavigatorApp(childWidget: NavbarScreen()));
  } else {
    runApp(const PrNavigatorApp());
  }
}

class PrNavigatorApp extends StatelessWidget {
  const PrNavigatorApp({super.key, this.childWidget});
  final Widget? childWidget;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pregnancy Navigator App',
        theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
          ),
          scaffoldBackgroundColor: Colors.white,
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
        home: childWidget ?? const PagevScreen(),
      ),
    );
  }
}
