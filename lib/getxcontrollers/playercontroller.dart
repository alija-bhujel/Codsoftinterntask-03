import 'package:get/get.dart';
import 'package:musicplayerapp/getxcontrollers/musiccontroller.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController {
  MusicController musicController = Get.put(MusicController());
//creating variable
  final audioQuery = OnAudioQuery();

  RxList<SongModel> localSongList = <SongModel>[].obs;
  RxBool isDeviceSong = false.obs;
  RxInt currentSongplayingIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    //first check this method for the storage permission
    storagePermission();
  }

  void getLocalSongs() async {
    localSongList.value = await audioQuery.querySongs(
        ignoreCase: true,
        orderType: OrderType.ASC_OR_SMALLER,
        sortType: null,
        uriType: UriType.EXTERNAL);

    // print(songList.value);
  }

  void storagePermission() async {
    try {
      var per = await Permission.storage.request();
      if (per.isGranted) {
        print('Permission granted');
        getLocalSongs();
      } else {
        print('permission denied');
        await Permission.storage.request();
      }
    } catch (e) {
      print(e);
    }
  }

  void findCurentplayingIndex(int songId) {
    var index = 0;
    localSongList.forEach((e) {
      if (e.id == songId) {
        currentSongplayingIndex.value = index;
      }
      index++;
    });
    print(songId);
    print(currentSongplayingIndex);
  }

  void playpreviousSong() {
    int songListlen = localSongList.length;
    print(currentSongplayingIndex.value);

    if (currentSongplayingIndex.value != 0) {
      currentSongplayingIndex.value = --currentSongplayingIndex.value;
      if (currentSongplayingIndex < songListlen) {
        SongModel nextsong = localSongList[currentSongplayingIndex.value];
        musicController.playlocalAudio(nextsong);
      }
    }
  }

  void playnextSong() {
    int songListlen = localSongList.length;
    currentSongplayingIndex.value = currentSongplayingIndex.value + 1;

    if (currentSongplayingIndex < songListlen) {
      SongModel nextsong = localSongList[currentSongplayingIndex.value];
      musicController.playlocalAudio(nextsong);
    }
  }
}
