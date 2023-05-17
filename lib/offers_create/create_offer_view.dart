import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/mvu/view.dart';
import 'package:bloc_mvu_app/offers_create/create_offer_messages.dart';
import 'package:bloc_mvu_app/offers_create/create_offer_model.dart';
import 'package:bloc_mvu_app/offers_create/create_offer_update.dart';
import 'package:flutter/material.dart' hide View;

// ignore: must_be_immutable
class CreateOfferView extends View<CreateOfferMessage, CreateOfferModel, CreateOfferUpdate> {

  CreateOfferView({Key? key}) : super(key: key);

  SchoolType?_selectedSchooltype;
  int? _selectedClassNo;

  @override
  Widget buildView(CreateOfferModel model) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
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
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 30,
                          child: DropdownButton<SchoolType>(
                            items: SchoolType.values.map((type) => DropdownMenuItem(value: type, child: Text(type.name))).toList(),
                            onChanged: (newItem) => _selectedSchooltype = newItem,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 30,
                          child: DropdownButton<int>(
                            items: List<int>.generate(13, (i) => i + 1).map((no) => DropdownMenuItem(value: no, child: Text(no.toString()))).toList(),
                            onChanged: (newNo) => _selectedClassNo = newNo,
                          ),
                        ),
                      ],
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
                          schoolType: _selectedSchooltype!,
                          classNo: _selectedClassNo!,
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
