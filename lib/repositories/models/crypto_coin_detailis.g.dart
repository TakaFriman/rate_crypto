// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_detailis.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoCoinDetailisAdapter extends TypeAdapter<CryptoCoinDetailis> {
  @override
  final int typeId = 1;

  @override
  CryptoCoinDetailis read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CryptoCoinDetailis(
      toSymbol: fields[5] as String,
      lastUpdate: fields[4] as DateTime,
      priceInUSD: fields[0] as double,
      imageUrl: fields[1] as String,
      low24Hour: fields[2] as double,
      high24Hours: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CryptoCoinDetailis obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.priceInUSD)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.low24Hour)
      ..writeByte(3)
      ..write(obj.high24Hours)
      ..writeByte(4)
      ..write(obj.lastUpdate)
      ..writeByte(5)
      ..write(obj.toSymbol);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoCoinDetailisAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoinDetailis _$CryptoCoinDetailisFromJson(Map<String, dynamic> json) =>
    CryptoCoinDetailis(
      toSymbol: json['TOSYMBOL'] as String,
      lastUpdate: CryptoCoinDetailis._dateTimeFromJson(
          (json['LASTUPDATE'] as num).toInt()),
      priceInUSD: (json['PRICE'] as num).toDouble(),
      imageUrl: json['IMAGEURL'] as String,
      low24Hour: (json['LOW24HOUR'] as num).toDouble(),
      high24Hours: (json['HIGH24HOUR'] as num).toDouble(),
    );

Map<String, dynamic> _$CryptoCoinDetailisToJson(CryptoCoinDetailis instance) =>
    <String, dynamic>{
      'PRICE': instance.priceInUSD,
      'IMAGEURL': instance.imageUrl,
      'LOW24HOUR': instance.low24Hour,
      'HIGH24HOUR': instance.high24Hours,
      'LASTUPDATE': CryptoCoinDetailis._dateTimeToJson(instance.lastUpdate),
      'TOSYMBOL': instance.toSymbol,
    };
