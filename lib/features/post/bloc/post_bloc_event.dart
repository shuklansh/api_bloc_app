part of 'post_bloc_bloc.dart';

@immutable
abstract class PostBlocEvent {}


class PostsInitialFetchEvent extends PostBlocEvent{}

class PostsAddEvent extends PostBlocEvent{}
