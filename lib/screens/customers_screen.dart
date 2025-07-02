import 'package:flutter/material.dart';
import 'package:teste_agetch/models/customer_model.dart';
import 'package:teste_agetch/screens/add_customer_screen.dart';
import 'package:teste_agetch/services/customer_service.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  final CustomerService _customerService = CustomerService();
  late Future<List<CustomerModel>> customers;

  @override
  void initState() {
    super.initState();
    customers = _customerService.getAllCustomers();
  }

  Future _deleteCustomer(String customerEmail) async {
    try {
      await _customerService.deleteCustomer(customerEmail);
      setState(() {
        customers = _customerService.getAllCustomers();
      });
    } catch (e) {
      debugPrint("Não deu pra excluir paizão");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => {Navigator.pushNamed(context, '/add-customer')},
      ),
      body: FutureBuilder<List<CustomerModel>>(
        future: customers,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final customers = snapshot.data!;
            return ListView.builder(
              itemCount: customers.length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Text('Cliente ${customers[index].name}'),
                      SizedBox(height: 20),
                      Text('Email: ${customers[index].email}'),
                      ElevatedButton(
                        onPressed: () {
                          final customer = CustomerModel(
                            name: customers[index].name,
                            email: customers[index].email,
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => AddCustomerScreen(
                                    existingCustomer: customer,
                                  ),
                            ),
                          ).then((_) {
                            // setState(() {
                            //   customers = _customerService.getAllCustomers();
                            // });
                          });
                        },
                        child: const Text('Editar'),
                      ),
                      ElevatedButton(
                        onPressed:
                            () => _deleteCustomer(customers[index].email),
                        child: const Text('Excluir'),
                      ),
                      //ações
                    ],
                  ),
                );
              },
            );
          } else {
            return Placeholder();
          }
        },
      ),
    );
  }
}
