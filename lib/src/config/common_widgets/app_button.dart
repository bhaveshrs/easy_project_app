import 'package:essay_projects/src/config/app_theme.dart';
import 'package:essay_projects/src/config/text_style.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final double height;
  final double? width;
  final Color color;
  final Color? borderColor;
  final double radius;
  final Widget? child;
  final double? borderWidth;
  final Function onTap;
  final String text;
  final bool isEnable;
  final bool isLoading;
  final bool needBorder;
  final IconData? needPrefixIcon;
  final Function? onValidation;
  final Color textColor;
  const AppElevatedButton({
    super.key,
    this.height = 45,
    this.width,
    this.color = MyTheme.primary,
    this.borderColor = Colors.transparent,
    this.radius = 8,
    this.child,
    this.borderWidth = 1,
    required this.onTap,
    required this.text,
    this.isEnable = true,
    this.isLoading = false,
    this.onValidation,
    this.textColor = Colors.white,
    this.needBorder = false,
    this.needPrefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => (isEnable && !isLoading) ? onTap() : onValidation?.call(),
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 35,
        ),
        decoration: BoxDecoration(
          color: needBorder ? null : color,
          border: Border.all(color: borderColor!, width: borderWidth!),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 1.5,
                )),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  needPrefixIcon != null
                      ? Icon(needPrefixIcon,color: Colors.white,)
                      : const SizedBox.shrink(),
                  Text(
                    text,
                    style: AppTextStyle.poppinsBoldText(
                        fontSize: 18,
                        color: needBorder ? MyTheme.primary : textColor),
                    // color: textColor,
                    // fontSize: 16,
                    // fontFamily: AppFontFamily.inter,
                    // fontWeight: FontWeight.w600,
                  ),
                ],
              ),
      ),
    );
  }
}
