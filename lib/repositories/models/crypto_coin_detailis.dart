import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin_detailis.g.dart';

@JsonSerializable()
class CryptoCoinDetailis extends Equatable {
  @JsonKey(name: 'PRICE')
  final double priceInUSD;

  @JsonKey(name: 'IMAGEURL')
  final String imageUrl;

  String get fullImageUrl => 'https://www.cryptocompare.com/$imageUrl';

  @JsonKey(name: 'LOW24HOUR')
  final double low24Hour;

  @JsonKey(name: 'HIGH24HOUR')
  final double high24Hours;

  @JsonKey(name: 'LASTUPDATE', toJson: _dateTimeToJson, fromJson: _dateTimeFromJson)
  final DateTime lastUpdate;

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
