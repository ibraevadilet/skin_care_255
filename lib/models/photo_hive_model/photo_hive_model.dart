import 'package:hive_flutter/hive_flutter.dart';

part 'photo_hive_model.g.dart';

@HiveType(typeId: 2)
class PhotoHiveModel extends HiveObject {
  @HiveField(0)
  String date;
  @HiveField(1)
  String title;
  @HiveField(2)
  String? image;

  PhotoHiveModel({
    required this.date,
    required this.title,
    this.image,
  });
}
