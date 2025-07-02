import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:teste_agetch/firebase_options.dart';
import 'package:teste_agetch/screens/add_customer_screen.dart';
import 'package:teste_agetch/screens/customers_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste AGTech',
      debugShowCheckedModeBanner: false,
      initialRoute: '/customers',
      routes: {
        // '/': (context) => const LoginScreen()
        '/customers': (context) => const CustomersScreen(),
        '/add-customer': (context) => const AddCustomerScreen(),
      },
    );
  }
}
