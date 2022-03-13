part of 'adddonation_bloc.dart';

abstract class AdddonationEvent extends Equatable {
  const AdddonationEvent();

  @override
  List<Object> get props => [];
}

class AddDonationAttempt extends AdddonationEvent {
  final String amount;
  final int postID;
  const AddDonationAttempt({required this.amount, required this.postID});

  @override
  List<Object> get props => [amount, postID];
}
