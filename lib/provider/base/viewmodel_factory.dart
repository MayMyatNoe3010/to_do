import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

T getProvider<T>(BuildContext context) {
  var vm = Provider.of<T>(context, listen: false);
  return vm;
}
