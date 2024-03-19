import 'package:flutter/material.dart';
import 'package:skin_care_255/main.dart';
import 'package:skin_care_255/models/photo_hive_model/photo_hive_model.dart';

class NoteAddScreen extends StatelessWidget {
  const NoteAddScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NoteAddScreen'),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () async {
              await photoHive.add(
                PhotoHiveModel(
                  date: 'date',
                  title: 'title',
                  image: 'image',
                ),
              );
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.red,
              height: 100,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ],
      ),
    );
  }
}
