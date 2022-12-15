import 'package:demo_project/controller/details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends GetView<DetailsController> {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail page'),
      ),
      body: Center(
        child: Container(
          height: 100.0,
          width: 100.0,
          color: Colors.red,
        ),
      ),
    );
  }

  Widget getUserUI({required User user}) => Text(user.name);
}
