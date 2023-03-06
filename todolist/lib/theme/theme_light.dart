import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todolist/helpers/transitions/transitions.dart';

// http://mcg.mbitson.com Color swatch generator
//Pallete: https://coolors.co/db5461-686963-8aa29e-3d5467-f1edee

Map<int, Color> primarySwatch = {
  50: const Color(0xffFBEAEC),
  100: const Color(0xffF4CCD0),
  200: const Color(0xffEDAAB0),
  300: const Color(0xffE68790),
  400: const Color(0xffE06E79),
  500: const Color(0xffDB5461),
  600: const Color(0xffD74D59),
  700: const Color(0xffD2434F),
  800: const Color(0xffCD3A45),
  900: const Color(0xffC42933),
};

Map<int, Color> secondarySwatch = {
  50: const Color(0xffEDEDEC),
  100: const Color(0xffD2D2D0),
  200: const Color(0xffB4B4B1),
  300: const Color(0xff959692),
  400: const Color(0xff7F807A),
  500: const Color(0xff686963),
  600: const Color(0xff60615B),
  700: const Color(0xff555651),
  800: const Color(0xff4B4C47),
  900: const Color(0xff3A3B35)
};

Map<int, Color> errorSwatch = {
  50: const Color(0xffFEEAE9),
  100: const Color(0xffFCC1BD),
  200: const Color(0xffFA9891),
  300: const Color(0xffF76E64),
  400: const Color(0xffF54538),
  500: const Color(0xffF31B0C),
  600: const Color(0xffDE190B),
  700: const Color(0xffC7160A),
  800: const Color(0xff9B1108),
  900: const Color(0xff6E0C05)
};

Map<int, Color> accentSwatch = {
  50: const Color(0xffFFFBE8),
  100: const Color(0xffFFF3B9),
  200: const Color(0xffFFD98B),
  300: const Color(0xffFFCA5D),
  400: const Color(0xffFFBB2E),
  500: const Color(0xffFFAC00),
  600: const Color(0xffD1AE00),
  700: const Color(0xffA28700),
  800: const Color(0xff746000),
  900: const Color(0xff463A00)
};

var primaryColor = MaterialColor(primarySwatch[600]!.value, primarySwatch);

var secondaryColor =
    MaterialColor(secondarySwatch[600]!.value, secondarySwatch);

var tertiaryColor = MaterialColor(accentSwatch[500]!.value, accentSwatch);

var errorColor = MaterialColor(errorSwatch[600]!.value, errorSwatch);

Color bodyBackground = const Color(0xffF1EDEE);
Color black = const Color(0xff2f2f2f);

final ThemeData theme = ThemeData(
  scaffoldBackgroundColor: bodyBackground,
  backgroundColor: primaryColor,
  fontFamily: "Roboto",
  primaryColor: primaryColor,
  primarySwatch: primaryColor,
  primaryColorDark: primaryColor.shade900,
  primaryColorLight: primaryColor.shade300,
  errorColor: errorColor,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primaryContainer: primaryColor,
    secondaryContainer: secondaryColor,
    tertiaryContainer: tertiaryColor,
    errorContainer: errorColor,
    onPrimaryContainer: Colors.white,
    onSecondaryContainer: Colors.white,
    onTertiaryContainer: black,
    onErrorContainer: Colors.red,
    primary: primaryColor,
    onPrimary: Colors.white,
    secondary: secondaryColor,
    onSecondary: Colors.white,
    tertiary: tertiaryColor,
    onTertiary: black,
    error: Colors.red,
    onError: Colors.red,
    background: bodyBackground,
    onBackground: black,
    surface: Colors.white,
    onSurface: black,
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
    color: primaryColor,
    titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 17.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600),
    centerTitle: true,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(height: 64 / 57, fontSize: 57),
    displayMedium: TextStyle(height: 52 / 45, fontSize: 45),
    displaySmall: TextStyle(height: 44 / 36, fontSize: 36),
    headlineLarge: TextStyle(height: 40 / 32, fontSize: 32),
    headlineMedium:
        TextStyle(height: 36 / 28, fontSize: 28, fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(height: 32 / 24, fontSize: 24),
    titleLarge: TextStyle(
      height: 28 / 22,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      height: 24 / 16,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.15,
    ),
    titleSmall: TextStyle(
        height: 20 / 14,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1),
    bodyLarge: TextStyle(height: 24 / 16, fontSize: 16, letterSpacing: 0.5),
    bodyMedium: TextStyle(height: 20 / 14, fontSize: 14, letterSpacing: 0.25),
    bodySmall: TextStyle(height: 16 / 12, fontSize: 12, letterSpacing: 0.4),
    labelLarge: TextStyle(height: 20 / 14, fontSize: 14, letterSpacing: 0.1),
    labelMedium: TextStyle(height: 16 / 12, fontSize: 12, letterSpacing: 0.5),
    labelSmall: TextStyle(height: 16 / 11, fontSize: 11, letterSpacing: 0.4),
  ),
  listTileTheme: const ListTileThemeData(
    minLeadingWidth: 20,
  ),
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: FadePageTransitionBuilder(),
    TargetPlatform.iOS: FadePageTransitionBuilder()
  }),
  inputDecorationTheme: InputDecorationTheme(
    alignLabelWithHint: true,
    labelStyle: const TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      letterSpacing: 0.1,
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 10,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: black,
      ),
      borderRadius: BorderRadius.circular(6),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: primaryColor,
      ),
      borderRadius: BorderRadius.circular(6),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: errorColor,
      ),
      borderRadius: BorderRadius.circular(6),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: errorColor,
      ),
      borderRadius: BorderRadius.circular(6),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1.5,
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(6),
    ),
  ),
  cardTheme: const CardTheme(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(6),
      ),
    ),
  ),
);
