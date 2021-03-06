import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lottie/lottie.dart';
import 'package:pantomim_flutter/pages/screen.dart';
import 'package:pantomim_flutter/pages/winner/winner_page.dart';
import 'package:pantomim_flutter/theme/colors.dart';
import 'package:pantomim_flutter/theme/dimense.dart';
import 'package:pantomim_flutter/widgets/dialog_widgets.dart';
import 'package:pantomim_flutter/widgets/neu_button.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import 'game_notifier.dart';
import '../neu_progress_pie_bar.dart';

class GamePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  final timeService = TimerService();

  Future<bool> _willPopCallback() async {
    closeGameDialog(context);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ViewModelBuilder<GameVm>.reactive(
    viewModelBuilder: () => GameVm(),
    builder: (context, model, child) =>
      SafeArea(
      top: false,
      bottom: true,
      child: WillPopScope(
        onWillPop: _willPopCallback,
        child: ChangeNotifierProvider<TimerService>(
          builder: (context, child) => Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
                backgroundColor: NeumorphicTheme.accentColor(context),
                body: Stack(
                  children: [
                    Center(
                      child: NeuProgressPieBar(),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.all(standardSize(context)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: fullWidth(context) / 6.5,
                              height: fullWidth(context) / 6.5,
                              child: NeuButton(() {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WinnerPage()));
                              },
                                  title: "درست",
                                  color: Color(0xff388E3C),
                                  align: TextAlign.center),
                            ),
                            SizedBox(
                              width: fullWidth(context) / 6.5,
                              height: fullWidth(context) / 6.5,
                              child: NeuButton(
                                () {},
                                svg: "assets/error_icon.svg",
                                colorSvg: Color(0xffF57C00),
                                align: TextAlign.center,
                                size: mediumSize(context) / 1.15,
                              ),
                            ),
                            SizedBox(
                                width: fullWidth(context) / 6,
                                height: fullWidth(context) / 6,
                                child: NeuStartButton()),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: fullHeight(context) / 1.9,
                      right: fullWidth(context) / 3,
                      left: fullWidth(context) / 3,
                      bottom: fullHeight(context) / 2.4,
                      child: Neumorphic(
                        child: Center(
                          child: Text(
                            "تعداد دور 3  از  8",
                            style: theme.textTheme.subtitle1
                                .copyWith(fontSize: mediumSize(context)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.stadium(),
                          depth: 10,
                          lightSource: LightSource.topLeft,
                          color: AppColors.accentColor,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, -0.1),
                      child: Text(
                        "صندلی",
                        style: theme.textTheme.headline3,
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, -0.8),
                      child: Container(
                        child: Text(
                          "01:59",
                          style: theme.textTheme.subtitle2
                              .copyWith(fontSize: subTitleSize(context) / 0.7),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.2, -0.8),
                      child: Container(
                        width: fullWidth(context) / 10,
                        height: fullWidth(context) / 10,
                        child: Lottie.asset('assets/timer_lottie.json'),
                        margin: EdgeInsets.only(left: standardSize(context)),
                      ),
                    ),
                  ],
                )),
          ),
          create: (_) => timeService,
        ),
      ),
    ));
  }
}
