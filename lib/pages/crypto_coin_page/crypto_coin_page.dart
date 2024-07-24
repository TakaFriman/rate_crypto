import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rate_crypto/pages/crypto_coin_page/bloc/crypto_coin_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rate_crypto/pages/crypto_coin_page/widgets/details_data_crypto_widget.dart';
import 'package:rate_crypto/pages/crypto_coin_page/widgets/price_crypto_widget.dart';
import 'package:rate_crypto/repositories/crypto_coins/abstract_crypto_coins_repository.dart';
import 'package:rate_crypto/repositories/models/crypto_coin.dart';

@RoutePage()
class CryptoCoinPage extends StatefulWidget {
  const CryptoCoinPage({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  State<CryptoCoinPage> createState() => _CryptoCoinPageState();
}

class _CryptoCoinPageState extends State<CryptoCoinPage> {
  final _coinDetailis = CryptoCoinBloc(GetIt.I<AbstractCryptoCoinsRepository>());

  @override
  void initState() {
    _coinDetailis.add(LoadCryptoCoin(currencyCode: widget.coin.name));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.coin.name),
        ),
        body: BlocBuilder<CryptoCoinBloc, CryptoCoinState>(
          bloc: _coinDetailis,
          builder: (context, state) {
            if (state is CryptoCoinLoaded) {
              final coin = state.coin;
              final coinDetailis = coin.details;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Image.network(coinDetailis.fullImageUrl, width: 150, height: 150),
                    // const SizedBox(height: 12),
                    // Text(coin.name),
                    const SizedBox(height: 12),
                    PriceCryptoWidget(coinDetailis: coinDetailis),
                    const SizedBox(height: 16),
                    DetailsDataCryptoWidget(coinDetailis: coinDetailis),
                  ]),
                ),
              );
            }
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.amber,
            ));
          },
        ));
  }
}
