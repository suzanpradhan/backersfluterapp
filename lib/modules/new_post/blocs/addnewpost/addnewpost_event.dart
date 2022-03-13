part of 'addnewpost_bloc.dart';

abstract class AddnewpostEvent extends Equatable {
  const AddnewpostEvent();

  @override
  List<Object> get props => [];
}

class AddNewPostAttemptEvent extends AddnewpostEvent {
  final PostModelGb postModelGb;

  AddNewPostAttemptEvent({required this.postModelGb});

  @override
  List<Object> get props => [postModelGb];
}
