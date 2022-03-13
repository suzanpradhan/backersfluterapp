import 'package:backersapp/gb_models/story_model_gb.dart';
import 'package:backersapp/modules/home_screens/repos/story_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'getstorys_event.dart';
part 'getstorys_state.dart';

class GetstorysBloc extends Bloc<GetstorysEvent, GetstorysState> {
  StoryRepo _storyRepo = StoryRepo();
  GetstorysBloc() : super(GetstorysInitial()) {
    on<GetstorysEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetAllStoryEvent>((event, emit) => getAllPostMethodMap(emit: emit));
  }

  getAllPostMethodMap({required Emitter<GetstorysState> emit}) async {
    emit(GetStorysLoadingState());
    try {
      List<StoryModelGb> allPosts = await _storyRepo.getAllStory();
      emit(GetStorySuccessState(allstorys: allPosts));
    } catch (e) {
      emit(GetStoryFailedState(message: e.toString()));
    }
  }
}
