import 'package:flutter/material.dart';

class OffersCreateView extends StatelessWidget {
  const OffersCreateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: CustomScrollView(),
          ),
        ),
      );

}
