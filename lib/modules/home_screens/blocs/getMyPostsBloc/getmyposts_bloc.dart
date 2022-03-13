import 'package:backersapp/gb_models/post_model_gb.dart';
import 'package:backersapp/modules/home_screens/repos/post_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'getmyposts_event.dart';
part 'getmyposts_state.dart';

class GetmypostsBloc extends Bloc<GetmypostsEvent, GetmypostsState> {
  Postrepo _postrepo = Postrepo();
  GetmypostsBloc() : super(GetmypostsInitial()) {
    on<GetmypostsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetMyPostsEvent>((event, emit) => getMyPostMethodMap(emit: emit));
  }

  getMyPostMethodMap({required Emitter<GetmypostsState> emit}) async {
    emit(GettingMyPostState());
    try {
      List<PostModelGb> allPosts = await _postrepo.getMyPosts();
      emit(GotMyPostsState(myposts: allPosts));
    } catch (e) {
      emit(GetMyPostsFailedState(message: e.toString()));
    }
  }
}
