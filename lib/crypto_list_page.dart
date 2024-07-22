import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CryptoListPage extends StatefulWidget {
  const CryptoListPage({super.key});

  @override
  State<CryptoListPage> createState() => _CryptoListPageState();
}

class _CryptoListPageState extends State<CryptoListPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('crypto app'),
        ),
        body: ListView.separated(
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemCount: 10,
            itemBuilder: (context, index) {
              const coinName = 'Bitcoin';
              return ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/coin',
                    arguments: coinName,
                  );
                },
                trailing: const Icon(Icons.arrow_forward_ios),
                leading: SvgPicture.asset('assets/svg/bitcoin.svg', width: 40, height: 40),
                title: Text(coinName, style: theme.textTheme.bodyMedium),
                subtitle: Text('Цена', style: theme.textTheme.labelSmall),
              );
            }));
  }
}
