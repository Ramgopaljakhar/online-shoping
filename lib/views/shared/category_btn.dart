import 'package:flutter/material.dart';
import 'package:online_shop/utils/app_style.dart';

class CategoryBtn extends StatelessWidget {
  const CategoryBtn(
      {super.key, this.onPress, required this.buttonClr, required this.lable});
  final void Function()? onPress;
  final Color buttonClr;
  final String lable;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.255,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: buttonClr, style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Center(
          child: Text(
            lable,
            style: appstyle(13, buttonClr, FontWeight.w300),
          ),
        ),
      ),
    );
  }
}
