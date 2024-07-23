import 'package:equatable/equatable.dart';

class CryptoCoinDetailis extends Equatable {
  final String name;
  final double priceInUSD;
  final String imageUrl;
  final double low24Hours;
  final double high24Hours;
  final DateTime lastUpdate;
  final String toSymbol;
  const CryptoCoinDetailis({
    required this.toSymbol,
    required this.lastUpdate,
    required this.name,
    required this.priceInUSD,
    required this.imageUrl,
    required this.low24Hours,
    required this.high24Hours,
  });

  @override
  List<Object?> get props => [
        name,
        priceInUSD,
        imageUrl,
        low24Hours,
        high24Hours,
        lastUpdate,
        toSymbol,
      ];
}
