import 'package:just_audio/just_audio.dart';

class ButtonAudios {
  AudioPlayer player = AudioPlayer();

  Future playAudio(assetPath) async {
    await player.stop();
    await player.setVolume(75);
    await player.setSpeed(1);
    await player.setAsset(assetPath);
    player.play();
  }
}