import 'package:flutter/material.dart';

class RouteManager {

  static goToAndRemoveBackStack(BuildContext context, Widget widgetPage){
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => widgetPage), (route) => false);
  }

  static goTo(BuildContext context, Widget widgetPage){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>widgetPage));
  }

}
