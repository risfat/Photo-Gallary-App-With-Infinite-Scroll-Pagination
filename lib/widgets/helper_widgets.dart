import 'package:flutter/material.dart';

import '../theme/app_style.dart';


Widget  MediumlargeText({var center, text,context,Color? color}){
  return Text(
    '$text',
    textAlign: center == null? TextAlign.center:center!=null&&center == false?TextAlign.left:TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 18,
      fontFamily: AppFonts.poppinsMedium,
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget  HeadingText({var center, text,context,Color? color}){
  return Text(
    '$text',
    textAlign: center == null? TextAlign.center:center!=null&&center == false?TextAlign.left:TextAlign.center,

    style: TextStyle(
      color: color,
      fontSize: 20,
      fontFamily: AppFonts.poppinsSemiBold,
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget  MediumText({var center, text,context,Color? color}){
  return Text(
    '$text',
    textAlign: center == null? TextAlign.center:center!=null&&center == false?TextAlign.left:TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 16,
      fontFamily: AppFonts.poppinsMedium,
      fontWeight: FontWeight.bold,
    ),
  );
}
Widget  ExtraLargeText({var center, text,context,Color? color}){
  return Text(
    '$text',
    textAlign: center == null? TextAlign.center:center!=null&&center == false?TextAlign.left:TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 50,
      fontFamily: AppFonts.poppinsMedium,
      fontWeight: FontWeight.w600,
      //  height: responsiveHeight(60, context),
    ),
  );
}
Widget  normalText({var center, text,context,Color? color}){
  return Text(
    '$text',
    textAlign: center == null? TextAlign.center:center!=null&&center == false?TextAlign.left:TextAlign.center,
    // overflow: TextOverflow.ellipsis,
    style: TextStyle(

      color: color,
      fontSize: 14,
      fontFamily: AppFonts.poppinsSemiBold,
      fontWeight: FontWeight.w600,
      //  height: responsiveHeight(60, context),
    ),
  );
}

Widget  smallText({var center, text,context,Color? color}){
  return Text(
    '$text',
    textAlign: center == null? TextAlign.center:center!=null&&center == false?TextAlign.left:TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 11,
      fontFamily: AppFonts.poppinsMedium,
      fontWeight: FontWeight.w600,
      //  height: responsiveHeight(60, context),
    ),
  );
}