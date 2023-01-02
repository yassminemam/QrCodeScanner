// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QrCodeAdapter extends TypeAdapter<QrCode> {
  @override
  final int typeId = 1;

  @override
  QrCode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QrCode(
      id: fields[0] as String,
      type: fields[1] as String,
      data: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, QrCode obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QrCodeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
