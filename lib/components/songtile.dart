import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SongTile extends StatelessWidget {
  final String songname;
  final VoidCallback onPress;
  SongTile({super.key, required this.songname, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onPress,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border(bottom: BorderSide.none),
              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                  color: Color.fromARGB(255, 247, 123, 162),
                )
              ]),
          child: Row(
            children: [
              Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '$songname',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
