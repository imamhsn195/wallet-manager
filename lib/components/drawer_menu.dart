import 'package:flutter/material.dart';
import 'package:wallet_manager/components/menu_section_item.dart';
import 'package:wallet_manager/components/menu_section_title.dart';
import 'package:wallet_manager/constants.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        // padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              image: DecorationImage(
                  image: AssetImage("images/wallet_bd.jpg"),
                  opacity: 0.25,
                  fit: BoxFit.none
              ),
            ),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(color: Colors.white, width: 2.0)),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("images/profile.jpg"),
                    radius: 25,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                  width: double.infinity,
                ),
                const Text("Imam Hasan", style: kDrawerHeadingStyle),
                const SizedBox(
                  height: 10.0,
                  width: double.infinity,
                ),
                const Text("Balance: 0 Tk.", style: kDrawerHeadingStyle)
              ],
            ),
          ),
          Column(
            children: const [
              MenuSectionTitle( title: "Status"),
              MenuSectionItem( icon: Icons.account_balance_wallet_outlined, title: "My Wallet Status"),
              MenuSectionItem( icon: Icons.account_balance, title: "My Income Status"),
              MenuSectionItem( title: "My Expense Status", icon: Icons.add_shopping_cart),
              MenuSectionItem(title: "Day History",icon: Icons.calendar_month),
              Divider(thickness: 1.0, color: Colors.grey)
            ],
          ),
          Column(
            children:const [
              MenuSectionTitle(title: "Mobile Storage Backup"),
              MenuSectionItem(title: "Back Up Mobile", icon: Icons.cloud_done_outlined),
              MenuSectionItem(title: "Restore Backup", icon: Icons.cloud_download),
              Divider(thickness: 1.0, color: Colors.grey)
            ],
          ),
          Column(
            children: const [
              MenuSectionTitle(title: "Google Drive"),
              MenuSectionItem(title: "Sign Out", icon: Icons.logout),
              MenuSectionItem(title: "Backup to Drive", icon: Icons.cloud_done_outlined),
              MenuSectionItem(title: "Restore from Drive", icon: Icons.sync),
              Divider(thickness: 1.0, color: Colors.grey)
            ],
          ),
          Column(
            children: const[
              MenuSectionTitle(title: "Settings"),
              MenuSectionItem(title: "Create Password", icon: Icons.logout),
              MenuSectionItem(title: "Language", icon: Icons.language),
              Divider(thickness: 1.0, color: Colors.grey)
            ],
          ),
          Column(
            children: const[
              MenuSectionTitle(title: "Application"),
              MenuSectionItem(title: "User Guide", icon: Icons.file_copy),
              MenuSectionItem(title: "Share App", icon: Icons.share),
              MenuSectionItem(title: "Top Apps", icon: Icons.shopping_cart),
              MenuSectionItem(title: "Privacy Policy", icon: Icons.lock),
              MenuSectionItem(title: "About", icon: Icons.contact_mail_rounded),
              Divider(thickness: 1.0, color: Colors.grey)
            ],
          )
        ],
      ),
    );
  }
}