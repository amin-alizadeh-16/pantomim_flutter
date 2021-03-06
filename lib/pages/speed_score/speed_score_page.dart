import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pantomim_flutter/pages/speed_score/speed_score_notifier.dart';
import 'package:pantomim_flutter/pages/start_game/start_game_page.dart';
import 'package:pantomim_flutter/theme/app_theme.dart';
import 'package:pantomim_flutter/theme/colors.dart';
import 'package:pantomim_flutter/theme/dimense.dart';
import 'package:pantomim_flutter/widgets/dialog_widgets.dart';
import 'package:pantomim_flutter/widgets/neu_button.dart';
import 'package:pantomim_flutter/widgets/score_box.dart';
import 'package:stacked/stacked.dart';

import '../../local_data.dart';

class SpeedScore extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SpeedScoreState();
}

class SpeedScoreState extends State<SpeedScore> {
  ScrollController _rrectController =
      ScrollController(initialScrollOffset: 1.0);

  @override
  Widget build(BuildContext context) {
    Future<bool> _willPopCallback() async {
      closeGameDialog(context);
      return false;
    }

    var theme = Theme.of(context);
    return ViewModelBuilder<SpeedScoreVm>.reactive(
        viewModelBuilder: () => SpeedScoreVm(),
        builder: (context, model, child) => SafeArea(
              top: false,
              bottom: true,
              child: WillPopScope(
                onWillPop: _willPopCallback,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Scaffold(
                    backgroundColor: appTheme(context).accentColor,
                    body: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Container(
                        width: fullWidth(context),
                        height: fullHeight(context),
//          margin: EdgeInsets.only(top: fullWidth(context) / 10.5),
                        child: Stack(
                          children: [
//              Container(
//                  margin: EdgeInsets.only(bottom: smallSize(context)),
//                  height: xlargeSize(context),
//                  width: fullWidth(context) / 1.8,
//                  child: Neumorphic(
//                    style: NeumorphicStyle(
//                      color: appTheme(context).accentColor,
//                      depth: 3,
//                      intensity: 6,
//                    ),
//                    child: NeumorphicText(
//                      'شمارش امتیازات',
//                      textAlign: TextAlign.center,
//                      textStyle: NeumorphicTextStyle(
//                          fontFamily: 'aviny',
//                          fontSize: fullWidth(context) / 11,
//                          height: fullWidth(context) / 215),
//                    ),
//                  )),
                            Positioned(
                              top: fullWidth(context) / 4.5,
                              right: standardSize(context),
                              left: standardSize(context),
                              bottom: fullHeight(context) / 7.3,
                              child: Neumorphic(
                                style: NeumorphicStyle(
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(
                                          standardSize(context))),
                                  color: appTheme(context).accentColor,
                                  depth: 8,
                                  surfaceIntensity: 5,
                                  intensity: 2,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: fullWidth(context) / 9.4,
                                      bottom: fullHeight(context) / 11.6),
                                  child: DraggableScrollbar.rrect(
                                    backgroundColor: AppColors.primaryColor,
                                    alwaysVisibleScrollThumb: true,
                                    controller: _rrectController,
                                    padding: EdgeInsets.only(
                                        bottom: smallSize(context)),
                                    child: ListView.builder(
                                      padding: EdgeInsets.all(0),
                                      controller: _rrectController,
                                      addAutomaticKeepAlives: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: speedScoreData().length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) => scoreBox(
                                          speedScoreData()[index], context),

//                              Container(
//                                margin: EdgeInsets.symmetric(
//                                    horizontal: smallSize(context),vertical: mediumSize(context)),
//                                child: Column(
//                                  children: [
//                                    scoreBox(context, 'مگس کش', '1 امتیاز',
//                                        'assets/close_large_icon.svg',
//                                        ),
//                                    scoreBox(context, 'مگس کش', '1 امتیاز',
//                                        'assets/thick_icon.svg',
//                                        ),
//                                    scoreBox(context, 'مگس کش', '1 امتیاز',
//                                        'assets/close_large_icon.svg',
//                                        ),
//                                    scoreBox(context, 'مگس کش', '1 امتیاز',
//                                        'assets/close_large_icon.svg',
//                                        ),
//                                    scoreBox(context, 'مگس کش', '1 امتیاز',
//                                        'assets/close_large_icon.svg',
//                                        ),
//                                    scoreBox(context, 'مگس کش', '1 امتیاز',
//                                        'assets/close_large_icon.svg',
//                                        ),
//                                    scoreBox(context, 'پاس', '1 امتیاز',
//                                        'assets/thick_icon.svg',
//                                        ),
//                                    scoreBox(context, 'دست', '1 امتیاز',
//                                        'assets/thick_icon.svg',
//                                        ),
//                                    scoreBox(context, 'گل', '1 امتیاز',
//                                        'assets/close_large_icon.svg',
//                                        ),
//                                    scoreBox(context, 'پروتون', '1 امتیاز',
//                                        'assets/thick_icon.svg',
//                                        )
//                                  ],
//                                ),
//                              ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.0, -0.88),
                              child: Container(
                                width: fullWidth(context) / 1.5,
                                height: xlargeSize(context),
                                margin: EdgeInsets.only(
                                    top: standardSize(context),
                                    bottom: mediumSize(context)),
                                child: Neumorphic(
                                  style: NeumorphicStyle(
                                      depth: 1.75,
                                      intensity: 3.5,
                                      color: AppColors.accentColor,
                                      boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(
                                            fullWidth(context) / 1),
                                      )),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text("امتیازات این دور: 35",
                                        style: theme.textTheme.headline3
                                            .copyWith(
                                                fontSize:
                                                    headline3Size(context) /
                                                        1.4)),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.08, 0.725),
                              child: Container(
                                width: fullWidth(context) / 1.4,
                                height: fullWidth(context) / 8,
                                margin: EdgeInsets.only(
                                    top: standardSize(context),
                                    bottom: mediumSize(context)),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: smallSize(context)),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                          width: largeSize(context),
                                          height: largeSize(context),
                                          child: Neumorphic(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: xSmallSize(context),
                                                vertical: xSmallSize(context)),
                                            style: NeumorphicStyle(
                                              color:
                                                  appTheme(context).accentColor,
                                              depth: 2,
                                              intensity: 4,
                                              boxShape:
                                                  NeumorphicBoxShape.circle(),
                                            ),
                                            child: SvgPicture.asset(
                                                "assets/thick_icon.svg",
                                                height: mediumSize(context),
                                                width: mediumSize(context)),
                                          )),
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'پاسخ درست',
                                          maxLines: 1,
                                          style: appTheme(context)
                                              .textTheme
                                              .bodyText1
                                              .copyWith(fontFamily: 'kalameh'),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                          width: largeSize(context),
                                          height: largeSize(context),
                                          child: Neumorphic(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: xSmallSize(context),
                                                vertical: xSmallSize(context)),
                                            style: NeumorphicStyle(
                                              color:
                                                  appTheme(context).accentColor,
                                              depth: 2,
                                              intensity: 4,
                                              boxShape:
                                                  NeumorphicBoxShape.circle(),
                                            ),
                                            child: SvgPicture.asset(
                                                "assets/close_large_icon.svg",
                                                height: mediumSize(context),
                                                width: mediumSize(context)),
                                          )),
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'پاسخ غلط',
                                          maxLines: 1,
                                          style: appTheme(context)
                                              .textTheme
                                              .bodyText1
                                              .copyWith(fontFamily: 'kalameh'),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                margin: EdgeInsets.all(standardSize(context)),
                                child: SizedBox(
                                  height: fullWidth(context) / 7,
                                  width: fullWidth(context) / 7,
                                  child: NeuButton(
                                    () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  StartGamePage()));
                                    },
                                    svg: ("assets/icon_next.svg"),
                                    colorSvg: AppColors.primaryColor,
                                    size: mediumSize(context) / 1.15,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
