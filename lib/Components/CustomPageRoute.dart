import 'package:flutter/material.dart';
class CustomPageRoute extends PageRouteBuilder{
  final Widget child;
  CustomPageRoute({
    this.child,
}): super(

    transitionDuration: Duration(milliseconds: 1500),
    pageBuilder: (context, animation, secondaryAnimation)=> child

  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // TODO: implement buildTransitions
    return FadeTransition(opacity:animation,child:child);

  }
}