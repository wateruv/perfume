import 'package:flutter/material.dart';

const List<Shadow> _overlayShadows = [
  const Shadow(
    offset: Offset(4, 4),
    blurRadius: 4,
    color: Color(0x40000000),
  ),
];

const TextStyle overlayTitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 54,
  fontWeight: FontWeight.w400,
  height: 1.55,
  shadows: _overlayShadows,
);

const TextStyle overlaySubtitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 17,
  fontWeight: FontWeight.w400,
  height: 1.55,
  shadows: _overlayShadows,
);

const TextStyle overlayQuoteStyle = TextStyle(
  color: Colors.white,
  fontSize: 12,
  fontWeight: FontWeight.w400,
  height: 1.55,
  shadows: _overlayShadows,
);