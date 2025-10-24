import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../routes.dart';
import '../theme/typography.dart';

class VideoOverlayPage extends StatefulWidget {
  final String pageKey;
  final String videoAsset;
  final String detailImageAsset;
  final String title;
  final String subtitle;
  final String quote;

  const VideoOverlayPage({
    required this.pageKey,
    required this.videoAsset,
    required this.detailImageAsset,
    required this.title,
    required this.subtitle,
    required this.quote,
    super.key,
  });

  @override
  State<VideoOverlayPage> createState() => _VideoOverlayPageState();
}

class _VideoOverlayPageState extends State<VideoOverlayPage> {
  late final VideoPlayerController _controller;
  late final Future<void> _initFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoAsset);
    _initFuture = _controller.initialize().then((_) {
      _controller
        ..setLooping(true)
        ..play();
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pushNamed(
        AppRoutes.detail,
        arguments: ImageDetailArgs(
          pageKey: '${widget.pageKey}_1',
          imageAsset: widget.detailImageAsset,
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: FutureBuilder<void>(
              future: _initFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }
                final aspectRatio =
                    _controller.value.aspectRatio == 0 ? 9 / 16 : _controller.value.aspectRatio;
                return FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: 1080,
                    height: 1080 / aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: 53,
            right: 53,
            top: 170,
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: overlayTitleStyle,
            ),
          ),
          Positioned(
            left: 53,
            right: 53,
            top: 249,
            child: Text(
              widget.subtitle,
              textAlign: TextAlign.center,
              style: overlaySubtitleStyle,
            ),
          ),
          Positioned(
            left: 53,
            right: 53,
            top: 340,
            child: Text(
              widget.quote,
              textAlign: TextAlign.center,
              style: overlayQuoteStyle,
            ),
          ),
        ],
      ),
    );
  }
}
