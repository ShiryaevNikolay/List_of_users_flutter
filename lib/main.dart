import 'package:flutter/material.dart';
import 'package:users_list_flutter/navigation/route_manager.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  onGenerateRoute: RouteManager.generateRoute,
  theme: ThemeData(
    primarySwatch: Colors.purple
  ),
));
