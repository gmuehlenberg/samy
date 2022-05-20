import 'package:bloc_mvu_app/sign_up/sign_up_message.dart';
import 'package:bloc_mvu_app/sign_up/sign_up_model.dart';
import 'package:bloc_mvu_app/sign_up/sign_up_update.dart';
import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/mvu/view.dart';
import 'package:flutter/material.dart';

class SignUpView extends View<SignUpMessage, SignUpModel, SignUpUpdate> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget buildView(SignUpModel model) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
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
                          child: new Image.asset('assets/samy_small.png'),
                          alignment: Alignment.center,
                          /*decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(30)),*/
                        ),
                        Icon(
                          Icons.settings,
                          color: Colors.grey,
                          size: 40,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Welcome to SAMY",
                      style: TextStyle(fontSize: 25, color: Colors.blue[900]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Log in to find the perfect place for your youngster",
                      style: TextStyle(color: Colors.grey[700], fontSize: 18),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          obscureText: model.obscurePassword,
                          decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(model.obscurePassword ? Icons.visibility_off : Icons.visibility),
                                onPressed: () {
                                  dispatch(ChangePasswordVisibility());
                                },
                              ),),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                RaisedButton(
                                  child: Text('Register now', style: TextStyle(color: Colors.white, fontSize: 18)),
                                  padding: EdgeInsets.all(15),
                                  onPressed: () {},
                                  color: Colors.blue[900],
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
                              child: Text("FORGOT PASSWORD?"),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    padding: EdgeInsets.all(15),
                    color: Colors.blue[900],
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
