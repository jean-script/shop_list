// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_shop_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductShopDTOAdapter extends TypeAdapter<ProductShopDTO> {
  @override
  final int typeId = 1;

  @override
  ProductShopDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductShopDTO(
      id: fields[0] as String,
      listId: fields[1] as String,
      name: fields[2] as String,
      amount: fields[3] as int,
      price: fields[4] as double,
      isChecked: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ProductShopDTO obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.listId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.isChecked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductShopDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
