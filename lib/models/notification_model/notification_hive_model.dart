import 'package:hive_flutter/hive_flutter.dart';

part 'notification_hive_model.g.dart';

@HiveType(typeId: 3)
class NotificationHiveModel extends HiveObject {
  @HiveField(0)
  String date;
  @HiveField(1)
  String time;
  @HiveField(2)
  String title;
  @HiveField(3)
  bool isChecked;
  @HiveField(43)
  DateTime dateTime;

  NotificationHiveModel({
    required this.date,
    required this.time,
    required this.title,
    required this.dateTime,
    this.isChecked = true,
  });
}
