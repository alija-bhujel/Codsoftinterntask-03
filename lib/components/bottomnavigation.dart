import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicplayerapp/getxcontrollers/musiccontroller.dart';

class Bottomnavigator extends StatelessWidget {
  const Bottomnavigator({super.key});

  @override
  Widget build(BuildContext context) {
    MusicController musicController = Get.put(MusicController());
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                musicController.setShuffle();
              },
              child: Icon(Icons.shuffle,
                  size: 25,
                  color: musicController.isShuffle.value
                      ? Colors.pink
                      : Colors.grey),
            ),
            InkWell(
              onTap: () {
                musicController.setLoop();
              },
              child: Icon(
                Icons.repeat,
                size: 25,
                color: musicController.isLoop.value ? Colors.pink : Colors.grey,
              ),
            ),
            const Icon(
              Icons.library_add,
              size: 25,
              color: Colors.grey,
            ),
            const Icon(
              Icons.favorite_border_outlined,
              size: 25,
              color: Colors.pink,
            )
          ],
        ));
  }
}
