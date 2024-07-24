import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rate_crypto/pages/crypto_coin_page/crypto_coin_page.dart';
import 'package:rate_crypto/pages/crypto_list_page/crypto_list_page.dart';
import 'package:rate_crypto/repositories/models/crypto_coin.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CryptoListRoute.page, path: '/'),
        AutoRoute(page: CryptoCoinRoute.page),
      ];
}

// final routes = {
//   '/coin': (context) => const CryptoCoinPage(),
//   '/': (context) => const CryptoListPage(),

