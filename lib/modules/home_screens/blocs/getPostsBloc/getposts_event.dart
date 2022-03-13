part of 'getposts_bloc.dart';

abstract class GetpostsEvent extends Equatable {
  const GetpostsEvent();

  @override
  List<Object> get props => [];
}

class GetAllPostsEvent extends GetpostsEvent {}
