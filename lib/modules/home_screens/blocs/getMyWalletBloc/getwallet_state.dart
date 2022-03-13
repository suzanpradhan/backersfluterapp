part of 'getwallet_bloc.dart';

abstract class GetwalletState extends Equatable {
  const GetwalletState();

  @override
  List<Object> get props => [];
}

class GetwalletInitial extends GetwalletState {}

class GetMyWalletLoadingState extends GetwalletState {}

class GetMyWalletSuccessState extends GetwalletState {
  final double amount;
  const GetMyWalletSuccessState({required this.amount});
  @override
  List<Object> get props => [amount];
}

class GetMyWalletFailedState extends GetwalletState {
  final String message;
  const GetMyWalletFailedState({required this.message});
  @override
  List<Object> get props => [message];
}
