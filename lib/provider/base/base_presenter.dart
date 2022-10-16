import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasePresenter extends ChangeNotifier{

    deliverProvider() {
        //todo implement change notifier provider
    }

    makeProvider<T extends ChangeNotifier>(T t) {
        return ChangeNotifierProvider(create: (_) =>t);
    }



}