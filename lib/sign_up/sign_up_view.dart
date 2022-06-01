import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/mvu/view.dart';
import 'package:bloc_mvu_app/sign_up/sign_up_message.dart';
import 'package:bloc_mvu_app/sign_up/sign_up_model.dart';
import 'package:bloc_mvu_app/sign_up/sign_up_update.dart';
import 'package:bloc_mvu_app/user/user_message.dart';
import 'package:flutter/material.dart';

class SignUpView extends View<SignUpMessage, SignUpModel, SignUpUpdate> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget buildView(SignUpModel model) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              // slivers: [
              //  SliverFillRemaining(
              //  hasScrollBody: false,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 85,
                      height: 85,
                      color: Colors.grey[200],
                      alignment: Alignment.center,
                      child: Image.asset('assets/samy_small.png'),
                      /*decoration: BoxDecoration(
                                  color: Colors.blue[900],
                                  borderRadius: BorderRadius.circular(30)),*/
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Welcome to SAMY',
                  style: TextStyle(fontSize: 25, color: Colors.blue[900]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Sign up to find the perfect place for your youngster',
                  style: TextStyle(color: Colors.grey[700], fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  //mainAxisSize: MainAxisSize.min,
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: const InputDecoration(labelText: 'Surname', border: OutlineInputBorder()),
                        controller: model.surnameController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: const InputDecoration(labelText: 'Lastname', border: OutlineInputBorder()),
                        controller: model.lastnameController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: const InputDecoration(labelText: 'Postcode', border: OutlineInputBorder()),
                        controller: model.postCodeController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: const InputDecoration(labelText: 'City', border: OutlineInputBorder()),
                        controller: model.cityController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: const InputDecoration(labelText: 'E-Mail', border: OutlineInputBorder()),
                        controller: model.mailController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        obscureText: model.obscurePassword,
                        controller: model.passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(model.obscurePassword ? Icons.visibility_off : Icons.visibility),
                            onPressed: () {
                              dispatch(ChangePasswordVisibility());
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      backgroundColor: Colors.blue[900],
                    ),
                    onPressed: () {
                      dispatch(CreateUser());
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
