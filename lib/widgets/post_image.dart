import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostImage extends StatelessWidget {
  final String imagePath;
  final bool isNetwork;

  const PostImage({
    super.key,
    required this.imagePath,
    this.isNetwork = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(8)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ScreenUtil().setSp(8)),
        child: isNetwork
            ? Image.network(
                imagePath,
                width: double.infinity,
                height: ScreenUtil().setHeight(200),
                fit: BoxFit.cover,
              )
            : Image.asset(
                imagePath,
                width: double.infinity,
                height: ScreenUtil().setHeight(200),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}