import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teste_agetch/models/customer_model.dart';

class CustomerService {
  final FirebaseFirestore _db;
  CustomerService({FirebaseFirestore? db})
    : _db = db ?? FirebaseFirestore.instance;

  Future putCustomer(CustomerModel model, String? previousEmail) async {
    try {
      print(model.toJson());
      if (previousEmail != null) {
        _db
            .collection('customers')
            .where("email", isEqualTo: previousEmail)
            .get()
            .then((snapshot) {
              for (var docSnapshot in snapshot.docs) {
                _db
                    .collection('customers')
                    .doc(docSnapshot.id)
                    .update(model.toJson());
              }
            });
      } else {
        await _db.collection('customers').add(model.toJson());
      }
    } catch (e) {
      debugPrint("Erro ao salvar cliente: $e");
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

  Future<List<CustomerModel>> getAllCustomers() async {
    try {
      final snapshot = await _db.collection('customers').get();
      return snapshot.docs
          .map((doc) => CustomerModel.fromJson(doc.data(), doc.id))
          .toList();
    } catch (e) {
      print('Erro ao buscar clientes: $e');
      return [];
    }
  }
}
