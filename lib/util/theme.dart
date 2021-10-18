import 'package:flutter/material.dart';

const Color screenGradient1 = Color(0xFFFFE5D6);
const Color screenGradient2 = Color(0xFF85D3FF);
const Color buttonGradient1 = Color(0xFF77A9E0);
const Color buttonGradient2 = Color(0xFF45B8F0);


const Color dark = Color(0xFF333E63);
const Color disabled = Color(0xFFBDBBD1);
const Color darkGrey = Color(0xFF88879C);
const Color lightGrey = Color(0xFFBDBBD1);
const Color textFieldShadowColor = Color(0xFFF9923B);
const Color textFieldBg = Color(0xFFdcecfc);

LinearGradient screenGradient = LinearGradient(
    colors: [screenGradient1, screenGradient1, screenGradient2.withOpacity(.3), screenGradient2.withOpacity(.6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);

LinearGradient buttonGradient = LinearGradient(
    colors: [buttonGradient1, buttonGradient2],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);

Shadow authBackgroundShadow = Shadow(
  color: disabled.withOpacity(.5),
  offset: Offset(0,4),
  blurRadius: 4
);
