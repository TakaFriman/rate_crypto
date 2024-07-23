import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rate_crypto/pages/crypto_list_page/bloc/crypto_list_bloc.dart';
import 'package:rate_crypto/pages/crypto_list_page/widgets/crypto_coin_tile.dart';
import 'package:rate_crypto/repositories/crypto_coins/abstract_crypto_coins_repository.dart';

class CryptoListPage extends StatefulWidget {
  const CryptoListPage({super.key});

  @override
  State<CryptoListPage> createState() => _CryptoListPageState();
}

class _CryptoListPageState extends State<CryptoListPage> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCryptoCoinsRepository>());
  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Список криптовалют'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _cryptoListBloc.add(LoadCryptoList(completer: completer));
            return completer.future;
          },
          child: BlocBuilder<CryptoListBloc, CryptoListBlocState>(
            bloc: _cryptoListBloc,
            builder: (context, state) {
              if (state is CryptoListLoaded) {
                return ListView.separated(
                    padding: const EdgeInsets.only(top: 16),
                    separatorBuilder: (context, index) => const Divider(height: 1),
                    itemCount: state.coinsList.length,
                    itemBuilder: (context, index) {
                      final coin = state.coinsList[index];
                      return CryptoCoinTile(coin: coin);
                    });
              }
              if (state is CryptoListLoadingFailure) {
                return Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Произошла ошибка!'),
                    Text(
                      'Пожалуйста, попробуйте позже',
                      style: theme.textTheme.labelSmall?.copyWith(fontSize: 14),
                    ),
                    const SizedBox(height: 24),
                    TextButton(
                      onPressed: () {
                        _cryptoListBloc.add(LoadCryptoList());
                      },
                      child: const Text('Попробовать снова'),
                    )
                  ],
                ));
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
