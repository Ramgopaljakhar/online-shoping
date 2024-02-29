import 'package:flutter/material.dart';
import 'package:online_shop/utils/app_style.dart';
import 'package:online_shop/utils/colors.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key,
    this.onTap,
    required this.label,
  });
  final void Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              label,
              style: appstyle(18, white, FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
