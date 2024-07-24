import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rate_crypto/router/router.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'theme/app_theme.dart';

class RateCryptoApp extends StatelessWidget {
  const RateCryptoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routes: routes,
      navigatorObservers: [TalkerRouteObserver(GetIt.I<Talker>())],
    );
  }
}
