// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_history_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PurchaseHistoryAdapter extends TypeAdapter<PurchaseHistory> {
  @override
  final int typeId = 3;

  @override
  PurchaseHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PurchaseHistory(
      id: fields[0] as String,
      name: fields[1] as String,
      date: fields[2] as DateTime,
      total: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, PurchaseHistory obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PurchaseHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
