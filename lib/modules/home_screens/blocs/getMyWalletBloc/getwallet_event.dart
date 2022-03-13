part of 'getwallet_bloc.dart';

abstract class GetwalletEvent extends Equatable {
  const GetwalletEvent();

  @override
  List<Object> get props => [];
}

class GetMyWalletAttempt extends GetwalletEvent {}
