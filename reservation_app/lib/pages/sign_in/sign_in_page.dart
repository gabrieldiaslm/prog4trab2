import 'package:flutter/material.dart';
import 'package:reservation_app/shared/validators/min_length_validator.dart';

import 'icon_text_form_field.dart';
import '../../app/app_routes.dart';
import '../../shared/validators/email_validator.dart';

class SignInPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  SignInPage({super.key}) {
    _emailController.text = 'fulano@email.br';
    _passwordController.text = '12345678';
  }

  void _validateForm() {
    if (_formKey.currentState?.validate() ?? false) {
      debugPrint('Validation passed');
    } else {
      debugPrint('Validation failed');
    }
    debugPrint('\tEmail: ${_emailController.text}');
    debugPrint('\tSenha: ${_passwordController.text}');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: pageSize.height,
          child: Column(
            children: [
              // Header
              Expanded(
                child: Container(
                  color: theme.primaryColor,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Reserva',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'Fácil',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Auth Form
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 40.0,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40.0),
                  ),
                ),
                // Form fields
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // E-mail Field
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: IconTextFormField(
                          labelText: 'E-mail',
                          fieldType: IconTextFormFieldType.email,
                          icon: Icons.email,
                          controller: _emailController,
                          validator: EmailValidator('E-mail'),
                        ),
                      ),
                      // Password Field
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: IconTextFormField(
                          labelText: 'Senha',
                          fieldType: IconTextFormFieldType.password,
                          isSecret: true,
                          icon: Icons.lock,
                          controller: _passwordController,
                          validator: MinLengthValidator('Senha', 6),
                        ),
                      ),

                      // Enter Button
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.primaryColor,
                            minimumSize: const Size.fromHeight(48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            _validateForm();
                          },
                        ),
                      ),
                      // Forgot Password Button
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          style:
                              TextButton.styleFrom(foregroundColor: Colors.red),
                          onPressed: () {},
                          child: const Text('Esqueci a Senha'),
                        ),
                      ),
                      // Divider
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(128),
                              thickness: 2.0,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('OU'),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(128),
                              thickness: 2.0,
                            ),
                          ),
                        ],
                      ),
                      // Create Account Button
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: theme.primaryColor,
                            minimumSize: const Size.fromHeight(48.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            side: BorderSide(
                              width: 2.0,
                              color: theme.primaryColor,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(AppRoutes.signUp);
                          },
                          child: const Text('Criar Conta'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}