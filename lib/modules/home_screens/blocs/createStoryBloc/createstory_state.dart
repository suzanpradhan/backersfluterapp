part of 'createstory_bloc.dart';

abstract class CreatestoryState extends Equatable {
  const CreatestoryState();

  @override
  List<Object> get props => [];
}

class CreatestoryInitial extends CreatestoryState {}

class AddNewStoryLoadingState extends CreatestoryState {}

class AddNewStorySuccessState extends CreatestoryState {
  final String message;

  const AddNewStorySuccessState({required this.message});

  @override
  List<Object> get props => [message];
}

class AddNewStoryFailedState extends CreatestoryState {
  final String message;

  const AddNewStoryFailedState({required this.message});

  @override
  List<Object> get props => [message];
}
