import 'package:dio/dio.dart';
import 'package:rate_crypto/repositories/crypto_coins/abstract_crypto_coins_repository.dart';
import 'package:rate_crypto/repositories/models/crypto_coin.dart';
import 'package:rate_crypto/repositories/models/crypto_coin_detailis.dart';

class CryptoCoinsRepositories implements AbstractCryptoCoinsRepository {
  final Dio dio;
  CryptoCoinsRepositories({
    required this.dio,
  });

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AID,BSTN,USDC,DOGE,XRP,PEPE,USDT,WETH,CAG,DOV,BGG,BIO,SOL&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;

    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData = (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final details = CryptoCoinDetailis.fromJson(usdData);
      return CryptoCoin(
        name: e.key,
        details: details,
      );
    }).toList();

    return cryptoCoinsList;
  }

  @override
  Future<CryptoCoin> getCoinDetailis(String currencyCode) async {
    final response =
        await dio.get('https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;
    final details = CryptoCoinDetailis.fromJson(usdData);

    return CryptoCoin(
      name: currencyCode,
      details: details,
    );
  }
}
