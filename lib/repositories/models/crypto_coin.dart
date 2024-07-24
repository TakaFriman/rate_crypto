import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:rate_crypto/repositories/models/crypto_coin_detailis.dart';

part 'crypto_coin.g.dart';

@HiveType(typeId: 2)
class CryptoCoin extends Equatable {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final CryptoCoinDetailis details;

  const CryptoCoin({
    required this.name,
    required this.details,
  });

  @override
  List<Object> get props => [name, details];
}
