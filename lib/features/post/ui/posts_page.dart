import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {

  var text = "";
  
  void getText() async{
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/todos/1");
    var response = await http.get(uri);
    var bodyy = jsonDecode(response.body).toString();
    setState(() {
      text = bodyy;
    });
  }

  @override
  void initState() {
    getText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts page"),
      ),
      body: Center(child: Text(text)),
    );
  }
}