import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teste_agetch/models/customer_model.dart';

class CustomerService {
  final FirebaseFirestore _db;
  CustomerService({FirebaseFirestore? db})
    : _db = db ?? FirebaseFirestore.instance;

  Future createCustomer(CustomerModel model) async {
    try {
      await _db.collection('customers').add(model.toJson());
    } catch (e) {
      debugPrint("Ocorreu um erro no Firebase ao tentar salvar o cliente");
    }
  }

  Future deleteCustomer(String customerEmail) async {
    try {
      _db
          .collection('customers')
          .where("email", isEqualTo: customerEmail)
          .get()
          .then((snapshot) {
            for (var docSnapshot in snapshot.docs) {
              _db.collection('customers').doc(docSnapshot.id).delete();
            }
          });
    } catch (e) {
      debugPrint("Ocorreu um erro no Firebase ao tentar excluir o cliente");
    }
  }

  Future<List<Map<String, dynamic>>> getAllCustomers() async {
    try {
      return await _db.collection('customers').get().then((snapshot) {
        return snapshot.docs.map((doc) => doc.data()).toList();
      });
    } catch (e) {
      print('Error getting user swipes: $e');
      return [];
    }
  }
}
