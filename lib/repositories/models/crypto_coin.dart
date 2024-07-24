import 'package:equatable/equatable.dart';
import 'package:rate_crypto/repositories/models/crypto_coin_detailis.dart';

class CryptoCoin extends Equatable {
  final String name;
  final CryptoCoinDetailis details;
  const CryptoCoin({
    required this.name,
    required this.details,
  });

  @override
  List<Object> get props => [name, details];
}
