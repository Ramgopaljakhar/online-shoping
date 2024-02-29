import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:online_shop/provider/main_screen_provider.dart';
import 'package:online_shop/utils/colors.dart';
import 'package:online_shop/views/shared/bottom_nav_widget.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenProvider>(
        builder: (context, mainScreenProvider, child) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              color: black,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                botomNavWidget(
                  icon: mainScreenProvider.pageIndex == 0
                      ? Icons.home
                      : Icons.home_outlined,
                  onTap: () {
                    mainScreenProvider.pageIndex = 0;
                  },
                ),
                botomNavWidget(
                  icon: mainScreenProvider.pageIndex == 1
                      ? Icons.search
                      : Icons.search_outlined,
                  onTap: () {
                    mainScreenProvider.pageIndex = 1;
                  },
                ),
                botomNavWidget(
                  icon: mainScreenProvider.pageIndex == 2
                      ? Ionicons.heart
                      : Ionicons.heart_circle_outline,
                  onTap: () {
                    mainScreenProvider.pageIndex = 2;
                  },
                ),
                botomNavWidget(
                  icon: mainScreenProvider.pageIndex == 3
                      ? Ionicons.cart
                      : Ionicons.cart_outline,
                  onTap: () {
                    mainScreenProvider.pageIndex = 3;
                  },
                ),
                botomNavWidget(
                  icon: mainScreenProvider.pageIndex == 4
                      ? Icons.person
                      : Icons.person_outline,
                  onTap: () {
                    mainScreenProvider.pageIndex = 4;
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
