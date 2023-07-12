import 'package:flutter/material.dart';
import 'package:lecle_yoyo_player/lecle_yoyo_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  Map<int, Color> color =
  {
    50:Color.fromRGBO(255,0,0, .1),
    100:Color.fromRGBO(255,0,0, .2),
    200:Color.fromRGBO(255,0,0, .3),
    300:Color.fromRGBO(255,0,0, .4),
    400:Color.fromRGBO(255,0,0, .5),
    500:Color.fromRGBO(255,0,0, .6),
    600:Color.fromRGBO(255,0,0, .7),
    700:Color.fromRGBO(255,0,0, .8),
    800:Color.fromRGBO(255,0,0, .9),
    900:Color.fromRGBO(255,0,0, 1),
  };

  bool fullscreen = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: fullscreen ? EdgeInsets.zero : EdgeInsets.only(top: 20),
          child: YoYoPlayer(
            aspectRatio: 16 / 9,
            displayFullScreenAfterInit: true,
            url:
            // 'https://dsqqu7oxq6o1v.cloudfront.net/preview-9650dW8x3YLoZ8.webm',
            // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            // "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8",
            "https://sfux-ext.sfux.info/hls/chapter/105/1588724110/1588724110.m3u8",
            allowCacheFile: true,
            onCacheFileCompleted: (files) {
              print('Cached file length ::: ${files?.length}');

              if (files != null && files.isNotEmpty) {
                for (var file in files) {
                  print('File path ::: ${file.path}');
                }
              }
            },
            onCacheFileFailed: (error) {
              print('Cache file error ::: $error');
            },
            videoStyle: const VideoStyle(
              qualityStyle: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              forwardIcon: Icon(const IconData(0xf0b1, fontFamily: 'MaterialIcons'), size: 40.0, color: Colors.white),
              backwardIcon: Icon(const IconData(0xf00f8, fontFamily: 'MaterialIcons'), size: 40.0, color: Colors.white),
              forwardAndBackwardBtSize: 40.0,
              playButtonIconSize: 40.0,
              playIcon: Icon(
                Icons.play_arrow,
                size: 40.0,
                color: Colors.white,
              ),
              pauseIcon: Icon(
                Icons.pause,
                size: 40.0,
                color: Colors.white,
              ),
              videoQualityPadding: EdgeInsets.all(5.0),
              // showLiveDirectButton: true,
              // enableSystemOrientationsOverride: false,
            ),
            videoLoadingStyle: VideoLoadingStyle(
              loading: Center(
                child: Container(
                  color: Colors.black,
                  child: const CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            onFullScreen: (value) {
              setState(() {
                if (fullscreen != value) {
                  fullscreen = value;
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
