import 'package:bank_provider/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final _cpfController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/bytebank_logo.png',
                  width: 200,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 300,
                  height: 430,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Text(
                          'Faça o seu Login:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'CPF',
                          ),
                          maxLength: 11,
                          keyboardType: TextInputType.number,
                          controller: _cpfController,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'Senha',
                          ),
                          maxLength: 16,
                          controller: _passwordController,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              if (_validaCampos()) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Dashboard(),
                                    ),
                                        (route) => false);
                              } else {
                                showDialog(context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Atenção'),
                                        content: const Text(
                                            'CPF ou Senha inválidos'),
                                        actions: [
                                          TextButton(onPressed: () {
                                            Navigator.pop(context);
                                          }, child: const Text('Fechar'),),
                                        ],
                                      );
                                    });
                              }
                            },
                            child: const Text('Continuar'),
                            style: OutlinedButton.styleFrom(
                              primary: Colors.green[900],
                              side: BorderSide(
                                  color: Theme
                                      .of(context)
                                      .primaryColor,
                                  width: 2),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Esqueci minha senha',
                          style: TextStyle(
                            color: Theme
                                .of(context)
                                .primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            primary: Colors.green[900],
                            side: BorderSide(
                                color: Theme
                                    .of(context)
                                    .primaryColor,
                                width: 2),
                          ),
                          onPressed: () {},
                          child: const Text('Registrar'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /* bool _validaCampos() {
    if (_cpfController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }*/
  Widget _construirFormulario(context) {
    return
      Form(
        child:,
        key: _formKey,
      );
  }
}
