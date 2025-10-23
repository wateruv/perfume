import 'package:flutter/material.dart';
import 'routes.dart';
import 'screens/s1_screen.dart';
import 'screens/s_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PerfumeApp());
}

class PerfumeApp extends StatelessWidget {
  const PerfumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfume App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}

/// 메인 스와이프 컨테이너: s1~s5
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = const [
      S1Screen(),
      S2Screen(),
      S3Screen(),
      S4Screen(),
      S5Screen(),
    ];

    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: pages.length,
      itemBuilder: (context, i) => pages[i],
    );
  }
}
