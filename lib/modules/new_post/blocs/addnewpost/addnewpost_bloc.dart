import 'package:backersapp/gb_models/post_model_gb.dart';
import 'package:backersapp/modules/home_screens/repos/post_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'addnewpost_event.dart';
part 'addnewpost_state.dart';

class AddnewpostBloc extends Bloc<AddnewpostEvent, AddnewpostState> {
  Postrepo _postrepo = Postrepo();
  AddnewpostBloc() : super(AddnewpostInitial()) {
    on<AddnewpostEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AddNewPostAttemptEvent>(
        (event, emit) => addNewPostMap(event: event, emit: emit));
  }

  addNewPostMap(
      {required AddNewPostAttemptEvent event,
      required Emitter<AddnewpostState> emit}) async {
    emit(AddNewPostLoadingState());

    try {
      bool addNewPostAttemptStatus =
          await _postrepo.createNewPost(postModelGb: event.postModelGb);
      if (addNewPostAttemptStatus) {
        emit(AddNewPostSuccessState(message: "Post uploaded successfully."));
      } else {
        emit(AddNewPostFailedState(message: "Post upload failed."));
      }
    } catch (e) {
      emit(AddNewPostFailedState(message: e.toString()));
    }
  }
}
