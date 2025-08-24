import 'package:flutter/material.dart';

class AllCarsScreen extends StatefulWidget {
  const AllCarsScreen({super.key});

  @override
  State<AllCarsScreen> createState() => _AllCarsScreenState();
}

class _AllCarsScreenState extends State<AllCarsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('All Cars')));
  }
}
