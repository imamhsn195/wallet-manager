import 'package:flutter/material.dart';
import 'package:wallet_manager/components/menu_section_title.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'components/menu_section_item.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Wallet Manager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  late Animation<double> _animation;
  late AnimationController _animationController;
  bool isShowing = false;
  @override
  void initState(){
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );
    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    super.initState();
    _animationController.addStatusListener((status) {
      // print(status);
    });
  }
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
          children: const [
            Text("Welcome Page")
          ],
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
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,

        //Init Floating Action Bubble
        floatingActionButton: FloatingActionBubble(
          // Menu items
          items: <Bubble>[
            // Floating action menu item
            Bubble(
              title:"Expenses",
              iconColor :Colors.white,
              bubbleColor : Colors.redAccent,
              icon:Icons.remove,
              titleStyle:const TextStyle(fontSize: 16 , color: Colors.white),
              onPress: () {
                _animationController.reverse();
              },
            ),
            // Floating action menu item
            Bubble(
              title:"Income",
              iconColor :Colors.white,
              bubbleColor : Colors.green,
              icon:Icons.add,
              titleStyle: const TextStyle(fontSize: 16 , color: Colors.white),
              onPress: () {
                _animationController.reverse();
              },
            ),
            //Floating action menu item
            Bubble(
              title:"Transfer",
              iconColor :Colors.white,
              bubbleColor : Colors.blue,
              icon:Icons.sync_alt,
              titleStyle: const TextStyle(fontSize: 16 , color: Colors.white),
              onPress: () {
                // Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => Homepage()));
                _animationController.reverse();
              },
            ),
          ],

          // animation controller
          animation: _animation,

          // On pressed change animation state
          onPress: ()
          {
            _animationController.isCompleted
                ? _animationController.reverse()
                : _animationController.forward();
            setState((){
              isShowing = !isShowing;
            });
          },

          // Floating Action button Icon color
          iconColor: Colors.white,

          // Floating Action button Icon
          iconData: isShowing ? Icons.add : Icons.remove,

          backGroundColor: Colors.blue,
        )
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
  }
}
