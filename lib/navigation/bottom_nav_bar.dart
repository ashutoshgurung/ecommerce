import 'package:ecommerce_app/navigation/custom_nav_bar.dart';
import 'package:ecommerce_app/view/favourite_screen.dart';
import 'package:ecommerce_app/view/home_screen.dart';
import 'package:ecommerce_app/view/profile_screen.dart';
import 'package:ecommerce_app/view/qr_scan_screen.dart';
import 'package:ecommerce_app/view/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final PersistentTabController controller = PersistentTabController(
    initialIndex: 0,
  );

  final List<PersistentTabConfig> tabs = [
    PersistentTabConfig(
      screen: const HomeScreen(),
      item: ItemConfig(
        icon: const Icon(Icons.home),
        title: "Home",
        activeForegroundColor: Colors.blue,
        inactiveForegroundColor: Colors.grey,
      ),
    ),
 
    PersistentTabConfig(
      screen: const SearchScreen(),
      item: ItemConfig(
        icon: const Icon(Icons.search),
        title: "Search",
        activeForegroundColor: Colors.blue,
        inactiveForegroundColor: Colors.grey,
      ),
    ),

    PersistentTabConfig(
      screen: const QrScanScreen(),
      item: ItemConfig(
        icon: const Icon(Icons.qr_code_scanner),
        title: "Scan",
        activeForegroundColor: Colors.blue,
        inactiveForegroundColor: Colors.grey,
      ),
    ),

    PersistentTabConfig(
      screen: const FavouriteScreen(),
      item: ItemConfig(
        icon: const Icon(Icons.favorite_outline),
        title: "Favourite",
        activeForegroundColor: Colors.blue,
        inactiveForegroundColor: Colors.grey,
      ),
    ),

    PersistentTabConfig(
      screen: const ProfileScreen(),
      item: ItemConfig(
        icon: const Icon(Icons.person),
        title: "Profile",
        activeForegroundColor: Colors.blue,
        inactiveForegroundColor: Colors.grey,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: controller,
      tabs: tabs,
      backgroundColor: Colors.transparent,
      navBarBuilder: (navBarConfig) =>
          CustomNavBar(navBarConfig: navBarConfig),
          
    );
  }
}
