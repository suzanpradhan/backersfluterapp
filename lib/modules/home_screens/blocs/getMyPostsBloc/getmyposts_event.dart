part of 'getmyposts_bloc.dart';

abstract class GetmypostsEvent extends Equatable {
  const GetmypostsEvent();

  @override
  List<Object> get props => [];
}

class GetMyPostsEvent extends GetmypostsEvent {}
