import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:musicplayerapp/models/songmodel.dart';

class CloudSongController extends GetxController {
  final data = FirebaseFirestore.instance;

  void UploadSongtodata() async {
    SongModel mysong = SongModel(
        id: 1,
        title: "Final Girl",
        artist: "Jeremy Blake",
        album: "album",
        albumart:
            "https://jooinn.com/images/pink-music-background-shows-musical-instruments-and-brightness.jpg",
        data:
            "https://firebasestorage.googleapis.com/v0/b/musicplayerapp-fa3c1.appspot.com/o/Final%20Girl%20-%20Jeremy%20Blake.mp3?alt=media&token=8434bcc5-4ef3-4396-9b91-42be659aac52");

    await data.collection("songs").add(mysong.toJson());
    print("Song Uploaded");
  }
}
