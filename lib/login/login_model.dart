class LoginModel {
  LoginModel({required this.isLoggedIn});

  final bool isLoggedIn;

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
