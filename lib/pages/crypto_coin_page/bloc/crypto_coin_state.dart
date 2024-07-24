part of 'crypto_coin_bloc.dart';

class CryptoCoinState extends Equatable {
  const CryptoCoinState();

  @override
  List<Object?> get props => [];
}

class CryptoCoinInitial extends CryptoCoinState {
  @override
  List<Object?> get props => [];
}

class CryptoCoinLoading extends CryptoCoinState {
  @override
  List<Object?> get props => [];
}

class CryptoCoinLoaded extends CryptoCoinState {
  final CryptoCoin coin;

  const CryptoCoinLoaded({
    required this.coin,
  });
  @override
  List<Object?> get props => [coin];
}

class CryptoCoinLoadingFailure extends CryptoCoinState {
  const CryptoCoinLoadingFailure({
    required this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
