import 'package:crud/bloc/creatBloc.dart';
import 'package:crud/components/ButtomResponsive.dart';
import 'package:crud/components/FieldTextResponsive.dart';
import 'package:crud/components/ResponsiveField.dart';
import 'package:flutter/material.dart';

class CreatView extends StatefulWidget {
  CreatView({super.key});


  @override
  State<CreatView> createState() => _CreatViewState();
}

class _CreatViewState extends State<CreatView> {

  void _showSnackBar(String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
  }

  CreatBloc creatBloc = CreatBloc();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cargoController = TextEditingController();
  final TextEditingController _nivelController = TextEditingController();

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
            label: 'Cadastro', 
            fontSize:  16.0,),
          const Fieldtextresponsive(
            label: 'Informe o seu nome, seu cargo e o seu nível.', 
            fontSize:  14.0, 
            isNotTitle: true,),
          const SizedBox(height: 20,),
          ResponsiveField(label: "Nome", controller: _nomeController),
          const SizedBox(height: 20,),
          ResponsiveField(label: "Cargo", controller: _cargoController),
          const SizedBox(height: 20,),
          ResponsiveField(label: "Nível", controller: _nivelController),
          const SizedBox(height: 20,),
          ButtomResponsive(label: "Salvar", fontSize: 18, onPressed: () {
            bool salvo = false;
             creatBloc.createRecord(
              _nomeController,
              _cargoController,
              _nivelController,
              salvo
            ).then((value) {
              Navigator.pop(context);
              _showSnackBar('Registro salvo com sucesso!');
            });
            
          }),

        ],
      )
    );
  }
}