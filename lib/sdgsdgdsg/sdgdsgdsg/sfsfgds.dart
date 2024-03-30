import 'package:hive/hive.dart';
import 'package:skin_care_255/sdgsdgdsg/sdgdsgdsg/sdfgdsgdsg/prem_hive_model.dart';

class Hjkfskjfsgssd {
  Future<HJmdsfsdfs?> dsgfsdg() async {
    final box = await Hive.openBox<HJmdsfsdfs>('prem');
    final result = box.get('keyPrem');
    return result;
  }

  sdfsdgds(HJmdsfsdfs model) async {
    final box = await Hive.openBox<HJmdsfsdfs>('prem');
    box.put('keyPrem', model);
  }
}
