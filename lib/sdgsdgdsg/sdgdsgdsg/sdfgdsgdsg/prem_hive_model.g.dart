// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prem_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewPosterModelAdapter extends TypeAdapter<HJmdsfsdfs> {
  @override
  final int typeId = 5;

  @override
  HJmdsfsdfs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HJmdsfsdfs(
      secondUrl: fields[0] as String,
      isOpen: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HJmdsfsdfs obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.secondUrl)
      ..writeByte(1)
      ..write(obj.isOpen);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewPosterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
