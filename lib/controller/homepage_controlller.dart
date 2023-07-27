import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../pages/passport_verification_page.dart';

class HomePageController extends GetxController {
  final count = 0.obs;

  increment() => count.value++;

  var youtubePlayerController = YoutubePlayerController(
    initialVideoId: 'zUv88aJtklc',
    // initialVideoId: 'ceGz6d-rPeQ',
    flags: const YoutubePlayerFlags(
        autoPlay: true, mute: false, loop: true, hideControls: true),
  ).obs;
  var muted = false.obs;

  void mutedUnmute() {
    muted.value
        ? youtubePlayerController.value.unMute()
        : youtubePlayerController.value.mute();

    muted.value = !muted.value;
  }

  void goToVerificationPage() {
    Get.to(PassportVerificationPage());
  }
}
