import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/bloc/deletBloc.dart';
import 'package:crud/bloc/readBloc.dart';
import 'package:crud/components/FieldTextResponsive.dart';
import 'package:crud/components/ItemList.dart';
import 'package:crud/view/creatview.dart';
import 'package:crud/view/updateview.dart';
import 'package:flutter/material.dart';

import 'package:crud/components/ButtomResponsive.dart';

class Viewlist extends StatefulWidget {
  const Viewlist({super.key});

  @override
  State<Viewlist> createState() => _ViewlistState();
}

class _ViewlistState extends State<Viewlist> {

  final ReadBloc _readBloc = ReadBloc();
  final DeleteBloc _deletBloc = DeleteBloc();
  List<Map<String, dynamic>> _records = [];

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _fetchRecords() async {
    List<Map<String, dynamic>> records = await _readBloc.readRecords();
    setState(() {
      _records = records;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchRecords();
  }

  void _showSnackBar(String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message),
    backgroundColor: Colors.green,),
  );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade700,
        title: const Align(
          alignment: Alignment.center,
          child: Text('CRUD', 
          style: TextStyle(color: Colors.white),),
        ),
        
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('funcionario').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(child: Text('Erro ao carregar dados'));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('Nenhum registro encontrado'));
                }

                final records = snapshot.data!.docs.map((doc) {
                  return {
                    'id': doc.id,
                    'nome': doc['nome'],
                    'cargo': doc['cargo'],
                    'nivel': doc['nivel'],
                  };
                }).toList();

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Fieldtextresponsive(
                        label: 'Lista de cadastrados',
                        fontSize: 18.0,
                        isNotTitle: false,
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: records.length,
                        itemBuilder: (context, index) {
                          return ItemList(
                            nome: records[index]['nome'],
                            cargo: records[index]['cargo'],
                            nivel: records[index]['nivel'],
                            label: '',
                            onPressedEdit: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateView(
                                    id: records[index]['id'],
                                    nome: records[index]['nome'],
                                    cargo: records[index]['cargo'],
                                    nivel: records[index]['nivel'],
                                  ),
                                ),
                              );
                            },
                            onPressedEditDelete: ()=>{ 
                              _deletBloc.deleteRecord(records[index]['id'] ).then((value) {
                                _showSnackBar('Excluido com sucesso!');

                                _fetchRecords();
                              }),
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ButtomResponsive(
              label: "Cadastrar",
              fontSize: 18,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreatView(),
                  ),
                );
              },
              
            ),
          ),
        ],
      ),
    );
  }
  }
