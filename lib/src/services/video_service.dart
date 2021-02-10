import 'package:video_player/video_player.dart';

class VideoPlayerService {
  VideoPlayerController videoPlayerController;

  Future<void> loadVideo() async {
    if (videoPlayerController != null) {
      videoPlayerController.dispose();
      videoPlayerController = null;
    }
    videoPlayerController = VideoPlayerController.asset(
      "assets/video.mp4",
      videoPlayerOptions: VideoPlayerOptions(),
    );
    await videoPlayerController.initialize();
    videoPlayerController.play();
  }
}
