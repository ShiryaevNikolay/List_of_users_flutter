import 'package:flutter/material.dart';
import 'package:users_list_flutter/domain/models/user.dart';

class UserCard extends StatelessWidget {
  UserCard({this.user});

  final User? user;

  @override
  Widget build(BuildContext context) => Row(
        children: [Text(user!.name!)],
      );
}
