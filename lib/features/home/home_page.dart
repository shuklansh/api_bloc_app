import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  
  @override
  State<Home> createState(){
    return _HomeState();
  }

  // @override
  // State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API requests with BloC"),
      ),
      body: const Center(child: Text("hi"),),
    );
  }
}