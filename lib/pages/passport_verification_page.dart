import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PassportVerificationPage extends StatefulWidget {
  const PassportVerificationPage({Key? key}) : super(key: key);

  @override
  State<PassportVerificationPage> createState() =>
      _PassportVerificationPageState();
}

class _PassportVerificationPageState extends State<PassportVerificationPage> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;

  int direction = 0;
  bool intillizationZone = false;

  @override
  void initState() {
    // startCamera(direction);
    super.initState();
  }

  void startCamera(int direction) async {
    cameras = await availableCameras();

    cameraController = CameraController(
      cameras[direction],
      ResolutionPreset.high,
      enableAudio: false,
    );

    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      intillizationZone = true;
      setState(() {}); //To refresh widget
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    startCamera(direction);
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (intillizationZone) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text(
            'Passport Verification Page',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                'Make sure the front of your Passport is in the frame',
                style: TextStyle(color: Colors.black38),
              )),
          const SizedBox(
            height: 30,
          ),
          Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                'Show on example',
                style:
                    TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
              )),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 90),
                child: CameraPreview(cameraController),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    direction = direction == 0 ? 1 : 0;
                    startCamera(direction);
                  });
                },
                child: button(
                    Icons.flip_camera_ios_outlined, Alignment.bottomLeft),
              ),
              GestureDetector(
                onTap: () {
                  cameraController.takePicture().then((XFile? file) {
                    if (mounted) {
                      if (file != null) {
                        print("Picture saved to ${file.path}");
                      }
                    }
                  });
                },
                child:
                    button(Icons.camera_alt_outlined, Alignment.bottomCenter),
              ),
              Center(
                child: Container(
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 90),
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 80),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
            ],
          )),
        ]),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget button(IconData icon, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.only(
          left: 20,
          bottom: 20,
        ),
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
