import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:users_list_flutter/utils/keyboard_listener.dart';
import 'package:users_list_flutter/widgets/button.dart';
import 'package:users_list_flutter/widgets/field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isShowKeyboard = false;

  KeyboardListener _keyboardListener = KeyboardListener();

  @override
  void initState() {
    super.initState();

    _keyboardListener.addListener(onChange: (isVisible) {
      setState(() {
        _isShowKeyboard = isVisible;
      });
    });
  }

  @override
  void dispose() {
    _keyboardListener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark
      ),
      child: Scaffold(
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
          Center(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!_isShowKeyboard)
                      Text(
                        "Вход",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold),
                      ),
                    if (!_isShowKeyboard)
                      const SizedBox(
                        height: 40,
                      ),
                    Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 50, vertical: 60),
                          child: Column(
                            children: [
                              CustomTextField(
                                label: "Email",
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextField(
                                label: "Пароль",
                                passwordType: true,
                              ),
                              const SizedBox(height: 55),
                              CustomButton(
                                child: Text("Войти"),
                              )
                            ],
                          ),
                        ))
                  ],
                )),
          )
        ],
      )),
    );
  }
}
