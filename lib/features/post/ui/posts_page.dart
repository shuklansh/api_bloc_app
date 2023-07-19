import 'dart:convert';

import 'package:api_bloc_app/features/post/bloc/post_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final PostBlocBloc postBloc = PostBlocBloc();

  @override
  void initState() {
    postBloc.add(PostsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          postBloc.add(PostsAddEvent());
        },
      ),
      appBar: AppBar(
        title: const Text("Posts page"),
      ),
      body: BlocConsumer<PostBlocBloc, PostBlocState>(
        bloc : postBloc,
        listenWhen: (previous, current) => current is PostsActionState,
        buildWhen: (previous, current) => current is !PostsActionState,
        listener: (context, state) {
          
        },
        builder: (context, state){
          switch (state.runtimeType) {
            case PostFetchingLoadingState:
              return const Center(child: CircularProgressIndicator(color: Colors.green,));
            case PostFetchingSuccessState:
              final successState = state as PostFetchingSuccessState;
              return Container(
            child: ListView.builder(itemCount: successState.posts.length,
            itemBuilder: (context, index) {
              
              return Padding(
                padding: EdgeInsets.all(12.0),
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration( 
                    
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromARGB(255, 216, 216, 216)              
                  ),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(successState.posts[index].id.toString() + ". " + successState.posts[index].title, style: const TextStyle(
                      color: Color.fromARGB(255, 70, 4, 76),
                      fontSize: 24
                    )),
                    SizedBox(height: 12),
                    Text(successState.posts[index].body),
                    SizedBox(height: 12),
                    
                  ],),
                ),
              );
            },),
          );
            default: return const Center(child: CircularProgressIndicator(color: Colors.blue,));
          }
          
        },
      ),
    );
  }
}
