import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayerapp/components/bottomnavigation.dart';
import 'package:musicplayerapp/components/circularmov_vol.dart';
import 'package:musicplayerapp/components/songcontroller.dart';
import 'package:musicplayerapp/components/upperdesign.dart';
import 'package:musicplayerapp/getxcontrollers/musiccontroller.dart';

class PlayerSong extends StatelessWidget {
  const PlayerSong({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MusicController musicController = Get.put(MusicController());
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
          child: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              Topdesign(),
              Volume_Extender(),
              Padding(
                  padding: const EdgeInsets.only(top: 20, left: 65, right: 65),
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: Colors.pink,
                        ),
                        Text(
                          '${musicController.songTitle.value}',
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Icon(
                          Icons.download,
                          color: Colors.pink,
                        )
                      ],
                    ),
                  )),
              Obx(
                () => Text(
                  '${musicController.songArtist.value}',
                  style: GoogleFonts.poppins(color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Songcontoller(),
              const SizedBox(
                height: 30,
              ),
              Bottomnavigator()
            ],
          ),
        ),
      )),
    );
  }
}
