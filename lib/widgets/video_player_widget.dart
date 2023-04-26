import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'basic_overlay_widget.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController? controller;
  const VideoPlayerWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) => controller != null
      ? Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          height: 600,
          width: MediaQuery.of(context).size.width * .5,
          child: buildVideo(),
        )
      : const CircularProgressIndicator();

  Widget buildVideo() => Stack(
        fit: StackFit.expand,
        children: [
          buildVideoPlayer(),
          // fullScreenPlayer(),
          Positioned.fill(
            child: BasicOverlayWidget(controller: controller!),
          ),
          // Positioned(
          //   top: 10,
          //   right: 10,
          //   child: TextButton(
          //     onPressed: () => fullScreenPlayer,
          //     child: const Text('full screen'),
          //   ),
          // ),
        ],
      );

  // Widget fullScreenPlayer() => buildFullScreen(
  //       child: VideoPlayer(controller!),
  //     );

  Widget buildVideoPlayer() => AspectRatio(
        aspectRatio: controller!.value.aspectRatio,
        child: VideoPlayer(controller!),
      );

  Widget buildFullScreen({required Widget child}) {
    final size = controller!.value.size;
    final height = size.height;
    final width = size.width;

    return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}
