import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class ContactDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 180,
                child: Image(image: AssetImage('assets/contactpicture.png')),
              ),
              Text(
                "Qui se cache derrière cette appli ?\nUne communauté d'experts fondée sur le partage et la bienveillance : les Octos !",
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      print('TODO rediriger vers octo.com');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: alizouzBlack,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 12, 40, 12),
                        child: Text(
                          'Découvrir OCTO',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
