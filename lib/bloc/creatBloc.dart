import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class CreatBloc {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

   Future<void> createRecord(TextEditingController nomeController,
      TextEditingController cargoController,
      TextEditingController nivelController, bool salvo) async {
    if (nomeController.text.isNotEmpty && 
        cargoController.text.isNotEmpty && 
        nivelController.text.isNotEmpty) {
      try {
        await _firestore.collection("funcionario").add({
          'nome': nomeController.text,
          'cargo': cargoController.text,
          'nivel': nivelController.text,
        });
        print('Record created successfully');
        nomeController.clear();
        cargoController.clear();
        nivelController.clear();
        salvo = true;
        
      } catch (error) {
        print('Failed to create record: $error');
      }
    } else {
      print('Please fill all fields');
    }
  }


}