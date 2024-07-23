import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rate_crypto/repositories/crypto_coins/abstract_crypto_coins_repository.dart';
import 'dart:async';
import 'package:rate_crypto/repositories/models/crypto_coin_detailis.dart';

part 'crypto_coin_event.dart';
part 'crypto_coin_state.dart';

class CryptoCoinBloc extends Bloc<CryptoCoinEvent, CryptoCoinState> {
  CryptoCoinBloc(this.coinsRepository) : super(const CryptoCoinState()) {
    on<LoadCryptoCoin>(_load);
  }
  final AbstractCryptoCoinsRepository coinsRepository;

  Future<void> _load(
    LoadCryptoCoin event,
    Emitter<CryptoCoinState> emit,
  ) async {
    try {
      if (state is! CryptoCoinLoaded) {
        emit(CryptoCoinLoading());
      }
      final coinDetailis = await coinsRepository.getCoinDetailis(event.currencyCode);
      emit(CryptoCoinLoaded(coin: coinDetailis));
    } catch (e) {
      throw Exception(e);
    }
  }
}
