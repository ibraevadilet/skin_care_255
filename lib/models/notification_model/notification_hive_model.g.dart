// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationHiveModelAdapter extends TypeAdapter<NotificationHiveModel> {
  @override
  final int typeId = 3;

  @override
  NotificationHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationHiveModel(
      date: fields[0] as String,
      time: fields[1] as String,
      title: fields[2] as String,
      dateTime: fields[43] as DateTime,
      isChecked: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.isChecked)
      ..writeByte(43)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
