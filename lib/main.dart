import 'package:flutter/material.dart';
import 'package:wallet_manager/components/floating_actions.dart';
import 'components/drawer_menu.dart';
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
        primarySwatch: Colors.blueGrey,
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
class _MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text(widget.title),),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const PreferredSize( preferredSize: Size(0.0, 0.0),
              child: TabBar(tabs: [
                  Tab(child: Icon(Icons.calendar_month)),
                  Tab(child: Icon(Icons.calendar_view_day)),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(child: Text('Monthly'),)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(child: Text('Yearly'),)
                ],
              )
            ],
          ),
          ),
        ),
      drawer: const DrawerMenu(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      floatingActionButton: const FloatingActions()
    );
  }
}