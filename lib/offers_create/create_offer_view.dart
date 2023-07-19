import 'package:flutter/material.dart' hide View;
import 'package:samy_app/mvu/messaging.dart';
import 'package:samy_app/mvu/view.dart';
import 'package:samy_app/offers_create/create_offer_messages.dart';
import 'package:samy_app/offers_create/create_offer_model.dart';
import 'package:samy_app/offers_create/create_offer_update.dart';
const defaultSchoolType = SchoolType.Grundschule;
const defaultSchoolName = SchoolName.Schule1;
const defaultClassNo = 1;


// ignore: must_be_immutable
class CreateOfferView
    extends View<CreateOfferMessage, CreateOfferModel, CreateOfferUpdate> {
  const CreateOfferView({Key? key}) : super(key: key);

  @override
  Widget buildView(CreateOfferModel model) => ListView(
        padding: const EdgeInsets.all(30),
        children: [
          Text(
            'Erstelle ein Tauschgesuch, um den perfekten Schulplatz zu finden.', style: TextStyle(fontSize: 20),
          ),
          Text(
            'Gib dazu die derzeitige Schule, die Schulklasse und das voraussichtliche Datum des Schulwechsels an.', style: TextStyle(fontSize: 16),
          ),
          CreateOffersForm(),
        ],
      );
}

// ignore: use_key_in_widget_constructors
class CreateOffersForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateOffersFormState();
}

class CreateOffersFormState extends State<CreateOffersForm> {
  CreateOffersFormState();

  SchoolType selectedSchooltype = defaultSchoolType;
  int selectedClassNo = defaultClassNo;
  SchoolName selectedSchoolname = defaultSchoolName;
  String selectedFirstSchoolday = DateTime.now().toString();
  String selectedSchoolId = "1"; //hart gecoded

  TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: DropdownButton<SchoolType>(
                  items: SchoolType.values
                      .map((type) =>
                          DropdownMenuItem(value: type, child: Text(type.name)))
                      .toList(),
                  onChanged: (newItem) {
                    setState(() {
                      selectedSchooltype = newItem ?? defaultSchoolType;
                    });
                  },
                  value: selectedSchooltype,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: DropdownButton<SchoolName>(
                  items: SchoolName.values
                      .map((type) =>
                          DropdownMenuItem(value: type, child: Text(type.name)))
                      .toList(),
                  onChanged: (newName) {
                    setState(() {
                      selectedSchoolname = newName ?? defaultSchoolName;
                    });
                  },
                  value: selectedSchoolname,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: DropdownButton<int>(
                  items: List<int>.generate(13, (i) => i + 1)
                      .map((no) => DropdownMenuItem(
                          value: no, child: Text(no.toString())))
                      .toList(),
                  onChanged: (newNo) {
                    setState(() {
                      selectedClassNo = newNo ?? defaultClassNo;
                    });
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200.0,
                  height: 100.0,
                  child: TextField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      enabled: true,
                      labelText: 'Datum',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectedFirstSchoolday = _dateController.text;
                  },
                  child: Text('Speichern'),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: const Text(
                'Tauschgesuch erstellen',
              ),
              onPressed: () {
                dispatch(
                  CreateOffer(
                    classNumber: selectedClassNo,
                    schoolId: selectedSchoolId,
                    firstSchoolday: selectedFirstSchoolday,
                  ),
                );
              },
            ),
          ),
        ],
      );
}
