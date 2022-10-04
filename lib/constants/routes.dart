import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
const createOrUpdateNoteRoute = '/notes/new-note/';

//color schemes
const kPrimaryColor = Color(0xFF307D7E);
const kTextClor = Color(0xff3c4046);
const kBackgroundColor = Color(0xFFF9F8FD);
const kDarkPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);
const kLightPrimaryColor = Color(0xFFFFFFFF);
const kLightSecondaryColor = Color(0xFFF3F7FB);
const kAccentColor = Color(0xFFFFC107);

//padding
const double kDefaultPadding = 20.0;
const kSpacingUnit = 10;

//Title 
final kTitleTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 2),
  fontWeight: FontWeight.w600,
);

//caption
final kCaptionTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.3),
  fontWeight: FontWeight.w100,
);

//Button
final kButtonTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
  fontWeight: FontWeight.w400,
  color: kDarkPrimaryColor,
);