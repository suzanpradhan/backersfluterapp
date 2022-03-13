part of 'getmyposts_bloc.dart';

abstract class GetmypostsState extends Equatable {
  const GetmypostsState();

  @override
  List<Object> get props => [];
}

class GetmypostsInitial extends GetmypostsState {}

class GettingMyPostState extends GetmypostsState {}

class GotMyPostsState extends GetmypostsState {
  final List<PostModelGb> myposts;

  const GotMyPostsState({required this.myposts});

  @override
  List<Object> get props => [myposts];
}

class GetMyPostsFailedState extends GetmypostsState {
  final String message;
  const GetMyPostsFailedState({required this.message});
  @override
  List<Object> get props => [message];
}
