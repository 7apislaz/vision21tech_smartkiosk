import 'package:just_audio/just_audio.dart';

class ButtonAudios {
  AudioPlayer player = AudioPlayer();

  Future playAudio(assetPath) async {
    await player.stop();
    await player.setAsset(assetPath);
    await player.play();
  }

  Future stopAudio(assetPath) async {
    player.stop();
  }
}