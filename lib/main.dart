import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:technical_test/presentation/common/app_colors.dart';
import 'package:technical_test/presentation/home/home_bloc.dart';
import 'package:technical_test/presentation/home/home_page.dart';
import 'package:technical_test/presentation/i_need/i_need_bloc.dart';
import 'package:technical_test/presentation/i_need/i_need_page.dart';

import 'data/datasource/product_repository_impl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => INeedBLoC()),
        ChangeNotifierProvider(
          create: (_) => HomeBLoC(
            apiRepositoryInterface: ProductRepositoryImpl(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Technical Test',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
