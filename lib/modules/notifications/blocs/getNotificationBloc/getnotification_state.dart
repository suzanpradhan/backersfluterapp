part of 'getnotification_bloc.dart';

abstract class GetnotificationState extends Equatable {
  const GetnotificationState();

  @override
  List<Object> get props => [];
}

class GetnotificationInitial extends GetnotificationState {}

class GetMyNotificationsLoadingState extends GetnotificationState {}

class GetMyNotificationsSuccessState extends GetnotificationState {
  final List<NotificationModel> notificationList;

  const GetMyNotificationsSuccessState({required this.notificationList});

  @override
  List<Object> get props => [notificationList];
}

class GetMyNotificationsFailedState extends GetnotificationState {
  final String message;

  const GetMyNotificationsFailedState({required this.message});

  @override
  List<Object> get props => [message];
}
