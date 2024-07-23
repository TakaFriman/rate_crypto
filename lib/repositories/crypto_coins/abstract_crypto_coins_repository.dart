import 'package:rate_crypto/repositories/models/crypto_coin.dart';
import 'package:rate_crypto/repositories/models/crypto_coin_detailis.dart';

abstract class AbstractCryptoCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();
  Future<CryptoCoinDetailis> getCoinDetailis(String currencyCode);
}
