part of 'createstory_bloc.dart';

abstract class CreatestoryEvent extends Equatable {
  const CreatestoryEvent();

  @override
  List<Object> get props => [];
}

class AddNewStoryAttemptEvent extends CreatestoryEvent {
  final StoryModelGb storyModelGb;

  AddNewStoryAttemptEvent({required this.storyModelGb});

  @override
  List<Object> get props => [storyModelGb];
}
