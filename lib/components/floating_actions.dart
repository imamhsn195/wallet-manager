import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
class FloatingActions extends StatefulWidget {
  const FloatingActions({Key? key}) : super(key: key);

  @override
  State<FloatingActions> createState() => _FloatingActionsState();
}

class _FloatingActionsState extends State<FloatingActions> with SingleTickerProviderStateMixin{
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
    return FloatingActionBubble(
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
      iconData: isShowing ? Icons.keyboard_arrow_left_sharp : Icons.add,
      backGroundColor: Colors.blue,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
  }
}
