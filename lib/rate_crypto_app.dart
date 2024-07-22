import 'package:flutter/material.dart';
import 'package:rate_crypto/router/router.dart';

import 'theme/app_theme.dart';

class RateCryptoApp extends StatelessWidget {
  const RateCryptoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routes: routes,
    );
  }
}
