import 'package:flutter/material.dart';

class AppRoutes {
  static const String detail = '/detail';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case detail:
        final args = settings.arguments;
        if (args is ImageDetailArgs) {
          return MaterialPageRoute(
            builder: (_) => ImageDetailScreen(args: args),
            settings: settings,
          );
        }
        return _error('Invalid arguments for $detail: $args');
    }
    return null;
  }

  static Route<dynamic> _error(String message) => MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text(
              message,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
}

/// 상세 PNG로 이동 시 넘기는 파라미터
class ImageDetailArgs {
  final String pageKey;
  final String imageAsset;
  const ImageDetailArgs({required this.pageKey, required this.imageAsset});
}

/// 이미지 상세 화면 (탭 시 뒤로)
class ImageDetailScreen extends StatelessWidget {
  final ImageDetailArgs args;
  const ImageDetailScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(args.pageKey)),
      body: Center(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.of(context).pop(),
          child: Image.asset(
            args.imageAsset,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => Text(
              'Image not found: ${args.imageAsset}',
              style: const TextStyle(color: Colors.white70),
            ),
          ),
        ),
      ),
    );
  }
}
