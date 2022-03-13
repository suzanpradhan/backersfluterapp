import 'package:backersapp/gb_models/post_model_gb.dart';
import 'package:backersapp/modules/home_screens/repos/post_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'getposts_event.dart';
part 'getposts_state.dart';

class GetpostsBloc extends Bloc<GetpostsEvent, GetpostsState> {
  Postrepo _postrepo = Postrepo();
  GetpostsBloc() : super(GetpostsInitial()) {
    on<GetpostsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetAllPostsEvent>((event, emit) => getAllPostMethodMap(emit: emit));
  }

  getAllPostMethodMap({required Emitter<GetpostsState> emit}) async {
    emit(GettingAllPostState());
    try {
      List<PostModelGb> allPosts = await _postrepo.getAllPosts();
      emit(GotAllPostsState(allposts: allPosts));
    } catch (e) {
      emit(GetAllPostsFailedState(message: e.toString()));
    }
  }
}
