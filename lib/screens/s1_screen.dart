import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../routes.dart';

class S1Screen extends StatefulWidget {
  const S1Screen({super.key});

  @override
  State<S1Screen> createState() => _S1ScreenState();
}

class _S1ScreenState extends State<S1Screen> {
  late final VideoPlayerController _vc;
  late final Future<void> _init;

  @override
  void initState() {
    super.initState();
    _vc = VideoPlayerController.asset('assets/videos/s1.mp4');
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
          arguments: const ImageDetailArgs(
            pageKey: 's1_1',
            imageAsset: 'assets/images/s1_1.png',
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
              'Verde Clair',
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
            child: const Text(
              'The breath of the meadow',
              textAlign: TextAlign.center,
              style: TextStyle(
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
            child: const Text(
              '“When morning light touches the earth, purity becomes visible.\nYou breathe, and the world feels infinite again.”',
              textAlign: TextAlign.center,
              style: TextStyle(
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
