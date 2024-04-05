import 'package:flutter/material.dart';
import '/core/presentation/styles/colors_app.dart';

/// Shadow used in cards
final cardShadow = <BoxShadow>[
  BoxShadow(
    blurRadius: 7,
    color: ColorsApp.black.withOpacity(0.10),
    offset: const Offset(0, 3),
  ),
];
