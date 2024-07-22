import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rate_crypto/theme/app_theme.dart';
import 'package:rate_crypto/crypto_list_page.dart';

void main() {
  runApp(const RateCryptoApp());
}

class RateCryptoApp extends StatelessWidget {
  const RateCryptoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      routes: {
        '/coin': (context) => const CryptoCoinPage(),
        '/': (context) => const CryptoListPage(),
      },
    );
  }
}

class CryptoCoinPage extends StatefulWidget {
  const CryptoCoinPage({super.key});

  @override
  State<CryptoCoinPage> createState() => _CryptoCoinPageState();
}

class _CryptoCoinPageState extends State<CryptoCoinPage> {
  String? coinName;
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You mast provide String args');
    coinName = args as String;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coinName ?? '...'),
      ),
      body: const Center(
        child: Text('sss'),
      ),
    );
  }
}
