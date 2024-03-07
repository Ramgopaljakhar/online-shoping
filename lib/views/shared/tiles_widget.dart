import 'package:flutter/material.dart';
import 'package:online_shop/utils/colors.dart';
import 'package:online_shop/views/shared/export.dart';
import 'package:online_shop/views/shared/export_package.dart';

Widget tilesWidget(
  BuildContext context, {
  required String title,
  required IconData leading,
  Function()? onTap,
}) {
  return ListTile(
    onTap: onTap, 
    leading: Icon(
      leading,
      color: gray700,
    ),
    title: Text(
      title,
      style: Theme.of(context).textTheme.bodyMedium,
    ),
    trailing: title != "Settings"
        ? const Icon(
            Icons.keyboard_arrow_right,
            size: 18,
          )
        : Image.asset(
            'assets/images/us.jpg',
            width: 15,
            height: 20,
          ),
  );
}
