import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rate_crypto/rate_crypto_app.dart';
import 'package:rate_crypto/repositories/crypto_coins/abstract_crypto_coins_repository.dart';
import 'package:rate_crypto/repositories/crypto_coins/crypto_coins_repositories.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCryptoCoinsRepository>(() => CryptoCoinsRepositories(dio: Dio()));
  runApp(const RateCryptoApp());
}
