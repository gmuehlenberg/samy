import 'package:samy_app/mvu/messaging.dart';
import 'package:samy_app/mvu/view.dart';
import 'package:samy_app/navigation/navigation_messages.dart';
import 'package:samy_app/navigation/navigation_model.dart';
import 'package:samy_app/sign_in/sign_in_message.dart';
import 'package:samy_app/sign_in/sign_in_model.dart';
import 'package:samy_app/sign_in/sign_in_update.dart';
import 'package:flutter/material.dart' hide Page, View;
import 'package:google_fonts/google_fonts.dart';

class SignInView extends View<SignInMessage, SignInModel, SignInUpdate> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget buildView(SignInModel model) => Scaffold(
        body: Container(
            decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
             fit: BoxFit.cover,
             ),
             ),
  child: SafeArea(
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
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Willkommen bei SAMY',
                            style: GoogleFonts.abel(fontSize: 35) // we need this line so flutter will load the font, feel free to fix
                            ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Melde dich an, um das geeignete Tauschangebot zu finden.',
                              style: GoogleFonts.abel(fontSize: 25)
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
                                decoration: InputDecoration(
                                    labelText: 'E-Mail',
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    fillColor: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                obscureText: model.obscurePassword,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: 'Passwort',
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
                                      ElevatedButton(
                                        style: TextButton.styleFrom(
                                          padding: const EdgeInsets.all(15),
                                        ),
                                        onPressed: () {
                                          dispatch(NavigateTo(Page.signUp));
                                        },
                                        child: const Text(
                                          'Noch kein Profil? Registriere dich!',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 30,
                                    width: 1,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: const Text('Passwort vergessen?'),
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
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(15),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Anmelden',
                            style: TextStyle(color: Colors.white, fontSize: 18),
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
      )
  );
}
