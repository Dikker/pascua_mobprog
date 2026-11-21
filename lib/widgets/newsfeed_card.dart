import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pascua_mobprog/constants.dart';
import 'package:pascua_mobprog/widgets/custome_button.dart';
import 'custom_text.dart';
import 'post_image.dart';

class NewsfeedCard extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final bool hasImage;
  final String? postImage;
  final String? avatarImage;
  final bool isNetworkImage;

  const NewsfeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.numOfLikes = 0,
    this.hasImage = false,
    this.postImage,
    this.avatarImage,
    this.isNetworkImage = false,
  });

  @override
  State<NewsfeedCard> createState() => _NewsfeedCardState();
}

class _NewsfeedCardState extends State<NewsfeedCard> {
  late int _likesCount;
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    _likesCount = widget.numOfLikes;
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      _likesCount += _isLiked ? 1 : -1;
    });
  }

  Widget _buildAvatar({double radius = 18}) {
    if (widget.avatarImage != null && widget.avatarImage!.isNotEmpty) {
      return CircleAvatar(
        radius: ScreenUtil().setSp(radius),
        backgroundColor: fbLightPrimary,
        backgroundImage: widget.isNetworkImage
            ? NetworkImage(widget.avatarImage!) as ImageProvider
            : AssetImage(widget.avatarImage!),
      );
    }
    return CircleAvatar(
      radius: ScreenUtil().setSp(radius),
      backgroundColor: fbPrimary,
      child: Icon(
        Icons.person,
        color: Colors.white,
        size: ScreenUtil().setSp(radius),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenUtilSp = ScreenUtil().setSp(10);
    final screenUtilWidth = ScreenUtil().setWidth(10);
    final screenUtilFontUserNameSize = ScreenUtil().setSp(15);
    final screenUtilIconSize = ScreenUtil().setSp(15);

    return Card(
      margin: EdgeInsets.all(screenUtilSp),
      child: Padding(
        padding: EdgeInsets.all(screenUtilSp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildAvatar(radius: 18),
                SizedBox(width: screenUtilWidth),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: widget.userName,
                      fontSize: screenUtilFontUserNameSize,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: widget.date,
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(3)),
                        Icon(
                          Icons.public,
                          color: Colors.grey,
                          size: screenUtilIconSize,
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_horiz),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(8)),
            CustomText(
              text: widget.postContent,
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black,
            ),
            if (widget.hasImage)
              PostImage(
                imagePath: widget.postImage ?? 'assets/images/iron_man.jpg',
                isNetwork: widget.isNetworkImage,
              ),
            Divider(color: Colors.grey[300]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomActionButton(
                  icon: Icons.thumb_up,
                  label: '$_likesCount',
                  iconColor: _isLiked ? fbPrimary : fbDarkPrimary,
                  textColor: _isLiked ? fbPrimary : fbDarkPrimary,
                  onPressed: _toggleLike,
                ),
                CustomActionButton(
                  icon: Icons.comment,
                  label: 'Comment',
                  onPressed: () {},
                ),
                CustomActionButton(
                  icon: Icons.redo,
                  label: 'Share',
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            Row(
              children: [
                _buildAvatar(radius: 14),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                    alignment: Alignment.centerLeft,
                    height: ScreenUtil().setHeight(28),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(
                        Radius.circular(ScreenUtil().setSp(14)),
                      ),
                    ),
                    child: CustomText(
                      text: 'Write a comment...',
                      fontSize: ScreenUtil().setSp(11),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            CustomText(
              text: 'View all comments',
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}