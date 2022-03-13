part of 'getnotification_bloc.dart';

abstract class GetnotificationEvent extends Equatable {
  const GetnotificationEvent();

  @override
  List<Object> get props => [];
}

class GetMyNotifications extends GetnotificationEvent {}
