import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/notification_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final notifications = [
    {
      'name': 'Jarvis',
      'post': 'Tony Stank',
      'description': 'Tony doesn\'t take baths',
    },
    {
      'name': 'Ned Leeds',
      'post': 'Distraction',
      'description': 'We\'re all gonna die!!!',
    },
    {
      'name': 'Dr. Strange',
      'post': 'Dormamu',
      'description': 'Dormamu, I\'ve come to bargain',
    },
    {
      'name': 'User 4',
      'post': 'Sample Post 4',
      'description': 'Notification description 4',
    },
    {
      'name': 'User 5',
      'post': 'Sample Post 5',
      'description': 'Notification description 5',
    },
    {
      'name': 'User 6',
      'post': 'Sample Post 6',
      'description': 'Notification description 6',
    },
    {
      'name': 'User 7',
      'post': 'Sample Post 7',
      'description': 'Notification description 7',
    },
    {
      'name': 'User 8',
      'post': 'Sample Post 8',
      'description': 'Notification description 8',
    },
    {
      'name': 'User 9',
      'post': 'Sample Post 9',
      'description': 'Notification description 9',
    },
    {
      'name': 'User 10',
      'post': 'Sample Post 10',
      'description': 'Notification description 10',
    },
    {
      'name': 'User 11',
      'post': 'Sample Post 11',
      'description': 'Notification description 11',
    },
    {
      'name': 'User 12',
      'post': 'Sample Post 12',
      'description': 'Notification description 12',
    },
    {
      'name': 'User 13',
      'post': 'Sample Post 13',
      'description': 'Notification description 13',
    },
    {
      'name': 'User 14',
      'post': 'Sample Post 14',
      'description': 'Notification description 14',
    },
    {
      'name': 'User 15',
      'post': 'Sample Post 15',
      'description': 'Notification description 15',
    },
    {
      'name': 'User 16',
      'post': 'Sample Post 16',
      'description': 'Notification description 16',
    },
    {
      'name': 'User 17',
      'post': 'Sample Post 17',
      'description': 'Notification description 17',
    },
    {
      'name': 'User 18',
      'post': 'Sample Post 18',
      'description': 'Notification description 18',
    },
    {
      'name': 'User 19',
      'post': 'Sample Post 19',
      'description': 'Notification description 19',
    },
    {
      'name': 'User 20',
      'post': 'Sample Post 20',
      'description': 'Notification description 20',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil().screenWidth,
      child: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final item = notifications[index];
          return NotificationWidget(
            name: item['name']!,
            post: item['post']!,
            description: item['description']!,
          );
        },
      ),
    );
  }
}