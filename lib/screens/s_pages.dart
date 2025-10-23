import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../routes.dart';

class _VideoOverlayScreen extends StatefulWidget {
  final String pageKey;
  final String videoAsset;
  final String detailImageAsset;
  final String title;
  final String subtitle;
  final String quote;

  const _VideoOverlayScreen({
    required this.pageKey,
    required this.videoAsset,
    required this.detailImageAsset,
    required this.title,
    required this.subtitle,
    required this.quote,
    super.key,
  });

  @override
  State<_VideoOverlayScreen> createState() => _VideoOverlayScreenState();
}

class _VideoOverlayScreenState extends State<_VideoOverlayScreen> {
  late final VideoPlayerController _vc;
  late final Future<void> _init;

  @override
  void initState() {
    super.initState();
    _vc = VideoPlayerController.asset(widget.videoAsset);
    _init = _vc.initialize().then((_) {
      _vc
        ..setLooping(true)
        ..play();
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _vc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.detail,
          arguments: ImageDetailArgs(
            pageKey: '${widget.pageKey}_1',
            imageAsset: widget.detailImageAsset,
          ),
        );
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: FutureBuilder(
              future: _init,
              builder: (context, snap) {
                if (snap.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }
                final ratio =
                    _vc.value.aspectRatio == 0 ? 9 / 16 : _vc.value.aspectRatio;
                return FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: 1080,
                    height: 1080 / ratio,
                    child: VideoPlayer(_vc),
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
              style: const TextStyle(
                color: Colors.white,
                fontSize: 54,
                fontFamily: 'Noto Serif',
                fontWeight: FontWeight.w400,
                height: 1.55,
                shadows: [
                  Shadow(
                    offset: Offset(4, 4),
                    blurRadius: 4,
                    color: Color(0x40000000),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 53,
            right: 53,
            top: 249,
            child: Text(
              widget.subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Noto Serif',
                fontWeight: FontWeight.w400,
                height: 1.55,
                shadows: [
                  Shadow(
                    offset: Offset(4, 4),
                    blurRadius: 4,
                    color: Color(0x40000000),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 53,
            right: 53,
            top: 340,
            child: Text(
              widget.quote,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Noto Serif',
                fontWeight: FontWeight.w400,
                height: 1.55,
                shadows: [
                  Shadow(
                    offset: Offset(4, 4),
                    blurRadius: 4,
                    color: Color(0x40000000),
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

/// s2 ~ s5
class S2Screen extends StatelessWidget {
  const S2Screen({super.key});
  @override
  Widget build(BuildContext context) => const _VideoOverlayScreen(
        pageKey: 's2',
        videoAsset: 'assets/videos/s2.mp4',
        detailImageAsset: 'assets/images/s2_1.png',
        title: 'Moss Reverie',
        subtitle: 'Echoes of damp earth',
        quote: '“Where shade breathes softly, patience becomes fragrance.”',
      );
}

class S3Screen extends StatelessWidget {
  const S3Screen({super.key});
  @override
  Widget build(BuildContext context) => const _VideoOverlayScreen(
        pageKey: 's3',
        videoAsset: 'assets/videos/s3.mp4',
        detailImageAsset: 'assets/images/s3_1.png',
        title: 'Luna Marina',
        subtitle: 'Salt, night and hush',
        quote: '“Moonlight rinses the horizon; the sea learns to whisper.”',
      );
}

class S4Screen extends StatelessWidget {
  const S4Screen({super.key});
  @override
  Widget build(BuildContext context) => const _VideoOverlayScreen(
        pageKey: 's4',
        videoAsset: 'assets/videos/s4.mp4',
        detailImageAsset: 'assets/images/s4_1.png',
        title: 'Terra Sienna',
        subtitle: 'Warm dust of time',
        quote: '“Grain, clay, and sunlight; memory glows under the skin.”',
      );
}

class S5Screen extends StatelessWidget {
  const S5Screen({super.key});
  @override
  Widget build(BuildContext context) => const _VideoOverlayScreen(
        pageKey: 's5',
        videoAsset: 'assets/videos/s5.mp4',
        detailImageAsset: 'assets/images/s5_1.png',
        title: 'Selva Intensa',
        subtitle: 'Green depths, slow thunder',
        quote: '“Roots speak in silence; the heart learns a wilder rhythm.”',
      );
}
