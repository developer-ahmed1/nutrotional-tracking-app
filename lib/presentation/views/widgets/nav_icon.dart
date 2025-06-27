import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        isSelected ? Color(0xff18ba7e) : Colors.grey,
        BlendMode.srcIn,
      ),
    );
  }
}
