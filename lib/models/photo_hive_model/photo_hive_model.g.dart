// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhotoHiveModelAdapter extends TypeAdapter<PhotoHiveModel> {
  @override
  final int typeId = 2;

  @override
  PhotoHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PhotoHiveModel(
      date: fields[0] as String,
      title: fields[1] as String,
      image: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PhotoHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
