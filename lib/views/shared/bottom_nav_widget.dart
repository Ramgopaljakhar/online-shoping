import 'package:flutter/material.dart';
import 'package:online_shop/utils/colors.dart';

Widget botomNavWidget({
  required VoidCallback? onTap,
  required IconData icon,
}) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      height: 36,
      width: 36,
      child: Icon(icon, color: white),
    ),
  );
}
