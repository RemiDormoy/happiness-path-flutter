import 'package:flutter/material.dart';
import 'package:happiness_path/colors.dart';

void showBottomSheetForPattern(BuildContext context, Pattern pattern) {
  showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return FractionallySizedBox(
          heightFactor: 0.7,
          child: Container(
            height: 400,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 4,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: pattern.color,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: IconTheme(
                            data: new IconThemeData(color: Colors.white),
                            child: Icon(Icons.assignment),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Pattern #${pattern.number.toString()}'),
                            Text(pattern.title),
                          ],
                        ),
                      ))
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ConstrainedBox(
                          constraints:
                              const BoxConstraints(minWidth: double.infinity),
                          child: Image(
                              image: AssetImage(pattern.image)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(pattern.content),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

enum Pattern {
  AUGMENTED_LIST,
  KEEP_THEM_WAITING,
  GRATIFICATION,
  FINGERPRINT,
  GESTURES,
  HUMANE_DESIGN,
  SIMPLE_ACCESS,
  BOTTOM,
  INFINITE_NAV
}

extension PatternExtension on Pattern {
  int get number {
    switch (this) {
      case Pattern.AUGMENTED_LIST:
        return 1;
      case Pattern.KEEP_THEM_WAITING:
        return 2;
      case Pattern.GRATIFICATION:
        return 3;
      case Pattern.FINGERPRINT:
        return 4;
      case Pattern.GESTURES:
        return 5;
      case Pattern.HUMANE_DESIGN:
        return 6;
      case Pattern.SIMPLE_ACCESS:
        return 7;
      case Pattern.BOTTOM:
        return 8;
      case Pattern.INFINITE_NAV:
        return 9;
    }
  }

  String get title {
    switch (this) {
      case Pattern.AUGMENTED_LIST:
        return "Proposer des listes augmentées";
      case Pattern.KEEP_THEM_WAITING:
        return "Rendre l'attente agréable";
      case Pattern.GRATIFICATION:
        return "Gratifier l'utilisateur";
      case Pattern.FINGERPRINT:
        return "Simplifier l'authentification";
      case Pattern.GESTURES:
        return "Utiliser les gestures";
      case Pattern.HUMANE_DESIGN:
        return "Créer une relation de confiance";
      case Pattern.SIMPLE_ACCESS:
        return "Adapter l'interface à l'utilisateur";
      case Pattern.BOTTOM:
        return "Préférer les zones d'interaction \"basses\"";
      case Pattern.INFINITE_NAV:
        return "Permettre une navigation sans rupture";
    }
  }

  String get image {
    switch (this) {
      case Pattern.AUGMENTED_LIST:
        return "assets/augmented_listes.png";
      case Pattern.KEEP_THEM_WAITING:
        return "assets/attente.png";
      case Pattern.GRATIFICATION:
        return "assets/gratifier.png";
      case Pattern.FINGERPRINT:
        return "assets/simple_auth.png";
      case Pattern.GESTURES:
        return "assets/gestures.png";
      case Pattern.HUMANE_DESIGN:
        return "assets/humane_design.png";
      case Pattern.SIMPLE_ACCESS:
        return "assets/personaliser.png";
      case Pattern.BOTTOM:
        return "assets/bottom_bouttons.png";
      case Pattern.INFINITE_NAV:
        return "assets/borderless.png";
    }
  }

  String get content {
    switch (this) {
      case Pattern.AUGMENTED_LIST:
        return "Les listes de contenus deviennent le support de différents raccourcis vers des fonctionnalités annexes. Une liste principale (par exemple une liste de restaurants) devient aussi le support de fonctionnalités annexes (s’inscrire à un programme partenaire ou même afficher de la publicité de manière non intrusive). Grâce à ces listes “augmentées”, l’utilisateur bénéficie d’un point d’entrée clair entre les différentes fonctionnalités de l’application, tout en conservant un mode d’interaction familier.";
      case Pattern.KEEP_THEM_WAITING:
        return "Passés de mode les loaders et spinners, les animations de transition oeuvrent maintenant à distraire les utilisateurs et transforment les temps de chargement en un moment fort du parcours. Ces animations contribuent à construire un attachement émotionnel et des sentiments positifs vis-à-vis du service et de la marque";
      case Pattern.GRATIFICATION:
        return "Quoi de plus agréable qu’un petit compliment ? Lors de l’utilisation des applications, gratifier les utilisateurs devient un enjeu de captation et de rétention. Si le sujet de l’application s’y prête, il est même possible d’aller jusqu’à gamifier ces messages de félicitations, y ajouter des niveaux ou des récompenses, fictives ou réelles, afin d’inciter l’utilisateur à utiliser et découvrir l’application au maximum.";
      case Pattern.FINGERPRINT:
        return "Exit le “123456” -  le mot de passe le plus utilisé selon une enquête de la UK’s National Cyber Security Center. Grâce à des technologies de reconnaissance biométriques (Touch ID, faceID) ou des services tiers (double authentification Google), l’authentification peut devenir transparente pour l’utilisateur tout en garantissant des niveaux de sécurité élevés.";
      case Pattern.GESTURES:
        return "Des standards d’interactions commencent à émerger (swipe back pour retourner à l’écran précédent, swipe “à la Tinder” pour valider ou invalider un choix, …).. Depuis l’iPhone X, les boutons “historiques” (retour par exemple) s’effacent au profit de gestures ; Android a également sauté le pas depuis Android 10. Les gestures permettent également d’ajouter un nombre conséquent d’actions sans surcharger visuellement les écrans. ";
      case Pattern.HUMANE_DESIGN:
        return "Pour utiliser la technologie pour supporter les besoin utilisateurs, respecter leur capital attentionnel  et créer une relation de confiance avec le service, des organismes ( ex : Center for Humane Society) proposent des principes de conception “humanistes”. Les OS sont aujourd’hui également capables d’avertir l’utilisateur lorsqu’une application génère un comportement excessif (notifications intempestives, temps passé, …)";
      case Pattern.SIMPLE_ACCESS:
        return "Proposer une application à un public de plusieurs milliers de personnes, c’est s’adresser à des milliers d’utilisateurs différents. En prenant en compte  les habitudes et préférences des usagers, les applications peuvent aujourd’hui proposer du contenu pertinent et le faire évoluer en fonction des besoins et maturité de l’utilisateur.";
      case Pattern.BOTTOM:
        return "Fini le débat entre zone d’interaction haute ou basse : avec des écrans de plus en plus grands, l’impossibilité physique d’atteindre le haut de l’écran lors d’une utilisation à une main fait pencher la balance en faveur d’une zone d’interaction dans la partie inférieure de l’écran. Samsung a par exemple refondu toute son interface dans une version de One-Ui qui découpe l’écran en deux espaces : une zone d\'interaction basse et une zone d’affichage haute";
      case Pattern.INFINITE_NAV:
        return "Exit la tradition de la navigation multi-écrans.  L’utilisateur bénéficie d’une expérience immersive et ininterrompue de navigation, sans avoir à jongler entre différentes pages.\n\nL’interface se conçoit sur un seul écran et les éléments structurants de l’interface se contextualisent pendant l’utilisation, avec une navigation plus riche (prise en compte de la profondeur, appuis longs…)";
    }
  }

  Color get color {
    switch (this) {
      case Pattern.AUGMENTED_LIST:
        return alizouzBlue;
      case Pattern.KEEP_THEM_WAITING:
        return alizouzFushia;
      case Pattern.GRATIFICATION:
        return octoBlue;
      case Pattern.FINGERPRINT:
        return alizouzBlue;
      case Pattern.GESTURES:
        return alizouzFushia;
      case Pattern.HUMANE_DESIGN:
        return octoBlue;
      case Pattern.SIMPLE_ACCESS:
        return alizouzBlue;
      case Pattern.BOTTOM:
        return alizouzFushia;
      case Pattern.INFINITE_NAV:
        return octoBlue;
    }
  }
}
