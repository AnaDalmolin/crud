import 'package:cloud_firestore/cloud_firestore.dart';

class ReadBloc {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> readRecords() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('funcionario').get();
      List<QueryDocumentSnapshot> docs = querySnapshot.docs;

      List<Map<String, dynamic>> records = docs.map((doc) {
        return {
          'id': doc.id,
          'nome': doc['nome'],
          'cargo': doc['cargo'],
          'nivel': doc['nivel'],
        };
      }).toList();

      return records;
    } catch (error) {
      print('Failed to read records: $error');
      return [];
    }
  }
}