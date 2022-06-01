import 'package:bloc_mvu_app/mvu/update.dart';
import 'package:bloc_mvu_app/user/user_update.dart';

class UserModel {
  UserModel({
    required this.user,
  });

  final User user;

  UserModel copyWith(
    User? user,
  ) =>
      UserModel(
        // Returns new UserModel with new values for class variables, if passed through copyWith function. Otherwise variables will be kept with old values
        user: user ?? this.user,
      );

  static UserModel get() {
    final userUpdate = updateByType[UserUpdate];

    if (userUpdate != null && userUpdate is UserUpdate) {
      return userUpdate.model();
    }

    throw Exception(
      'This app can not work without an instance of UserUpdate! Consider setting the lazy Parameter in the BlocBuilder to false.',
    );
  }
}

class User {
  User({
    required this.surname,
    required this.lastname,
    required this.street,
    required this.city,
    required this.mail,
    required this.password,
    required this.postCode,
  });

  final String surname, lastname, street, postCode, city, mail, password;
}

final User initialUser = User(
  surname: 'Olive',
  lastname: 'Tree',
  street: 'Karl-Liebknecht-Straße 38',
  city: 'Leipzig',
  mail: 'döner@olivetree.de',
  password: 'dönerMachtschöner',
  postCode: '04107',
);

final UserModel initialUserModel = UserModel(user: initialUser);
