import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayerapp/pages/homepage.dart';

class Frontpage extends StatefulWidget {
  const Frontpage({super.key});

  @override
  State<Frontpage> createState() => _FrontpageState();
}

class _FrontpageState extends State<Frontpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.png'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(top: 690, left: 200),
          child: Row(
            children: [
              Text(
                'Start Listening',
                style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Homepage()));
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
