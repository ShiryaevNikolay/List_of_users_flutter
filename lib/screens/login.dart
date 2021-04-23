import 'package:flutter/material.dart';
import 'package:users_list_flutter/widgets/button.dart';
import 'package:users_list_flutter/widgets/field.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Image.asset(
              "assets/images/bg_login.png",
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            bottom: 50,
            left: 30,
            right: 30,
            top: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Вход",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 40,),
                Card(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 60),
                    child: Column(
                      children: [
                        CustomTextField(label: "Email",),
                        const SizedBox(height: 30,),
                        CustomTextField(label: "Пароль",),
                        const SizedBox(height: 55),
                        CustomButton(child: Text("Войти"),)
                      ],
                    ),
                  )
                )
              ],
            )
          )
        ],
      )
    );
  }
}