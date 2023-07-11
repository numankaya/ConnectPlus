import 'package:erasmus_connect/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final Function(int) goToPage;

  const NotificationsPage({required this.goToPage, super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 235, 225),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(128, 255, 144, 34),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Icon(
                  size: 24,
                  CupertinoIcons.chevron_back,
                  color: Colors.black,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Text(
                  'Bildirimler',
                  style: TextStyle(
                    color: Color.fromARGB(255, 64, 58, 122),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                CupertinoIcons.chevron_back,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
        body: ListView.separated(
          itemCount: notificationList.length,
          separatorBuilder: (context, index) => Divider(
            indent: 20,
            endIndent: 25,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          itemBuilder: (context, index) {
            final notification = notificationList[index];
            return ListTile(
              leading: Icon(notification.icon),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    notification.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    notification.time,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                notification.content,
                style: TextStyle(
                  color: const Color.fromARGB(255, 118, 118, 118),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String content;
  final String time;
  final IconData icon;

  NotificationItem({
    required this.title,
    required this.content,
    required this.time,
    required this.icon,
  });
}

List<NotificationItem> notificationList = [
  NotificationItem(
    title: 'Trendler',
    content: 'This is the content of Trendler notification.',
    time: '9:00 AM',
    icon: Icons.favorite,
  ),
  NotificationItem(
    title: 'Yorumlar',
    content: 'This is the content of Yorumlar notification.',
    time: '10:30 AM',
    icon: Icons.comment,
  ),
  NotificationItem(
    title: 'Upvote',
    content: 'This is the content of Upvote notification.',
    time: '11:47 AM',
    icon: CupertinoIcons.chevron_up,
  ),
  // Add more notifications as needed
];
