import 'package:flutter/material.dart';
import 'package:rate_crypto/repositories/models/crypto_coin_detailis.dart';

class PriceCryptoWidget extends StatelessWidget {
  const PriceCryptoWidget({super.key, required this.coinDetailis});

  final CryptoCoinDetailis coinDetailis;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
            color: Color.fromARGB(246, 13, 13, 13),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            )),
        child: Text(
          '${coinDetailis.priceInUSD.toStringAsFixed(7)} \$',
        ));
  }
}
