import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  IjkMediaController _controller = IjkMediaController();
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
//    _initController();
  }

  void _initController() async {
    await _controller.setNetworkDataSource(
        'https://file-examples.com/wp-content/uploads/2017/04/file_example_MP4_480_1_5MG.mp4',
      // 'rtmp://172.16.100.245/live1',
//        'https://qiniu-global-pull-rtmp.17app.co/17app/414cb302-427d-4b70-8618-ce062a0f7f5b.flv',
    );
    setState(() {
      _isInit = true;
    });
  }

  void playOrPause() async {
    _controller.playOrPause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Page'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 400,
        child: ListView(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8.0),
                    labelText: "RTMP Path",
                ),
                onSubmitted: (String str) {

                },
              ),
              buildIjkPlayer(),
            ]
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        child: _controller.isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
//        onPressed: _isInit ? playOrPause : null,
//      ),
    );
  }

  Widget buildIjkPlayer() {
    return Container(
      height: 400,
      child: IjkPlayer(
        mediaController: _controller,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}