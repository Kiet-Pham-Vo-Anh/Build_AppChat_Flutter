import 'package:appchat/pages/calls_page.dart';
import 'package:appchat/pages/contacts_page.dart';
import 'package:appchat/pages/message_page.dart';
import 'package:appchat/pages/notifications_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: (index) {
          pageIndex.value = index;
        },
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavigationBarItem(
            label: "Message",
            icon: CupertinoIcons.bubble_left_bubble_right_fill,
            index: 0,
            onTap: onItemSelected,
          ),
          _NavigationBarItem(
            label: "Notifications",
            icon: CupertinoIcons.bell_solid,
            index: 1,
            onTap: onItemSelected,
          ),
          _NavigationBarItem(
            label: "Calls",
            icon: CupertinoIcons.phone_fill,
            index: 2,
            onTap: onItemSelected,
          ),
          _NavigationBarItem(
            label: "Contacts",
            icon: CupertinoIcons.person_2_fill,
            index: 3,
            onTap: onItemSelected,
          ),
        ],
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({
    super.key,
    required this.label,
    required this.icon,
    required this.index,
    required this.onTap,
  });

  final int index;
  final String label;
  final IconData icon;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
