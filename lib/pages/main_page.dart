import 'package:contatos_flutter/models/contact.dart';
import 'package:contatos_flutter/pages/add_contact_page.dart';
import 'package:contatos_flutter/shared/widget/contact_card.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({super.key, required this.title});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Column(
            children: <Widget>[
              ContactCard(
                contact: Contact(
                  objectId: "abc123",
                  name: "Ana Yamada",
                  email: "ana.ymd@email.com",
                  phoneNumber: 11988887777,
                  imageUrl:
                      "https://raw.githubusercontent.com/rodolfoHOk/portfolio-img/main/images/avatar/ana.jpg",
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const AddContactPage()));
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add_reaction_outlined),
        ),
      ),
    );
  }
}
