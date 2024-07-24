import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_detailis.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class CryptoCoinDetailis extends Equatable {
  
  @HiveField(0)
  @JsonKey(name: 'PRICE')
  final double priceInUSD;

  @HiveField(1)
  @JsonKey(name: 'IMAGEURL')
  final String imageUrl;

  String get fullImageUrl => 'https://www.cryptocompare.com/$imageUrl';

  @HiveField(2)
  @JsonKey(name: 'LOW24HOUR')
  final double low24Hour;

  @HiveField(3)
  @JsonKey(name: 'HIGH24HOUR')
  final double high24Hours;

  @HiveField(4)
  @JsonKey(
    name: 'LASTUPDATE',
    toJson: _dateTimeToJson,
    fromJson: _dateTimeFromJson,
  )
  final DateTime lastUpdate;

  @HiveField(5)
  @JsonKey(name: 'TOSYMBOL')
  final String toSymbol;

  factory CryptoCoinDetailis.fromJson(Map<String, dynamic> json) => _$CryptoCoinDetailisFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinDetailisToJson(this);

  static int _dateTimeToJson(DateTime date) => date.millisecondsSinceEpoch;

  static DateTime _dateTimeFromJson(int ms) => DateTime.fromMillisecondsSinceEpoch(ms);

  const CryptoCoinDetailis({
    required this.toSymbol,
    required this.lastUpdate,
    required this.priceInUSD,
    required this.imageUrl,
    required this.low24Hour,
    required this.high24Hours,
  });

  @override
  List<Object> get props => [
        priceInUSD,
        imageUrl,
        low24Hour,
        high24Hours,
        lastUpdate,
        toSymbol,
      ];
}
