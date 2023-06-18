import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors used in this app
const primaryColor = Color.fromRGBO(17, 159, 250, 1);
const secondaryColor = Colors.white;
const bgColor = Color.fromRGBO(247, 251, 254, 1);
const textColor = Colors.black;
const lightTextColor = Colors.black26;
const transparent = Colors.transparent;

const grey = Color.fromRGBO(148, 170, 220, 1);
const purple = Color.fromRGBO(165, 80, 179, 1);
const orange = Color.fromRGBO(251, 137, 13, 1);
const green = Color.fromRGBO(51, 173, 127, 1);
const red = Colors.red;

// Default App Padding
const appPadding = 16.0;
const defaultPadding = 16.0;
TextStyle kLoginTitleStyle(Size size) => GoogleFonts.ubuntu(
  fontSize: size.height * 0.060,
  fontWeight: FontWeight.bold,
);

TextStyle kLoginSubtitleStyle(Size size) => GoogleFonts.ubuntu(
  fontSize: size.height * 0.030,
);

TextStyle kLoginTermsAndPrivacyStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: 15, color: Colors.grey, height: 1.5);

TextStyle kHaveAnAccountStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: size.height * 0.022, color: Colors.black);

TextStyle kLoginOrSignUpTextStyle(
    Size size,
    ) =>
    GoogleFonts.ubuntu(
      fontSize: size.height * 0.022,
      fontWeight: FontWeight.w500,
      color: Colors.deepPurpleAccent,
    );

TextStyle kTextFormFieldStyle() => const TextStyle(color: Colors.black);
const kTitle = 'DropDownList';

// Cities
const kTokyo = 'Tokyo';
const kNewYork = 'New York';
const kLondon = 'London';
const kParis = 'Paris';
const kMadrid = 'Madrid';
const kDubai = 'Dubai';
const kRome = 'Rome';
const kBarcelona = 'Barcelona';
const kCologne = 'Cologne';
const kMonteCarlo = 'Monte Carlo';
const kPuebla = 'Puebla';
const kFlorence = 'Florence';

// Register Page
const kRegister = 'Register';
const kFullName = 'Full Name';
const kEnterYourName = 'Enter your name';
const kEmail = 'Email';
const kEnterYourEmail = 'Enter your email';
const kPhoneNumber = 'Phone Number';
const kEnterYourPhoneNumber = 'Enter your phone number';
const kCity = 'City';
const kChooseYourCity = 'Choose your city';
const kPassword = 'Password';
const kAddYourPassword = 'Add your password';
const kREGISTER = 'REGISTER';

// Drop Down
const kDone = 'Done';
const kSearch = 'Search...';
const kCities = 'Cities';