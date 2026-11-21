import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pascua_mobprog/constants.dart';
import 'custom_text.dart';

class CustomActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final Color textColor;
  final VoidCallback onPressed;

  const CustomActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.iconColor = fbDarkPrimary,
    this.textColor = fbDarkPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(ScreenUtil().setSp(5)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(8),
          vertical: ScreenUtil().setHeight(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: ScreenUtil().setSp(16),
            ),
            SizedBox(width: ScreenUtil().setWidth(5)),
            CustomText(
              text: label,
              fontSize: ScreenUtil().setSp(12),
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }
}