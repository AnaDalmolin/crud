import 'package:cloud_firestore/cloud_firestore.dart';

class DeleteBloc {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> deleteRecord(String id) async {
    try {
      await _firestore.collection("funcionario").doc(id).delete();
      print('Record deleted successfully');
    } catch (error) {
      print('Failed to delete record: $error');
    }
  }
}