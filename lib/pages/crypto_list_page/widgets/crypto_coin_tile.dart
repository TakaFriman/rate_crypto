import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rate_crypto/repositories/models/crypto_coin.dart';
import 'package:rate_crypto/router/router.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({super.key, required this.coin});

  final CryptoCoin coin;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final coinDetailis = coin.details;
    return ListTile(
      onTap: () {
        AutoRouter.of(context).push(CryptoCoinRoute(coin: coin));
        // Navigator.of(context).pushNamed('/coin', arguments: coin.name);
      },
      trailing: const Icon(Icons.arrow_forward_ios),
      leading: Image.network(coinDetailis.fullImageUrl),
      title: Text(coin.name, style: theme.textTheme.bodyMedium),
      subtitle: Text('${coinDetailis.priceInUSD}\$', style: theme.textTheme.labelSmall),
    );
  }
}
