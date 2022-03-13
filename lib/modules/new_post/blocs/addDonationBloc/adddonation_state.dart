part of 'adddonation_bloc.dart';

abstract class AdddonationState extends Equatable {
  const AdddonationState();

  @override
  List<Object> get props => [];
}

class AdddonationInitial extends AdddonationState {}

class AddDonationLoadingState extends AdddonationState {}

class AddDonationSuccessState extends AdddonationState {
  final String message;

  const AddDonationSuccessState({required this.message});

  @override
  List<Object> get props => [message];
}

class AddDonationFailedState extends AdddonationState {
  final String message;

  const AddDonationFailedState({required this.message});

  @override
  List<Object> get props => [message];
}
