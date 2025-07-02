import 'package:flutter/material.dart';
import 'package:teste_agetch/models/customer_model.dart';
import 'package:teste_agetch/services/customer_service.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key, this.existingCustomer});
  final CustomerModel? existingCustomer;

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final _nameController = TextEditingController();
  final _emailContoller = TextEditingController();
  final CustomerService _customerService = CustomerService();

  Future _putCustomer() async {
    final CustomerModel customer = CustomerModel(
      id: widget.existingCustomer?.id,
      name: _nameController.text.trim(),
      email: _emailContoller.text.trim(),
    );

    try {
      print(widget.existingCustomer != null);
      await _customerService.putCustomer(
        customer,
        widget.existingCustomer?.email,
      );
      Navigator.pushNamed(context, '/customers');
    } catch (e) {
      debugPrint("Não foi possível cadastrar o cliente. Dados -> $customer");
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.existingCustomer != null) {
      _nameController.text = widget.existingCustomer!.name;
      _emailContoller.text = widget.existingCustomer!.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar/Editar clientes')),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Nome'),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _emailContoller,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          ElevatedButton(onPressed: _putCustomer, child: const Text('Salvar')),
        ],
      ),
    );
  }
}
