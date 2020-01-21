import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

import 'bottomSheetYolo.dart';
import 'colors.dart';
import 'notification.dart';

class ValidationCardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height - 140),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 2),
                  child: Text(
                    'Motif',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showBottomSheetForPattern(context, Pattern.GESTURES);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NotificationTrends(),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 8, 24, 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ConstrainedBox(
                    constraints:
                        const BoxConstraints(minWidth: double.infinity),
                    child: TextField(
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: new BorderSide(color: alizouzBlack)),
                          hintText: 'Virement à Alizée'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text('0/120'),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints(minWidth: double.infinity),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            if (kIsWeb) {
                              Navigator.of(context).pushNamed('/confirmation');
                            } else {
                              var localAuth = LocalAuthentication();
                              localAuth
                                  .authenticateWithBiometrics(
                                      localizedReason:
                                          "Authentifiez vous pour valider le virement",
                                      androidAuthStrings: AndroidAuthMessages(
                                          signInTitle:
                                              'Ceci est une authentification sécurisée',
                                          fingerprintRequiredTitle:
                                              'Ceci est une authentification sécurisée'))
                                  .then((value) {
                                if (value) {
                                  Navigator.of(context)
                                      .pushNamed('/confirmation');
                                }
                              });
                            }
                          },
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: alizouzBlack,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16.0, 4, 16, 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      "S'authentifier et valider",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  IconTheme(
                                    data:
                                        new IconThemeData(color: Colors.white),
                                    child: Icon(Icons.fingerprint),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showBottomSheetForPattern(context, Pattern.FINGERPRINT);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NotificationTrends(),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
