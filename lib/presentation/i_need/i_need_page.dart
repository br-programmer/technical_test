import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:technical_test/presentation/common/app_colors.dart';
import 'package:technical_test/presentation/i_need/i_need_bloc.dart';
import 'package:technical_test/presentation/i_need/widgets/widgets.dart';

class INeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const MyAppBar(),
              const _Body(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key key}) : super(key: key);

  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  final _key = GlobalKey();
  final _height = ValueNotifier<double>(0.0);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _height.value = _key.currentContext.size.height;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      key: _key,
      child: SingleChildScrollView(
        child: ValueListenableBuilder<double>(
          valueListenable: _height,
          builder: (_, value, __) {
            return Container(
              height: value,
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  const _HeaderBody(),
                  const MyCustomSteeps(),
                  const _Content(),
                  const ButtonBody(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<INeedBLoC>(context, listen: false);
    return Expanded(
      child: ValueListenableBuilder<INeedState>(
        valueListenable: bloc.state,
        builder: (_, state, __) => AnimatedSwitcher(
          duration: duration,
          child: (state == INeedState.howToPost) ? const HowToPost() : Container(),
        ),
      ),
    );
  }
}

class _HeaderBody extends StatelessWidget {
  const _HeaderBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<INeedBLoC>(context, listen: false);
    return ValueListenableBuilder<INeedState>(
      valueListenable: bloc.state,
      builder: (_, state, __) {
        final step = (state == INeedState.howToPost) ? '1' : '2';
        return Text(
          'Paso $step de 2',
          style: GoogleFonts.poppins(color: AppColors.greyDark, fontSize: 17, fontWeight: FontWeight.w600),
        );
      },
    );
  }
}
