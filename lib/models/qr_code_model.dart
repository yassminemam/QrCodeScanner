import 'package:hive/hive.dart';

part 'qr_code_model.g.dart';

@HiveType(typeId: 1)
class QrCode{
  @HiveField(0)
  String id;
  @HiveField(1)
  String? type;
  @HiveField(2)
  String? data;

  QrCode({required this.id, required this.type, required this.data});
}