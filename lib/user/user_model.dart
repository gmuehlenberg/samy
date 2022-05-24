import 'package:bloc_mvu_app/mvu/update.dart';
import 'package:bloc_mvu_app/user/user_update.dart';

class UserModel {
  UserModel({
    required this.surname,
    required this.lastname,
    required this.street,
    required this.city,
    required this.mail,
    required this.password,
    required this.postCode,
  });

  final String surname, lastname, street, postCode, city, mail, password;

  UserModel copyWith({
    String? surname,
    String? lastname,
    String? street,
    String? city,
    String? mail,
    String? password,
    String? postCode,
  }) =>
      UserModel(
        // Returns new UserModel with new values for class variables, if passed through copyWith function. Otherwise variables will be kept with old values
        surname: surname ?? this.surname,
        lastname: lastname ?? this.lastname,
        street: street ?? this.street,
        city: city ?? this.city,
        mail: mail ?? this.mail,
        password: password ?? this.password,
        postCode: postCode ?? this.postCode,
      );


  static UserModel get() {
    final userUpdate = updateByType[UserUpdate];

    if (userUpdate != null && userUpdate is UserUpdate) {
      return userUpdate.model();
    }

    throw Exception('This app can not work without an instance of UserUpdate! Consider setting the lazy Parameter in the BlocBuilder to false.');
  }

}

final UserModel initialUserModel = UserModel(
  surname: 'Olive',
  lastname: 'Tree',
  street: 'Karl-Liebknecht-Straße 38',
  city: 'Leipzig',
  postCode: '04107',
  mail: 'döner@olivetree.de',
  password: 'dönermachtschöner123',
);
