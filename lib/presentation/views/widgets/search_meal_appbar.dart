import 'package:flutter/material.dart';
import 'package:nutrotional_tracking_app/core/theming/app_colors.dart';
import 'package:nutrotional_tracking_app/core/widgets/app_text_form_field.dart';

class SearchMealAppbar extends StatefulWidget implements PreferredSizeWidget {
  const SearchMealAppbar({
    super.key,
    required this.onChanged,
    required this.searchController,
    required this.clearButton,
    required this.backButton,
  });
  final ValueChanged<String>? onChanged;
  final TextEditingController searchController;
  final VoidCallback clearButton;
  final VoidCallback backButton;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  State<SearchMealAppbar> createState() => _SearchMealAppbarState();
}

class _SearchMealAppbarState extends State<SearchMealAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppTextFormField(
        hintText: "Search Here ...",
        controller: widget.searchController,
        onChanged: widget.onChanged,
      ),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: widget.clearButton,
          icon: Icon(Icons.clear, color: Colors.red.shade300),
        ),
        IconButton(
          onPressed: widget.backButton,
          icon: Icon(Icons.turn_right_rounded, color: AppColors.mainGreen),
        ),
      ],
    );
  }
}
