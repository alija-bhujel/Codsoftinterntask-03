import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayerapp/consts/colors.dart';
import 'package:musicplayerapp/getxcontrollers/musiccontroller.dart';
import 'package:musicplayerapp/getxcontrollers/playercontroller.dart';

class Songcontoller extends StatelessWidget {
  const Songcontoller({super.key});

  @override
  Widget build(BuildContext context) {
    MusicController musicController = Get.put(MusicController());
    PlayerController playerController = Get.put(PlayerController());
    return Column(
      children: [
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  '${musicController.currentTime}',
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.black),
                ),
              ),
              Expanded(
                child: Slider(
                  value: musicController.sliderValue.value
                      .clamp(0.0, musicController.sliderValue.value),
                  onChanged: (value) {
                    musicController.sliderValue.value = value;

                    Duration songPosition = Duration(seconds: value.toInt());
                    musicController.changeSongslider(songPosition);
                  },
                  min: 0,
                  max: musicController.sliderMaxvalue.value,
                  activeColor: Colors.pink,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Text(
                  '${musicController.totalTime}',
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.black),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            // skip previous
            InkWell(
              onTap: () {
                playerController.playpreviousSong();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 90),
                child: Column(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      width: 60,
                      height: 60,
                      padding:const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                          color: AppColor.bgColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: AppColor.white,
                                blurRadius: 20,
                                offset: Offset(-10, -10)),
                            BoxShadow(
                                color:  Color.fromARGB(255, 205, 121, 149),
                                blurRadius: 20,
                                offset: Offset(10, 10))
                          ]),
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.bgColor,
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  AppColor.white,
                                  Color.fromARGB(255, 240, 69, 126)
                                ])),
                        child: const Icon(Icons.skip_previous_rounded,
                            color: Colors.white, size: 30),
                      ),
                    )
                  ],
                ),
              ),
            ),

            //play

            Column(
              children: [
                Obx(
                  () => musicController.isPlaying.value
                      ? InkWell(
                          onTap: () {
                            musicController.pausePlaying();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  width: 60,
                                  height: 60,
                                  padding: EdgeInsets.all(3),
                                  decoration: const BoxDecoration(
                                      color: AppColor.bgColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColor.white,
                                            blurRadius: 20,
                                            offset: Offset(-10, -10)),
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 205, 121, 149),
                                            blurRadius: 20,
                                            offset: Offset(10, 10))
                                      ]),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColor.bgColor,
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              AppColor.white,
                                              Color.fromARGB(255, 240, 69, 126)
                                            ])),
                                    child: const Icon(Icons.pause,
                                        color: Colors.white, size: 30),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            musicController.resumePlaying();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  width: 60,
                                  height: 60,
                                  padding: EdgeInsets.all(3),
                                  decoration: const BoxDecoration(
                                      color: AppColor.bgColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColor.white,
                                            blurRadius: 20,
                                            offset: Offset(-10, -10)),
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 205, 121, 149),
                                            blurRadius: 20,
                                            offset: Offset(10, 10))
                                      ]),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColor.bgColor,
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              AppColor.white,
                                              Color.fromARGB(255, 240, 69, 126)
                                            ])),
                                    child: const Icon(Icons.stop,
                                        color: Colors.white, size: 30),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                )
              ],
            ),

            //skip to more
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                playerController.playnextSong();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      width: 60,
                      height: 60,
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                          color: AppColor.bgColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: AppColor.white,
                                blurRadius: 20,
                                offset: Offset(-10, -10)),
                            BoxShadow(
                                color: Color.fromARGB(255, 205, 121, 149),
                                blurRadius: 20,
                                offset: Offset(10, 10))
                          ]),
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.bgColor,
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  AppColor.white,
                                  Color.fromARGB(255, 240, 69, 126)
                                ])),
                        child: const Icon(
                          Icons.skip_next_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
