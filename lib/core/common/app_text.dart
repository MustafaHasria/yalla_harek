
import 'package:flutter/material.dart';

import 'app_color.dart';

class MyText{

  static TextStyle? headline1(BuildContext context){
    return Theme.of(context).textTheme.headline1;
  }

  static TextStyle? headline2(BuildContext context){
    return Theme.of(context).textTheme.headline2;
  }

  static TextStyle? headline3(BuildContext context){
    return Theme.of(context).textTheme.headline3;
  }

  static TextStyle? headline4(BuildContext context){
    return Theme.of(context).textTheme.headline4;
  }

  static TextStyle? headline5(BuildContext context){
    return Theme.of(context).textTheme.headline5;
  }

  static TextStyle? title(BuildContext context){
    return Theme.of(context).textTheme.headline6;
  }

  static TextStyle? myTitle(BuildContext context) {
    return Theme
        .of(context)
        .textTheme
        .headline6!
        .copyWith(
      color: MyColors.grey_100_,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 12.0,
    );
  }

  static TextStyle medium(BuildContext context){
    return Theme.of(context).textTheme.subtitle1!.copyWith(
      fontSize: 18,
    );
  }

  static TextStyle? subhead(BuildContext context){
    return Theme
        .of(context)
        .textTheme
        .subtitle1!
        .copyWith(
      color: MyColors.primaryTextColor,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 12.0,
    );
  }

  static TextStyle? body2(BuildContext context){
    return Theme.of(context).textTheme.bodyText1;
  }

  static TextStyle? body1(BuildContext context){
    return Theme.of(context).textTheme.bodyText2;
  }

  static TextStyle? caption(BuildContext context){
    return Theme.of(context).textTheme.caption;
  }

  static TextStyle button(BuildContext context){
    return Theme.of(context).textTheme.button!.copyWith(
        letterSpacing: 1
    );
  }

  static TextStyle? subtitle(BuildContext context){
    return Theme.of(context).textTheme.subtitle2;
  }

  static TextStyle? overline(BuildContext context){
    return Theme.of(context).textTheme.overline;
  }
}