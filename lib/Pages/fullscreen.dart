// ignore_for_file: must_be_immutable, prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class FullScreen extends StatefulWidget {
  FullScreen({super.key, required this.controller});
  VideoPlayerController controller;
  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  Future setLandscape() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  Future setPortrait() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  bool isDisplay = true;

  @override
  void initState() {
    setLandscape();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isDisplay = true;
              });
            },
            child: VideoPlayer(widget.controller),
          ),
          if (isDisplay)
            GestureDetector(
              onTap: () {
                setState(() {
                  isDisplay = false;
                });
              },
              child: Container(
                color: Color(0xFF171617).withOpacity(0.5),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                      child: Row(
                        children: [
                          SizedBox(width: 20),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: VideoProgressIndicator(
                              widget.controller,
                              allowScrubbing: true,
                            ),
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                              onTap: () {
                                setPortrait();
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xFF171617),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(Icons.fullscreen_exit_rounded,
                                    color: Color(0xFFEFEBE0), size: 30),
                              )),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.controller.value.isPlaying
                              ? widget.controller.pause()
                              : widget.controller.play();
                        });
                      },
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xFF171617),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                              !widget.controller.value.isPlaying
                                  ? Icons.play_arrow_rounded
                                  : Icons.pause_rounded,
                              color: Color(0xFFEFEBE0),
                              size: 30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
