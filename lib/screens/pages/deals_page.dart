import 'package:flutter/material.dart';

class DealsPage extends StatelessWidget {
  const DealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Deals",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
    );
  }
}
