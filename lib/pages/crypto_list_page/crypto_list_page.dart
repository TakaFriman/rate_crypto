import 'package:flutter/material.dart';
import 'package:rate_crypto/pages/crypto_list_page/widgets/crypto_coin_tile.dart';

class CryptoListPage extends StatefulWidget {
  const CryptoListPage({super.key});

  @override
  State<CryptoListPage> createState() => _CryptoListPageState();
}

class _CryptoListPageState extends State<CryptoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('crypto app'),
        ),
        body: ListView.separated(
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemCount: 10,
            itemBuilder: (context, index) {
              const coinName = 'Bitcoin';
              return const CryptoCoinTile(coinName: coinName);
            }));
  }
}
