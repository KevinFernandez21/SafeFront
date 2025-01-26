import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/firebase_service.dart';

class StatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Estadísticas')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseService.getMaterials(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          final materials = snapshot.data!.docs;
          return ListView.builder(
            itemCount: materials.length,
            itemBuilder: (context, index) {
              final material = materials[index];
              return ListTile(
                title: Text('Tipo: ${material['type']}'),
                subtitle: Text('Fecha: ${material['timestamp'].toDate()}'),
              );
            },
          );
        },
      ),
    );
  }
}
