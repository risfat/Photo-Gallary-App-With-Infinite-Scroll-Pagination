import 'package:flutter/material.dart';

import '../utils/color_constant.dart';


class AppDecoration {

  static BoxDecoration get outlineTeal =>
      BoxDecoration(
        color: ColorConstant.white,
        border: Border.all(
          color: ColorConstant.tranquilPond,
          width: 2,
        ),
      );

  static BoxDecoration get outlineGray =>
      BoxDecoration(
        color: ColorConstant.appleRose,
        border: Border.all(
            color: ColorConstant.grey,
            width: 1
        ),
      );


}
