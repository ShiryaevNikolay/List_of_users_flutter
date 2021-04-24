import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:users_list_flutter/widgets/user_card.dart';

class UsersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
          systemNavigationBarIconBrightness: Brightness.dark),
    child: Scaffold(
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(), 
        itemCount: 10,
        itemBuilder: (context, index) => UserCard(), 
      ),
    ),
  );
}
