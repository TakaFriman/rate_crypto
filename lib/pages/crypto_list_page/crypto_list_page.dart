import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rate_crypto/pages/crypto_list_page/bloc/crypto_list_bloc.dart';
import 'package:rate_crypto/pages/crypto_list_page/widgets/crypto_coin_tile.dart';
import 'package:rate_crypto/pages/crypto_list_page/widgets/error_page.dart';
import 'package:rate_crypto/repositories/crypto_coins/abstract_crypto_coins_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Список криптовалют'),
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         Navigator.of(context).push(MaterialPageRoute(
          //             builder: (context) => TalkerScreen(
          //                   talker: GetIt.I<Talker>(),
          //                 )));
          //       },
          //       icon: const Icon(Icons.document_scanner_outlined))
          // ],
        ),
        body: RefreshIndicator(
          backgroundColor: Colors.transparent,
          color: Colors.amber,
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
                return ErrorPage(cryptoListBloc: _cryptoListBloc);
              }
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.amber,
              ));
            },
          ),
        ));
  }
}
