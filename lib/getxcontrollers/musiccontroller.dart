import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicController extends GetxController {
  final player = AudioPlayer();
  RxBool isPlaying = false.obs;

  RxString currentTime = "0".obs;
  RxString totalTime = "0".obs;
  RxDouble sliderValue = 0.0.obs;
  RxDouble sliderMaxvalue = 0.0.obs;
  RxString songTitle = "".obs;
  RxString songArtist = "".obs;
  RxBool isLoop = false.obs;
  RxBool isShuffle = false.obs;
  RxDouble isVolume = 0.2.obs;

  void playlocalAudio(SongModel song) async {
    songTitle.value = song.title;
    songArtist.value = song.artist!;
    await player.setAudioSource(AudioSource.uri(Uri.parse(song.data)));
    player.play();
    updatePosition();
    isPlaying.value = true;
  }

  void changeVolume(double volume) {
    isVolume.value = volume;
    player.setVolume(isVolume.value);
  }

  void setLoop() async {
    if (isLoop.value) {
      await player.setLoopMode(LoopMode.off);
    } else {
      await player.setLoopMode(LoopMode.one);
    }

    isLoop.value = !isLoop.value;
  }

  void setShuffle() async {
    if (isShuffle.value) {
      await player.setShuffleModeEnabled(false);
    } else {
      await player.setShuffleModeEnabled(true);
    }
    isShuffle.value = !isShuffle.value;
  }

  void resumePlaying() async {
    isPlaying.value = true;
    await player.play();
  }

  void pausePlaying() async {
    isPlaying.value = false;
    await player.pause();
  }

  void changeSongslider(Duration position) {
    player.seek(position);
  }

  void updatePosition() async {
    try {
      player.durationStream.listen((d) {
        totalTime.value = d.toString().split(".")[0];
        sliderMaxvalue.value = d!.inSeconds.toDouble();
      });
      player.positionStream.listen((p) {
        currentTime.value = p.toString().split(".")[0];
        sliderValue.value = p.inSeconds.toDouble();
      });
    } catch (e) {
      print(e);
    }
  }
}
