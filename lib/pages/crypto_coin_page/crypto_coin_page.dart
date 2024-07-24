import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rate_crypto/pages/crypto_coin_page/bloc/crypto_coin_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rate_crypto/repositories/crypto_coins/abstract_crypto_coins_repository.dart';

class CryptoCoinPage extends StatefulWidget {
  const CryptoCoinPage({
    super.key,
  });

  @override
  State<CryptoCoinPage> createState() => _CryptoCoinPageState();
}

class _CryptoCoinPageState extends State<CryptoCoinPage> {
  String? coinName;
  final _coinDetailis = CryptoCoinBloc(GetIt.I<AbstractCryptoCoinsRepository>());
  // @override
  // void initState() {
  //   _coinDetailis.add(LoadCryptoCoin(currencyCode: coinName ?? 'BTC'));
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You mast provide String args');
    coinName = args as String;
    _coinDetailis.add(LoadCryptoCoin(currencyCode: coinName ?? 'BTC'));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<CryptoCoinBloc, CryptoCoinState>(
          bloc: _coinDetailis,
          builder: (context, state) {
            if (state is CryptoCoinLoaded) {
              final coin = state.coin;
              final coinDetailis = coin.details;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(coinDetailis.fullImageUrl, width: 150, height: 150),
                      const SizedBox(height: 12),
                      Text(coin.name),
                      const SizedBox(height: 12),
                      Text('${coinDetailis.priceInUSD.toStringAsFixed(7)} \$'),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('High 24 Hour'),
                          Text('${coinDetailis.high24Hours.toStringAsFixed(7)} \$'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Low 24 Hour'),
                          Text('${coinDetailis.low24Hour.toStringAsFixed(7)} \$'),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
