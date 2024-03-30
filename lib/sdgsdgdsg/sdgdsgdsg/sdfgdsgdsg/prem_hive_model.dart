import 'package:hive/hive.dart';

part 'prem_hive_model.g.dart';

@HiveType(typeId: 5)
class HJmdsfsdfs extends HiveObject {
  @HiveField(0)
  String secondUrl;

  @HiveField(1)
  bool isOpen;
  HJmdsfsdfs({
    required this.secondUrl,
    required this.isOpen,
  });
}
