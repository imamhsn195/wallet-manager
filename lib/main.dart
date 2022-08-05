import 'package:flutter/material.dart';
import 'package:wallet_manager/constants.dart';


import 'components/menu_section_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet Manager',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Welcome Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:const [],
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          // padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Column(
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
                  const Text("Imam Hasan", style: TextStyle(color: Colors.white),),
                  const SizedBox(
                    height: 10.0,
                    width: double.infinity,
                  ),
                  const Text("Balance: 0 Tk.", style: TextStyle(color: Colors.white),)
                ],
              ),
            ),

            Column(
              children: const [
                MenuSectionTitle( title: "Status"),
                MenuSectionItem(
                    icon: Icon(Icons.account_balance_wallet_outlined, color: Colors.black,),
                    title: "My Wallet Status"
                ),
                MenuSectionItem(
                    icon: Icon(Icons.account_balance, color: Colors.black,),
                    title: "My Income Status"
                ),
                MenuSectionItem(
                    title: "My Expense Status",
                    icon: Icon(Icons.add_shopping_cart,color: Colors.black,),),
                MenuSectionItem(
                    title: "Day History",
                    icon: Icon(Icons.calendar_month, color: Colors.black,)
                ),
                Divider(thickness: 1.0, color: Colors.grey)
              ],
            ),
            Column(
              children:const [
                MenuSectionTitle(title: "Mobile Storage Backup"),
                MenuSectionItem(title: "Back Up Mobile", icon: Icon(Icons.cloud_done_outlined, color: Colors.black,)),
                MenuSectionItem(title: "Restore Backup", icon: Icon(Icons.cloud_download, color: Colors.black,),),
                Divider(thickness: 1.0, color: Colors.grey)
              ],
            ),
            Column(
              children: const [
                MenuSectionTitle(title: "Google Drive"),
                MenuSectionItem(title: "Sign Out", icon: Icon(Icons.logout, color: Colors.black,)),
                MenuSectionItem(title: "Backup to Drive", icon: Icon(Icons.cloud_done_outlined, color: Colors.black,)),
                MenuSectionItem(title: "Restore from Drive", icon: Icon(Icons.sync, color: Colors.black,)),
                Divider(thickness: 1.0, color: Colors.grey)
              ],
            ),
            Column(
              children: const[
                MenuSectionTitle(title: "Settings"),
                MenuSectionItem(title: "Create Password", icon: Icon(Icons.logout, color: Colors.black,)),
                MenuSectionItem(title: "Language", icon: Icon(Icons.language, color: Colors.black,)),
                Divider(thickness: 1.0, color: Colors.grey)
              ],
            ),
            Column(
              children: const[
                MenuSectionTitle(title: "Application"),
                MenuSectionItem(title: "User Guide", icon: Icon(Icons.file_copy, color: Colors.black,)),
                MenuSectionItem(title: "Share App", icon: Icon(Icons.share, color: Colors.black,)),
                MenuSectionItem(title: "Top Apps", icon: Icon(Icons.shopping_cart, color: Colors.black,)),
                MenuSectionItem(title: "Privacy Policy", icon: Icon(Icons.lock, color: Colors.black,)),
                MenuSectionItem(title: "About", icon: Icon(Icons.contact_mail_rounded, color: Colors.black,)),
                Divider(thickness: 1.0, color: Colors.grey)
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

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
