import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// Talent Video Page
class TalentVideoPage extends StatefulWidget {
  const TalentVideoPage({super.key, required this.urlVideo});

  final String urlVideo;

  @override
  State<TalentVideoPage> createState() => _TalentVideoPageState();
}

class _TalentVideoPageState extends State<TalentVideoPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool firstTime = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        widget.urlVideo,
      ),
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
            firstTime = true;
          });
        },
        child: Stack(
          children: [
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Center(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            !_controller.value.isPlaying && firstTime
                ? const Center(
                    child: Icon(
                      Icons.pause,
                      color: Colors.grey,
                      size: 50,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
