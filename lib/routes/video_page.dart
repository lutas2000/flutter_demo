
import 'package:flutter/material.dart';
//import 'package:video_player/video_player.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
//  VideoPlayerController _controller;
  IjkMediaController controller = IjkMediaController();

  @override
  void initState() {
    super.initState();
//    _controller = VideoPlayerController.network(
//        'https://qiniu-global-pull-rtmp.17app.co/17app/d6bf8aa0-2765-48e9-a26c-05e72b3f4e64.flv')
//      ..initialize().then((_) {
//        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//        setState(() {});
//      });
  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Home Page'),
//      ),
//      body: Center(
//          child: _controller.value.initialized
//              ? AspectRatio(
//            aspectRatio: _controller.value.aspectRatio,
//            child: VideoPlayer(_controller),
//          )
//              : Container()
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          setState(() {
//            _controller.value.isPlaying
//                ? _controller.pause()
//                : _controller.play();
//          });
//        },
//        child: Icon(
//          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//        ),
//      ),// This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () async {
              await controller.play();
            },
          ),
        ],
      ),
      body: Container(
         width: 400,
         height: 400,
        child: ListView(
            children: <Widget>[
              buildIjkPlayer(),
            ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () async {
          await controller.setNetworkDataSource(
              'https://file-examples.com/wp-content/uploads/2017/04/file_example_MP4_640_3MG.mp4',
              // 'rtmp://172.16.100.245/live1',
              // 'https://www.sample-videos.com/video123/flv/720/big_buck_bunny_720p_10mb.flv',
//              "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4",
              // 'http://184.72.239.149/vod/smil:BigBuckBunny.smil/playlist.m3u8',
              // "file:///sdcard/Download/Sample1.mp4",
              autoPlay: true);
          print("set data source success");
          // controller.playOrPause();
        },
      ),
    );
  }

  Widget buildIjkPlayer() {
    return Container(
      height: 400, // 这里随意
      width: 400,
      child: IjkPlayer(
        mediaController: controller,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
//    _controller.dispose();
    controller.dispose();
  }
}