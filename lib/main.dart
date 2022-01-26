import 'package:bank_provider/models/transferencias.dart';
import 'package:bank_provider/screens/autenticacao/login.dart';
import 'package:bank_provider/screens/dashboard/dashboard.dart';
import 'package:bank_provider/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/saldo.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Saldo(0),
        ),
        ChangeNotifierProvider(create: (context) => Transferencias())
      ],
      child: BytebankApp(),
    ));

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[600],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.greenAccent[700]),
      ),
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}