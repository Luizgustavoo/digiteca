import 'package:digiteca/pallete.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData? icon;
  final String title;
  final Function()? onTap;

  const CustomListTile(
      {super.key, this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.brown.shade600,
      ),
      title: Text(
        title,
        style: kDrawer,
      ),
      onTap: onTap,
    );
  }
}
