import 'package:flutter/material.dart';

import '../widgets/video_overlay_page.dart';

class S1Screen extends StatelessWidget {
  const S1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const VideoOverlayPage(
      pageKey: 's1',
      videoAsset: 'assets/videos/s1.mp4',
      detailImageAsset: 'assets/images/s1_1.png',
      title: 'Verde Clair',
      subtitle: 'The breath of the meadow',
      quote:
          '“When morning light touches the earth, purity becomes visible.\nYou breathe, and the world feels infinite again.”',
    );
  }
}
