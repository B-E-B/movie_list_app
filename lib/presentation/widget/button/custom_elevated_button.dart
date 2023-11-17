import 'package:flutter/material.dart';
import 'package:movie_list_app/common/theme/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? textColor;

  const CustomElevatedButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.buttonColor = AppColors.colorBlueButton,
    this.textColor = AppColors.textColorBlueButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 158, height: 45),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: buttonColor,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        ),
        child: FittedBox(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
