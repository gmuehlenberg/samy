import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/mvu/view.dart';
import 'package:bloc_mvu_app/offers_create/create_offer_messages.dart';
import 'package:bloc_mvu_app/offers_create/create_offer_model.dart';
import 'package:bloc_mvu_app/offers_create/create_offer_update.dart';
import 'package:bloc_mvu_app/sign_up/sign_up_message.dart';
import 'package:bloc_mvu_app/sign_up/sign_up_model.dart';
import 'package:bloc_mvu_app/sign_up/sign_up_update.dart';
import 'package:bloc_mvu_app/user/user_message.dart';
import 'package:bloc_mvu_app/user/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart' hide View;

class CreateOfferView extends View<CreateOfferMessage, CreateOfferModel, CreateOfferUpdate> {
  const CreateOfferView({Key? key}) : super(key: key);

  @override
  Widget buildView(CreateOfferModel model) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              // slivers: [
              //  SliverFillRemaining(
              //  hasScrollBody: false,
              children: [
                Text(
                  'Welcome to SAMY',
                  style: TextStyle(fontSize: 25, color: Colors.blue[900]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Create offer',
                  style: TextStyle(color: Colors.grey[700], fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      decoration: const InputDecoration(labelText: 'Schultyp', border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: 'Lastname', border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 30,
                          child: TextField(
                            decoration: const InputDecoration(labelText: 'Street', border: OutlineInputBorder()),
                            controller: model.streetController,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 9,
                          child: TextField(
                            decoration: const InputDecoration(labelText: 'Streetnumber', border: OutlineInputBorder()),
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
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      backgroundColor: Colors.blue[900],
                    ),
                    child: const Text(
                      'Tauschgesuch erstellen',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () {
                      dispatch(
                        CreateOffer(
                          schoolType: schooltypeController.value,
                          classNo: classNoController.value,
                          ),
                        ),
                      );
                      // PopUp-Fenster anzeigen
                      // NavigateTo anderer Page
                    },

                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
