import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rate_crypto/router/router.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'theme/app_theme.dart';

class RateCryptoApp extends StatefulWidget {
  const RateCryptoApp({super.key});

  @override
  State<RateCryptoApp> createState() => _RateCryptoAppState();
}

class _RateCryptoAppState extends State<RateCryptoApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [
          TalkerRouteObserver(GetIt.I<Talker>()),
        ],
      ),
    );
  }
}
