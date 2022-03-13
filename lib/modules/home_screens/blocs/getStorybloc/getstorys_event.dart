part of 'getstorys_bloc.dart';

abstract class GetstorysEvent extends Equatable {
  const GetstorysEvent();

  @override
  List<Object> get props => [];
}

class GetAllStoryEvent extends GetstorysEvent {}
