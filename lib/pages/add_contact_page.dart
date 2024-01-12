import 'package:contatos_flutter/shared/widget/custom_form_field.dart';
import 'package:flutter/material.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController phoneController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Adicionar contato"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              CustomFormField(
                label: "Nome",
                keyboardType: TextInputType.name,
                controller: nameController,
              ),
              const SizedBox(height: 12),
              CustomFormField(
                label: "E-mail",
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
              ),
              const SizedBox(height: 12),
              CustomFormField(
                label: "Telefone",
                keyboardType: TextInputType.phone,
                controller: phoneController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
