import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayerapp/components/songtile.dart';
import 'package:musicplayerapp/components/trendingslider.dart';
import 'package:musicplayerapp/getxcontrollers/musiccontroller.dart';
import 'package:musicplayerapp/getxcontrollers/playercontroller.dart';

import 'package:musicplayerapp/pages/playersong.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  //calling the player controller
  // var controller = Get.put(PlayerController());

  @override
  Widget build(BuildContext context) {
    PlayerController songdatacontroller = Get.put(PlayerController());
    MusicController musicController = Get.put(MusicController());
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(Icons.music_note),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          title: Center(
              child: Text(
            ' P L A Y  ||  M U S I C',
            style: GoogleFonts.poppins(fontSize: 20, color: Colors.pink[400]),
          ))),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Sliderr(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      songdatacontroller.isDeviceSong.value = false;
                    },
                    child: Text(
                      '',
                      style: GoogleFonts.poppins(fontSize: 15),
                    )),
                InkWell(
                    onTap: () {
                      songdatacontroller.isDeviceSong.value = true;
                    },
                    child: Text(
                      'Song list',
                      style: GoogleFonts.poppins(fontSize: 15),
                    )),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Obx(() => songdatacontroller.isDeviceSong.value
              ? Column(
                  //using map so that showing one by one song
                  children: songdatacontroller.localSongList.value
                      .map((e) => SongTile(
                            songname: e.title,
                            onPress: () {
                              musicController.playlocalAudio(e);
                              songdatacontroller.findCurentplayingIndex(e.id);
                              Get.to(PlayerSong());
                            },
                          ))
                      .toList())
              : Column(
                  children: [],
                ))
        ],
      )),
    );
  }
}
