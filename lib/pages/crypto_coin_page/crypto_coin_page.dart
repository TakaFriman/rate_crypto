import 'package:flutter/material.dart';

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
