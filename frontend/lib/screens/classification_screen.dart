import 'package:flutter/material.dart';
import '../services/firebase_service.dart';

class ClassificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clasificación')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await FirebaseService.addMaterial('Plastic');
          },
          child: Text('Clasificar Material'),
        ),
      ),
    );
  }
}
