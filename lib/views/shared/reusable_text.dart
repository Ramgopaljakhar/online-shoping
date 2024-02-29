import 'package:flutter/material.dart';


Widget reusableText({
  required String title,
  required TextStyle style
  }) {
  return Text(
    title,
    maxLines: 1,
    overflow: TextOverflow.fade,
    textAlign: TextAlign.left,
    softWrap: false,
    style:style,
  );
}
