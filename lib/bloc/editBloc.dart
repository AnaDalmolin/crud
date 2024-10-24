import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditBloc {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> editRecord(String id, 
      TextEditingController nomeController,
      TextEditingController cargoController,
      TextEditingController nivelController, bool edit) async {
    if (nomeController.text.isNotEmpty &&
        cargoController.text.isNotEmpty && 
        nivelController.text.isNotEmpty) {
      try {
        await _firestore.collection("funcionario").doc(id).update({
          'nome': nomeController.text,
          'cargo': cargoController.text,
          'nivel': nivelController.text,
        });
        edit = true;
      } catch (error) {
        print('Failed to update record: $error');
      }
    } else {
      print('Please fill all fields');
    }
  }
}