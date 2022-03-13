part of 'getposts_bloc.dart';

abstract class GetpostsState extends Equatable {
  const GetpostsState();

  @override
  List<Object> get props => [];
}

class GetpostsInitial extends GetpostsState {}

class GettingAllPostState extends GetpostsState {}

class GotAllPostsState extends GetpostsState {
  final List<PostModelGb> allposts;

  const GotAllPostsState({required this.allposts});

  @override
  List<Object> get props => [allposts];
}

class GetAllPostsFailedState extends GetpostsState {
  final String message;
  const GetAllPostsFailedState({required this.message});
  @override
  List<Object> get props => [message];
}
