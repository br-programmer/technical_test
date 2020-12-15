import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:technical_test/presentation/common/app_colors.dart';
import 'package:technical_test/presentation/i_need/i_need_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      title: 'Technical Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: INeedPage(),
    );
  }
}
