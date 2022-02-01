import 'package:bank_provider/components/form_inputs.dart';
import 'package:bank_provider/screens/dashboard/dashboard.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Registrar extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _celularController = TextEditingController();
  final _nascimentoController = TextEditingController();
  final _cepController = TextEditingController();
  final _estadoController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _bairroController = TextEditingController();
  final _logradouroController = TextEditingController();
  final _numeroController = TextEditingController();

  Registrar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Cliente'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Field(
                'Nome',
                255,
                controller: _nomeController,
                validation: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o seu nome';
                  }
                  if (value.length < 2) {
                    return 'Nome inválido';
                  }
                  if (!value.contains(' ')) {
                    return 'Informe ao menos o sobrenome';
                  }
                },
              ),
              Field(
                'E-mail',
                255,
                controller: _emailController,
                type: TextInputType.emailAddress,
                validation: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o seu e-mail';
                  }
                  if (value.length < 2) {
                    return 'E-mail inválido';
                  }
                  if (!value.contains('@') || !value.contains('.')) {
                    return 'Formato de e-mail inválido';
                  }
                },
              ),
              Field(
                'CPF',
                14,
                controller: _cpfController,
                type: TextInputType.number,
                formatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter()
                ],
                validation: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o CPF';
                  }

                  if (value.length != 14) {
                    return 'CPF inválido';
                  }
                  return null;
                },
              ),
              Field(
                'Celular',
                15,
                controller: _celularController,
                type: TextInputType.phone,
                formatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter(),
                ],
                validation: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o número de telefone';
                  }

                  if (value.length < 14) {
                    return 'Número de telefone inválido';
                  }
                  return null;
                },
              ),
              Field(
                'Data de Nascimento',
                10,
                controller: _nascimentoController,
                type: TextInputType.number,
                formatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  DataInputFormatter(),
                ],
                validation: (value) {
                  if (value!.isEmpty) {
                    return 'Informe a sua data de nascimento';
                  }
                  if (value.length < 10) {
                    return 'Data inválida';
                  }
                },
              ),
              Field(
                'CEP',
                10,
                controller: _cepController,
                type: TextInputType.number,
                formatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CepInputFormatter(),
                ],
                validation: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o CEP';
                  }
                  if (value.length < 10) {
                    return 'CEP inválido';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: DropdownButtonFormField<String>(
                  hint: const Text('Estado'),
                  onChanged: (String? estadoSelecionado) {
                    _estadoController.text = estadoSelecionado!;
                  },
                  items: Estados.listaEstados.map((String estado) {
                    return DropdownMenuItem(
                      value: estado,
                      child: Text(estado),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Selecione um estado';
                    }
                    return null;
                  },
                ),
              ),
              Field(
                'Cidade',
                255,
                controller: _cidadeController,
                validation: (value) {
                  if (value!.length < 3) {
                    return 'Informe sua cidade';
                  }
                },
              ),
              Field(
                'Bairro',
                255,
                controller: _bairroController,
                validation: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o bairro';
                  }
                  return null;
                },
              ),
              Field(
                'Logradouro',
                255,
                controller: _logradouroController,
                validation: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o logradouro';
                  }
                  return null;
                },
              ),
              Field(
                'Número do edifício',
                10,
                controller: _numeroController,
                validation: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o número';
                  }
                },
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2),
                ),
                child: Text(
                  'Registrar',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Dashboard(),
                        ),
                        (route) => false);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
