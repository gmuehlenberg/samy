import 'package:flutter/animation.dart';

class LoginModel {
  LoginModel({required this.isLoggedIn});

  bool isLoggedIn;

  LoginModel copyWith({
    bool? isLoggedIn,
  }) =>
      LoginModel(
        //isLogged ? isLoggedIn : this.isLoggedIn (wenn true, dann isLoggedIn, wenn false, dann this.isLoggedIn)
        // ternärer Ausdruck
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      );
}

final LoginModel initialLoginModel = LoginModel(isLoggedIn: false);
