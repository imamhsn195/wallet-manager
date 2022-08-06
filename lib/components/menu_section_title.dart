import 'package:flutter/material.dart';
import 'package:wallet_manager/constants.dart';

class MenuSectionTitle extends StatelessWidget {
  const MenuSectionTitle({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text( title, style: kMenuItemIconStyle, textAlign: TextAlign.left,);
  }
}