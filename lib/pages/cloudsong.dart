import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicplayerapp/getxcontrollers/cloudsongcontroller.dart';

class CloudSong extends StatelessWidget {
  const CloudSong({super.key});

  @override
  Widget build(BuildContext context) {
    CloudSongController cloudSongController = Get.put(CloudSongController());
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                cloudSongController.UploadSongtodata();
              },
              child: Text('firesong'))),
    );
  }
}
