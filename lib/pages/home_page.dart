import 'package:aitl_tril_task/pages/passport_verification_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controller/homepage_controlller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final HomePageController controller = Get.put(HomePageController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                  child: Obx(() => YoutubePlayer(
                        controller: controller.youtubePlayerController.value,
                      )),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: InkWell(
                      onTap: () {
                        controller.mutedUnmute();
                      },
                      child: Obx(() => controller.muted.value ? Icon(Icons.volume_mute) : Icon(Icons.volume_up))),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: Text('Record a short video of yourself',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  ),
                ),
                const SizedBox(height: 10,),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: Text('Make sure we can see you clearly, then say the words that appear to the camera so we can match you to your photo ID',
                      textAlign: TextAlign.center,
                      ),
                  ),
                ),
                const SizedBox(height: 10,),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: Text('A member of our team may review your video',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38),),
                  ),
                ),
                Divider(thickness: 1,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.grey[200],
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      padding: EdgeInsets.all(8.0),
                      child: Row(children: const [
                      Icon(Icons.lock, color: Colors.black38,),
                      SizedBox(width: 5,),
                      Expanded(child: Text('Your infoo will be encrypted, stored securely and even used to verify your identity', style: TextStyle(color: Colors.black38),))
                  ]),
                    ),),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          controller.goToVerificationPage();
                          // Get.to(() => const PassportVerificationPage());
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold),),
                        child: const Text('I\'am ready', style: TextStyle(color: Colors.white, fontSize: 18),)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
