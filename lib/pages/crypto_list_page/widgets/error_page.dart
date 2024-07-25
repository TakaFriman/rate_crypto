import 'package:flutter/material.dart';
import 'package:rate_crypto/pages/crypto_list_page/bloc/crypto_list_bloc.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required CryptoListBloc cryptoListBloc}) : _cryptoListBloc = cryptoListBloc;

  final CryptoListBloc _cryptoListBloc;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Произошла ошибка!'),
        Text(
          'Пожалуйста, попробуйте позже',
          style: theme.textTheme.labelSmall?.copyWith(fontSize: 14),
        ),
        const SizedBox(height: 24),
        TextButton(
          onPressed: () {
            _cryptoListBloc.add(LoadCryptoList());
          },
          child: const Text('Попробовать снова'),
        )
      ],
    ));
  }
}
