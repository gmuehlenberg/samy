class RegistrationModel {
  RegistrationModel({required this.isLoggedIn});

  final bool isLoggedIn;

  RegistrationModel copyWith({
    bool? isLoggedIn,
  }) =>
      RegistrationModel(
        //isLogged ? isLoggedIn : this.isLoggedIn (wenn true, dann isLoggedIn, wenn false, dann this.isLoggedIn)
        // ternärer Ausdruck
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      );
}

final RegistrationModel initialRegistrationModel = RegistrationModel(isLoggedIn: false);
