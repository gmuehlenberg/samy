import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/mvu/view.dart';
import 'package:bloc_mvu_app/registration/registration_message.dart';
import 'package:bloc_mvu_app/registration/registration_model.dart';
import 'package:bloc_mvu_app/registration/registration_update.dart';
import 'package:flutter/material.dart';

class RegistrationView extends View<RegistrationMessage, RegistrationModel, RegistrationUpdate> {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget buildView(RegistrationModel model) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
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
                                const Icon(
                                  Icons.settings,
                                  color: Colors.grey,
                                  size: 40,
                                )
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
                              'Log in to find the perfect place for your youngster',
                              style: TextStyle(color: Colors.grey[700], fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                const TextField(
                                  decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  obscureText: model.obscurePassword,
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        TextButton(
                                          style: TextButton.styleFrom(
                                              padding: const EdgeInsets.all(15),
                                              backgroundColor: Colors.blue[900],
                                          ),
                                          onPressed: () {},
                                          child:
                                              const Text('Register now', style: TextStyle(color: Colors.white, fontSize: 18)),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 30,
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: const Text('FORGOT PASSWORD?'),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(15),
                            backgroundColor: Colors.blue[900],
                          ),
                          onPressed: () {},
                          child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
