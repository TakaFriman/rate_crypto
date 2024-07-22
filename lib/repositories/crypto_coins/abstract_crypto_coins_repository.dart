import 'package:rate_crypto/repositories/models/crypto_coin.dart';

abstract class AbstractCryptoCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();
}
