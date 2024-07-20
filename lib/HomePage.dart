import 'dart:io';

import 'package:add/Controller/image_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagePickerController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Upload"),
      ),
      body: SafeArea(
          child: Column(
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    controller.pickImage();
                  },
                  child: const Text("Pick Your Image"),
                ),
              ),
              Obx((){
               return Container(
                child:controller.image.value.path == ''
                    ?const Icon(Icons.camera,size: 50,)
                    : Image.file(
                  File(controller.image.value.path),
                ),
              );
              }),
              ElevatedButton(onPressed: (){
                controller.uploadImageToFirebase();
              }, child:const Text("Upload Firebase"))
            ],
          ),
      ),
    );
  }
}
