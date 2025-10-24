import 'package:flutter/material.dart';

import '../widgets/video_overlay_page.dart';

class S2Screen extends StatelessWidget {
  const S2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const VideoOverlayPage(
      pageKey: 's2',
      videoAsset: 'assets/videos/s2.mp4',
      detailImageAsset: 'assets/images/s2_1.png',
      title: 'Moss Reverie',
      subtitle: 'Echoes of damp earth',
      quote: '“Where shade breathes softly, patience becomes fragrance.”',
    );
  }
}

class S3Screen extends StatelessWidget {
  const S3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const VideoOverlayPage(
      pageKey: 's3',
      videoAsset: 'assets/videos/s3.mp4',
      detailImageAsset: 'assets/images/s3_1.png',
      title: 'Luna Marina',
      subtitle: 'Salt, night and hush',
      quote: '“Moonlight rinses the horizon; the sea learns to whisper.”',
    );
  }
}

class S4Screen extends StatelessWidget {
  const S4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const VideoOverlayPage(
      pageKey: 's4',
      videoAsset: 'assets/videos/s4.mp4',
      detailImageAsset: 'assets/images/s4_1.png',
      title: 'Terra Sienna',
      subtitle: 'Warm dust of time',
      quote: '“Grain, clay, and sunlight; memory glows under the skin.”',
    );
  }
}

class S5Screen extends StatelessWidget {
  const S5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const VideoOverlayPage(
      pageKey: 's5',
      videoAsset: 'assets/videos/s5.mp4',
      detailImageAsset: 'assets/images/s5_1.png',
      title: 'Selva Intensa',
      subtitle: 'Green depths, slow thunder',
      quote: '“Roots speak in silence; the heart learns a wilder rhythm.”',
    );
  }
}
