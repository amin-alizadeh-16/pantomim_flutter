import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lottie/lottie.dart';
import 'package:pantomim_flutter/pages/game/game_page.dart';
import 'package:pantomim_flutter/pages/start_game/start_game_notifier.dart';
import 'package:pantomim_flutter/theme/app_theme.dart';
import 'package:pantomim_flutter/theme/colors.dart';
import 'package:pantomim_flutter/theme/dimense.dart';
import 'package:pantomim_flutter/widgets/dialog_widgets.dart';
import 'package:pantomim_flutter/widgets/neu_button.dart';
import 'package:stacked/stacked.dart';

class StartGamePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartGamePageState();
}

class StartGamePageState extends State<StartGamePage> {
  @override
  Widget build(BuildContext context) {
    Future<bool> _willPopCallback() async {
      closeGameDialog(context);
      return false;
    }

    return ViewModelBuilder<StartGameVm>.reactive(
        viewModelBuilder: () => StartGameVm(),
        builder: (context, model, child) => SafeArea(
              top: false,
              bottom: true,
              child: WillPopScope(
                onWillPop: _willPopCallback,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Scaffold(
                      backgroundColor: NeumorphicTheme.accentColor(context),
                      body: Stack(
                        children: [
                          Positioned.fill(
                            right: fullWidth(context) / 10,
                            left: fullWidth(context) / 10,
                            bottom: 0,
                            top: 0,
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.flat,
                                boxShape: NeumorphicBoxShape.circle(),
                                depth: 10,
                                lightSource: LightSource.topLeft,
                                color: AppColors.accentColor,
                              ),
                            ),
                          ),
                          Positioned(
                            right: fullWidth(context) / 5,
                            left: fullWidth(context) / 5,
                            bottom: 0,
                            top: 0,
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.concave,
                                boxShape: NeumorphicBoxShape.circle(),
                                depth: 10,
                                lightSource: LightSource.topLeft,
                                color: AppColors.accentColor,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.all(standardSize(context)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: fullWidth(context) / 6.5,
                                    height: fullWidth(context) / 6.5,
                                    child: NeuButton(() {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GamePage()));
                                    },
                                        title: "شروع",
                                        textHeight: 2.3,
                                        color: Color(0xff388E3C),
                                        align: TextAlign.center),
                                  ),
                                  SizedBox(
                                    width: fullWidth(context) / 6.5,
                                    height: fullWidth(context) / 6.5,
                                    child: NeuButton(
                                      () {},
                                      title: "تعویض",
                                      textHeight: 2.3,
                                      color: Color(0xff0090FF),
                                      align: TextAlign.center,
                                    ),
                                  ),
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
                                  "تعداد دور",
                                  style: appTheme(context).textTheme.subtitle1,
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
                              style: appTheme(context).textTheme.headline3,
                            ),
                          ),
                          Align(
                            alignment: Alignment(0, -0.8),
                            child: Container(
                              child: Text(
                                "01:59",
                                style: appTheme(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(
                                        fontSize: subTitleSize(context) / 0.7),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.2, -0.8),
                            child: Container(
                              width: fullWidth(context) / 10,
                              height: fullWidth(context) / 10,
                              child: Lottie.asset('assets/timer_lottie.json'),
                              margin:
                                  EdgeInsets.only(left: standardSize(context)),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ));
  }
}
