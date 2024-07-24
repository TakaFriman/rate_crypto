import 'package:flutter/material.dart';
import 'package:rate_crypto/repositories/models/crypto_coin_detailis.dart';

class DetailsDataCryptoWidget extends StatelessWidget {
  const DetailsDataCryptoWidget({super.key, required this.coinDetailis});

  final CryptoCoinDetailis coinDetailis;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: const BoxDecoration(
                color: Color.fromARGB(246, 13, 13, 13),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                )),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('High 24 Hour'),
                SizedBox(height: 6),
                Text('Low 24 Hour'),
              ],
            ),
          ),
        ),
        const SizedBox(width: 32),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: const BoxDecoration(
                color: Color.fromARGB(246, 13, 13, 13),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${coinDetailis.high24Hours.toStringAsFixed(5)} \$'),
                const SizedBox(height: 6),
                Text('${coinDetailis.low24Hour.toStringAsFixed(5)} \$'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
