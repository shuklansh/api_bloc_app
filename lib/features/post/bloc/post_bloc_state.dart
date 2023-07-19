// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'post_bloc_bloc.dart';

@immutable
abstract class PostBlocState {}

abstract class PostsActionState extends PostBlocState{}

class PostBlocInitial extends PostBlocState {}

class PostFetchingLoadingState extends PostBlocState {

}

class PostFetchingErrorState extends PostBlocState {

}

class AddPostSuccess extends PostsActionState{
  
}
class AddPostError extends PostsActionState{
  
}

class PostFetchingSuccessState extends PostBlocState {
  final List<PostDataUiModel> posts;
  PostFetchingSuccessState({
    required this.posts,
  });
}
