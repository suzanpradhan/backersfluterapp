part of 'getstorys_bloc.dart';

abstract class GetstorysState extends Equatable {
  const GetstorysState();

  @override
  List<Object> get props => [];
}

class GetstorysInitial extends GetstorysState {}

class GetStorysLoadingState extends GetstorysState {}

class GetStorySuccessState extends GetstorysState {
  final List<StoryModelGb> allstorys;

  const GetStorySuccessState({required this.allstorys});

  @override
  List<Object> get props => [allstorys];
}

class GetStoryFailedState extends GetstorysState {
  final String message;
  const GetStoryFailedState({required this.message});
  @override
  List<Object> get props => [message];
}
