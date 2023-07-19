import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:api_bloc_app/features/post/models/posts_ui_data_model.dart';
import 'package:api_bloc_app/features/post/repos/posts_repo.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_bloc_event.dart';
part 'post_bloc_state.dart';

class PostBlocBloc extends Bloc<PostBlocEvent, PostBlocState> {


  PostBlocBloc() : super(PostBlocInitial()) {      
      on<PostsInitialFetchEvent>(postsInitialFetchEvent);
    }
  

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostBlocState> emit) async {
    emit(PostFetchingLoadingState());    
    List<PostDataUiModel> posts = await PostRepo.fetchPosts();

    emit(PostFetchingSuccessState(posts : posts));
    } 
    
    // catch (e) {
    //   emit(PostFetchingErrorState());
    //   log(e.toString());
    // }
  }

