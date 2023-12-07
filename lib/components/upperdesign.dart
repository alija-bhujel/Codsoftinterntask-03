import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:musicplayerapp/consts/colors.dart';

class Topdesign extends StatelessWidget {
  const Topdesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
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
                      Icons.headset_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Text(
          'P L A Y I N G    N O W',
          style: GoogleFonts.poppins(fontSize: 15),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
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
                    Icons.music_note,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
