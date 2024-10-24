import 'package:crud/bloc/creatBloc.dart';
import 'package:crud/bloc/editBloc.dart';
import 'package:crud/components/ButtomResponsive.dart';
import 'package:crud/components/FieldTextResponsive.dart';
import 'package:crud/components/ResponsiveField.dart';
import 'package:flutter/material.dart';

class UpdateView extends StatefulWidget {
  final String id;
  final String nome;
  final String cargo;
  final String nivel;
  UpdateView({super.key, required this.id, required this.nome, required this.cargo, required this.nivel});

  @override
  State<UpdateView> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {

  void _showSnackBar(String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message),
    backgroundColor: Colors.green,),
  );
  }

  EditBloc editBloc = EditBloc();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cargoController = TextEditingController();
  final TextEditingController _nivelController = TextEditingController();

  @override
  void initState() {
    _nomeController.text = widget.nome;
    _cargoController.text = widget.cargo;
    _nivelController.text = widget.nivel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade700,
        title: const Text('',),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Fieldtextresponsive(
            label: 'Editando seu perfil', 
            fontSize:  16.0,),
          const SizedBox(height: 20,),
          ResponsiveField(label: "Nome", controller: _nomeController),
          const SizedBox(height: 20,),
          ResponsiveField(label: "Cargo", controller: _cargoController),
          const SizedBox(height: 20,),
          ResponsiveField(label: "Nível", controller: _nivelController),
          const SizedBox(height: 20,),
          ButtomResponsive(label: "Salvar", fontSize: 18, onPressed: () {
            bool edit = false;
             editBloc.editRecord(
              widget.id,
              _nomeController,
              _cargoController,
              _nivelController,
              edit
            ).then((value) {
              Navigator.pop(context);
              _showSnackBar('Editado com sucesso!');
            });
            
          }),

        ],
      )
    );
  }
}