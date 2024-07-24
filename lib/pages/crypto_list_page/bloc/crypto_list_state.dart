part of 'crypto_list_bloc.dart';

abstract class CryptoListBlocState extends Equatable {}

class CryptoListBlocInitial extends CryptoListBlocState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoading extends CryptoListBlocState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoaded extends CryptoListBlocState {
  final List<CryptoCoin> coinsList;

  CryptoListLoaded({
    required this.coinsList,
  });
  @override
  List<Object?> get props => [coinsList];
}

class CryptoListLoadingFailure extends CryptoListBlocState {
  CryptoListLoadingFailure({
    required this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
