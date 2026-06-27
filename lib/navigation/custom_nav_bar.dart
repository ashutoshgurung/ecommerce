import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomNavBar extends StatefulWidget {
  final NavBarConfig navBarConfig;

  const CustomNavBar({super.key, required this.navBarConfig});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounce;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    _bounce = Tween<double>(
      begin: 0,
      end: 8,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = widget.navBarConfig;

    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        // 🌫️ NAV BAR BACKGROUND
        Container(
         margin: EdgeInsets.zero,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.85),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 15),
            ],
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildIcon(config, 0, Icons.home),
              _buildIcon(config, 1, Icons.search),

              const SizedBox(width: 40), // space for center button

              _buildIcon(config, 3, Icons.favorite_border),
              _buildIcon(config, 4, Icons.person),
            ],
          ),
        ),

        // 🟡 FLOATING QR BUTTON (ANIMATED)
        AnimatedBuilder(
          animation: _bounce,
          builder: (context, child) {
            return Positioned(
              top: -20 - _bounce.value,
              
              child: Material(
                color: Colors.transparent,
                elevation: 12,
                child: GestureDetector(
                  onTap: () => config.onItemSelected(2),
                  child: AnimatedBuilder(
                    animation: _bounce,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, -_bounce.value),
                        child: child,
                      );
                    },
                    child: Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.yellow.withOpacity(0.4),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.qr_code_scanner,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildIcon(NavBarConfig config, int index, IconData icon) {
    final isSelected = config.selectedIndex == index;

    return GestureDetector(
      onTap: () => config.onItemSelected(index),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: isSelected ? 1.3 : 1.0,
        child: Icon(icon, color: isSelected ? Colors.yellow : Colors.grey),
      ),
    );
  }
}
