import 'dart:async';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rate_crypto/firebase_options.dart';
import 'package:rate_crypto/rate_crypto_app.dart';
import 'package:rate_crypto/repositories/crypto_coins/abstract_crypto_coins_repository.dart';
import 'package:rate_crypto/repositories/crypto_coins/crypto_coins_repositories.dart';
import 'package:rate_crypto/repositories/models/crypto_coin.dart';
import 'package:rate_crypto/repositories/models/crypto_coin_detailis.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(() async {
    const cryptoCoinsBoxName = 'crypto_coins_list';

    final talker = TalkerFlutter.init();
    GetIt.I.registerSingleton(talker);
    GetIt.I<Talker>().debug('Talker start');

    final dio = Dio();
    dio.interceptors.add(TalkerDioLogger(
        talker: talker,
        settings: const TalkerDioLoggerSettings(
          printResponseData: false,
        )));

    Bloc.observer = TalkerBlocObserver(
        talker: talker,
        settings: const TalkerBlocLoggerSettings(
          printStateFullData: false,
          printEventFullData: false,
        ));

    FlutterError.onError = (details) => GetIt.I<Talker>().handle(
          details.exception,
          details.stack,
        );

    await Hive.initFlutter();
    Hive.registerAdapter(CryptoCoinDetailisAdapter());
    Hive.registerAdapter(CryptoCoinAdapter());

    final cryptoCoinsBox = await Hive.openBox<CryptoCoin>(cryptoCoinsBoxName);

    GetIt.I.registerLazySingleton<AbstractCryptoCoinsRepository>(
      () => CryptoCoinsRepositories(dio: dio, box: cryptoCoinsBox),
    );

    WidgetsFlutterBinding.ensureInitialized();
    final app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    talker.info(app.options.projectId);

    runApp(const RateCryptoApp());
  }, (exception, stackTrace) async {
    GetIt.I<Talker>().handle(exception, stackTrace);
  });
}
