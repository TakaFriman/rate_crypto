import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:rate_crypto/repositories/crypto_coins/abstract_crypto_coins_repository.dart';
import 'package:rate_crypto/repositories/models/crypto_coin.dart';
import 'package:rate_crypto/repositories/models/crypto_coin_detailis.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoCoinsRepositories implements AbstractCryptoCoinsRepository {
  final Dio dio;
  final Box<CryptoCoin> box;
  CryptoCoinsRepositories({
    required this.dio,
    required this.box,
  });

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    var cryptoCoinsList = <CryptoCoin>[];
    try {
      cryptoCoinsList = await _fetchCoinListFromApi();

      final cryptoCoinsMap = {for (var e in cryptoCoinsList) e.name: e};
      await box.putAll(cryptoCoinsMap);
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      cryptoCoinsList = box.values.toList();
    }
    cryptoCoinsList.sort((a, b) => b.details.priceInUSD.compareTo(a.details.priceInUSD));
    return cryptoCoinsList;
  }

  Future<List<CryptoCoin>> _fetchCoinListFromApi() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,USDC,DOGE,XRP,PEPE,USDT,WETH,BGG,BIO,SOL&tsyms=USD');

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
    try {
      final coin = await _fetchCoinDetailisFromApi(currencyCode);
      box.put(currencyCode, coin);
      return coin;
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);

      return box.get(currencyCode)!;
    }
  }

  Future<CryptoCoin> _fetchCoinDetailisFromApi(String currencyCode) async {
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
