import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrotional_tracking_app/core/theming/app_colors.dart';

class NavIcon extends StatelessWidget {
  final String assetPath;
  final bool isSelected;
  final double height;

  const NavIcon({
    super.key,
    required this.assetPath,
    required this.isSelected,
    this.height = 30,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      height: height,
      colorFilter: ColorFilter.mode(
        isSelected ? AppColors.mainGreen : Colors.grey,
        BlendMode.srcIn,
      ),
    );
  }
}
