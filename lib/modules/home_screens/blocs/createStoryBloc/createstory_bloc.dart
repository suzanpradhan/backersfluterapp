import 'package:backersapp/gb_models/story_model_gb.dart';
import 'package:backersapp/modules/home_screens/repos/story_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'createstory_event.dart';
part 'createstory_state.dart';

class CreatestoryBloc extends Bloc<CreatestoryEvent, CreatestoryState> {
  StoryRepo _storyRepo = StoryRepo();
  CreatestoryBloc() : super(CreatestoryInitial()) {
    on<CreatestoryEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AddNewStoryAttemptEvent>(
        (event, emit) => addNewStoryMap(event: event, emit: emit));
  }

  addNewStoryMap(
      {required AddNewStoryAttemptEvent event,
      required Emitter<CreatestoryState> emit}) async {
    emit(AddNewStoryLoadingState());

    try {
      bool addNewPostAttemptStatus =
          await _storyRepo.createNewPost(storyModelGb: event.storyModelGb);
      if (addNewPostAttemptStatus) {
        emit(AddNewStorySuccessState(message: "Post uploaded successfully."));
      } else {
        emit(AddNewStoryFailedState(message: "Post upload failed."));
      }
    } catch (e) {
      emit(AddNewStoryFailedState(message: e.toString()));
    }
  }
}
