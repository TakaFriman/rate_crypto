import 'package:rate_crypto/pages/crypto_coin_page/crypto_coin_page.dart';
import 'package:rate_crypto/pages/crypto_list_page/crypto_list_page.dart';

final routes = {
  '/coin': (context) => const CryptoCoinPage(),
  '/': (context) => const CryptoListPage(),
};
