import 'package:flutter/material.dart';
import 'package:get/get.dart';

//--------------------- Screensize & SizedBoxes -----------------------------

double screenHeight = Get.height;

double screenWidth = Get.width;

const SizedBox sizedBox10Wide = SizedBox(width: 10);
const SizedBox sizedBox10High = SizedBox(height: 10);
const SizedBox sizedBox10Square = SizedBox(height: 10, width: 10);
const SizedBox sizedBox5Wide = SizedBox(width: 5);
const SizedBox sizedBox5High = SizedBox(height: 5);

//---------------------------------- COLORS ---------------------------------

const kDefaultPurple = Color(0xff0A0E21);
const kDefaultDarkBlue = Color(0xff131a3b);
const kDefaultDarkBlue2 = Color(0xff0f142e);
const kDefaultDarkBlue3 = Color(0xff0e132e);
const kDefaultDarkBlue4 = Color(0xff0b1026);
const kDefaultDarkBlue5 = Color(0xff000063);
const kTextFieldColor = Color(0xFF1D1E33);
const textFieldColor = Color(0xff111328);
const kAppBarColor1 = Color(0xff151e47);
const kBottomContainerColor = Color(0xFFEB1555);
const kDarkModeDefaultColor = Color(0xff121212);
const kDarkModeDefaultColor2 = Color(0xff1F1B24);
const kDarkModeDefaultColor3 = Color(0xff332940);
const kClockBackgroundColor = Colors.grey;
const kDeepBlue1 = Color.fromRGBO(20, 27, 41, .2);
Color kDeepBlue2 = hexToColor('#0d121b');
Color kDeepBlue3 = hexToColor('#1c2438');
Color kNeonYellow = hexToColor('#fcfb26');

//------------------------------ DYNAMIC THEME COLORS ---------------------------------

Color accentColor(BuildContext context) => Theme.of(context).accentColor;

Color primaryColor(BuildContext context) => Theme.of(context).primaryColor;

Color scaffoldBackgroundColor(BuildContext context) =>
    Theme.of(context).scaffoldBackgroundColor;

Color gradientLightColor(BuildContext context) =>
    Theme.of(context).primaryColorLight;

Color appBarColor(BuildContext context) => Theme.of(context).backgroundColor;

Color dialogBackgroundColor(BuildContext context) =>
    Theme.of(context).dialogBackgroundColor;

Color hexToColor(String hexString, {String alphaChannel = 'FF'}) => Color(
      int.parse(
        hexString.replaceFirst('#', '0x$alphaChannel'),
      ),
    );

//Color deepBlue1 = hexToColor('#191b2a');

/* -------------------------------------------------------------------------- */
/*                                BUTTONSTYLES                                */
/* -------------------------------------------------------------------------- */
final ButtonStyle roundedWhiteButton = ElevatedButton.styleFrom(
  primary: Colors.white12,
  minimumSize: const Size(double.maxFinite, 50),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);

//------------------------------ TEXTSTYLES ---------------------------------

// TextStyle kGoogleFontMontserrat = GoogleFonts.montserrat(
//   textStyle: TextStyle(fontSize: 20.0, color: Colors.blue),
// );
//
// TextStyle kGoogleFontRaleway = GoogleFonts.raleway(
//     textStyle: TextStyle(fontSize: 17.0, color: Colors.grey[400]));
//
// TextStyle kGoogleFontNunito = GoogleFonts.nunito(
//     textStyle: TextStyle(fontSize: 17.0, color: Colors.grey[400]));
//
// TextStyle setLabelRow = GoogleFonts.nunito(
//     textStyle: TextStyle(fontSize: 15.0, color: Colors.white70));

// TextStyle kGoogleFontOpenSansCondensed = GoogleFonts.openSansCondensed(
//     textStyle: TextStyle(
//   fontSize: 20.0,
// ));
//
const TextStyle kGoogleFontOpenSansCondensed =
    TextStyle(fontFamily: 'OpenSans', fontSize: 22, color: Colors.white);

// InputDecoration kTextFieldInputDecoration = InputDecoration(
//   // focusColor: Colors.red,
//   // hoverColor: Colors.red,
//   filled: true,
//   // fillColor: kDefaultPurple,
//   // focusedBorder: InputBorder(),
//   // alignLabelWithHint: true,
//   hintStyle: kGoogleFontMontserrat,
//   border: OutlineInputBorder(
//     borderRadius: BorderRadius.all(
//       Radius.circular(10.0),
//     ),
//     borderSide: BorderSide(
//       color: Colors.red,
//       width: 5,
//       style: BorderStyle.solid,
//     ),
//
//     // borderSide: ,
//   ),
// );
//

final dialogTheme = DialogTheme(
    backgroundColor: Colors.grey[900],
    titleTextStyle: dialogTitleTextStyle,
    contentTextStyle: dialogContentTextStyle);

const dialogTitleTextStyle = TextStyle(
    color: Colors.white70,
    fontFamily: 'Roboto',
    fontSize: 23,
    fontWeight: FontWeight.w300);

const dialogContentTextStyle = TextStyle(
    color: Colors.white54,
    fontFamily: 'Roboto',
    fontSize: 19,
    fontWeight: FontWeight.w300);

const dialogActionTextStyle = TextStyle(
    color: Colors.blue,
    fontFamily: 'Roboto',
    fontSize: 20,
    fontWeight: FontWeight.w300);
