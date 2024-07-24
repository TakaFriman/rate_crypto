// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin_detailis.dart';

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
