
import 'package:flutter/material.dart';

class MenuSectionItem extends StatelessWidget {
  const MenuSectionItem({
    required this.title,
    required this.icon,
    Key? key,
  }) : super(key: key);
  final String title;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}