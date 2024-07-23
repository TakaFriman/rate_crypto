part of 'crypto_coin_bloc.dart';

abstract class CryptoCoinEvent extends Equatable {
  const CryptoCoinEvent();

  @override
  List<Object> get props => [];
}

class LoadCryptoCoin extends CryptoCoinEvent {
  final String currencyCode;

  const LoadCryptoCoin({required this.currencyCode});

  @override
  List<Object> get props => super.props..add(currencyCode);
}
