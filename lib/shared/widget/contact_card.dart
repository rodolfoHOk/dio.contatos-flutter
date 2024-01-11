import 'package:contatos_flutter/models/contact.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatefulWidget {
  final Contact contact;

  const ContactCard({super.key, required this.contact});

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  late Contact data;

  @override
  void initState() {
    data = widget.contact;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      color: Colors.indigo,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            SizedBox(
              width: 64,
              height: 64,
              child: CircleAvatar(
                backgroundImage: NetworkImage(data.imageUrl),
              ),
            ),
            const SizedBox(width: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nome: ${data.name}"),
                Text("E-mail: ${data.email}"),
                Text("Telefone: ${data.phoneNumber}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
