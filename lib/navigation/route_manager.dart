import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users_list_flutter/screens/login.dart';
import 'package:users_list_flutter/screens/users_list.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Переменная хранит аргументы, которые мы передаем между экранами
    final args = settings.arguments;

    switch (settings.name) {
      // Главный экран
      case '/':
        return getRouteFor(
          LoginScreen(),
        );

      // Экран со списком пользователей
      case '/users':
        if (args is Map) {
          return getRouteFor(UsersList());
        }
        return _underConstuctionRoute();

      // Если не найден путь, то возвращаем экран с предупреждением
      default:
        return _underConstuctionRoute();
    }
  }

  static Route<dynamic> getRouteFor(Widget widget) => Platform.isIOS
      ? CupertinoPageRoute(builder: (_) => widget)
      : MaterialPageRoute(builder: (_) => widget);

  static Route<dynamic> _underConstuctionRoute() => getRouteFor(Scaffold(
        body: Center(
          child: Text("Under Construction"),
        ),
      ));
}
