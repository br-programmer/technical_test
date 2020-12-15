import 'package:flutter/material.dart';
import 'package:technical_test/presentation/home/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const Header(),
            const Options(),
          ],
        ),
      ),
    );
  }
}
