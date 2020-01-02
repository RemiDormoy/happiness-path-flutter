import 'package:flutter/material.dart';

import 'Contact.dart';

class ContactCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ContactCardState();
}

class ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 2),
              child: Text(
                'Destinataires',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 2, 16, 16),
              child: Text(
                'Selectionnez les destinataires de votre virement',
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Contact('Raf', 'assets/rafaelle.jpg'),
                  Contact('Alizouz', 'assets/alizee.jpg'),
                  Contact('Brandone', 'assets/brm.jpg'),
                  Contact('Bénoit', 'assets/bej.jpg'),
                  Contact('Juju', 'assets/juliette.jpg'),
                  Contact('Benoit', 'assets/bme.jpg'),
                  Contact('Maribibi', 'assets/marie.jpg'),
                  Contact('Danyboy', 'assets/danyboy.jpg'),
                  Contact('Cyril', 'assets/cyril.jpg'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
