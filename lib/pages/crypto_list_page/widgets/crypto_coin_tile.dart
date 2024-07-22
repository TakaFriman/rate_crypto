import 'package:flutter/material.dart';
import 'package:rate_crypto/repositories/models/crypto_coin.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({super.key, required this.coin});

  final CryptoCoin coin;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: coin.name);
      },
      trailing: const Icon(Icons.arrow_forward_ios),
      leading: Image.network(coin.imageUrl),
      title: Text(coin.name, style: theme.textTheme.bodyMedium),
      subtitle: Text('${coin.priceInUSD}\$', style: theme.textTheme.labelSmall),
    );
  }
}
