import 'package:google_fonts/google_fonts.dart';
import 'package:samy_app/mvu/messaging.dart';
import 'package:samy_app/mvu/view.dart';
import 'package:samy_app/sign_up/sign_up_message.dart';
import 'package:samy_app/sign_up/sign_up_model.dart';
import 'package:samy_app/sign_up/sign_up_update.dart';
import 'package:samy_app/user/user_message.dart';
import 'package:samy_app/user/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart' hide View;

class SignUpView extends View<SignUpMessage, SignUpModel, SignUpUpdate> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget buildView(SignUpModel model) => Scaffold(
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/background.jpg"),
        fit: BoxFit.cover,
      ),
      ),
  child:
        SafeArea(
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
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Wir helfen dir bei der Suche nach einer näher gelegenen Schule, um den Schulweg deines Kindes zu erleichtern.',
                    style: GoogleFonts.abel(fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Registriere dich, um dein Tauschangebot aufzugeben und den geeigneten Schulplatz zu finden.',
                    style: GoogleFonts.abel(fontSize: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      decoration: const InputDecoration(
                          labelText: 'Vorname',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,),
                      controller: model.firstNameController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                          labelText: 'Nachname',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                      ),
                      controller: model.lastNameController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 30,
                          child: TextField(
                            decoration: const InputDecoration(
                                labelText: 'Straße',
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white,
                            ),
                            controller: model.streetController,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 9,
                          child: TextField(
                            decoration: const InputDecoration(
                                labelText: 'Hausnummer',
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white,
                            ),
                            controller: model.streetNumberController,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                          labelText: 'Postleitzahl',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                      ),
                      controller: model.postCodeController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                          labelText: 'Ort',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                      ),
                      controller: model.cityController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                          labelText: 'E-Mail',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                      ),
                      controller: model.mailController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: model.obscurePassword,
                      controller: model.passwordController,
                      decoration: InputDecoration(
                        labelText: 'Passwort',
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                    ),
                    onPressed: () {
                      dispatch(
                        CreateUser(
                          User(
                            firstName: model.firstNameController.text,
                            lastName: model.lastNameController.text,
                            street: model.streetController.text,
                            streetNumber: model.streetNumberController.text,
                            city: model.cityController.text,
                            mail: model.mailController.text,
                            password: model.passwordController.text,
                            postCode: model.postCodeController.text,
                            image: 'assets/samy_small.png',
                            // Platzhalter!
                            id: const None(), // will be set later
                          ),
                        ),
                      );
                      // PopUp-Fenster anzeigen
                      // NavigateTo anderer Page
                    },
                    child: const Text(
                      'Registrieren',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
  );
}
