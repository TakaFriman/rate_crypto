import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rate_crypto/pages/crypto_list_page/widgets/crypto_coin_tile.dart';
import 'package:rate_crypto/repositories/crypto_coins/abstract_crypto_coins_repository.dart';
import 'package:rate_crypto/repositories/crypto_coins/crypto_coins_repositories.dart';
import 'package:rate_crypto/repositories/models/crypto_coin.dart';

class CryptoListPage extends StatefulWidget {
  const CryptoListPage({super.key});

  @override
  State<CryptoListPage> createState() => _CryptoListPageState();
}

class _CryptoListPageState extends State<CryptoListPage> {
  List<CryptoCoin>? _cryptoCoinsList;
  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('crypto app'),
      ),
      body: _cryptoCoinsList == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemCount: _cryptoCoinsList!.length,
              itemBuilder: (context, index) {
                final coin = _cryptoCoinsList![index];
                return CryptoCoinTile(coin: coin);
              }),
    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinsList = await GetIt.I<AbstractCryptoCoinsRepository>().getCoinsList();
    setState(() {});
  }
}
