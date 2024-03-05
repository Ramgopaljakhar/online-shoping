// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:online_shop/views/shared/export.dart';
import 'package:online_shop/views/shared/export_package.dart';

Widget customField({
  Key? key,
  required TextEditingController controller,
  required String hintText,
  TextInputType? keyboard,
  String? Function(String?)? validator,
  Widget? suffixIcon,
  Widget? prefixIcon,
  void Function()? onEditingComplete,
  bool? obscureText,
}) {
  return Container(
    decoration: const BoxDecoration(
      color: white,
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    child: TextField(
      key: key,
      controller: controller,
      keyboardType: keyboard,
      obscureText: obscureText ?? false,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintStyle: appstyle(
          13,
          gray,
          FontWeight.w400,
        ),
        contentPadding: const EdgeInsets.only(top: 9),
      ),
    ),
  );
}
