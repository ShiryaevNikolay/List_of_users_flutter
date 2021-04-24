import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_list_flutter/domain/models/user.dart';

class UserCard extends StatelessWidget {
  UserCard({this.user});

  final User? user;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    child: Row(
          children: [
            SvgPicture.asset("assets/icons/ic_user.svg"),
            const SizedBox(width: 16,),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user!.name!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    user!.email!,
                    style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context).disabledColor
                    ),
                  ),
                  Text(
                    user!.company!,
                    style: TextStyle(
                      fontSize: 13
                    ),
                  ),
                ],
              )
            )
          ],
        ),
  );
}
