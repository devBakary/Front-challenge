import 'package:carousel_slider/carousel_slider.dart';
import 'package:challenge_front/Screen/navigation/drawer%20item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Accueil extends StatefulWidget {
  Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  bool play = true;

  @override
  void initState() {
    super.initState();
  }

  //liste de mes items
  final List<String> images = [
    "assets/images/doc.jpg",
    "assets/images/img.jpg",
    "assets/images/nai.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              headerWidget(),
              ListTile(
                title: Text('Accueil'),
                onTap: () {
                  // Ajoutez ici le code que vous souhaitez exécuter lorsque l'élément est sélectionné
                  Navigator.pop(context); // Ferme le drawer
                },
              ),
              ListTile(
                title: Text('Extrait de Naissance'),
                onTap: () {
                  // Ajoutez ici le code que vous souhaitez exécuter lorsque l'élément est sélectionné
                  Navigator.pop(context); // Ferme le drawer
                },
              ),
              ListTile(
                title: Text('Certificat Nationalité'),
                onTap: () {
                  // Ajoutez ici le code que vous souhaitez exécuter lorsque l'élément est sélectionné
                  Navigator.pop(context); // Ferme le drawer
                },
              ),
              ListTile(
                title: Text('Casier judiciere'),
                onTap: () {
                  // Ajoutez ici le code que vous souhaitez exécuter lorsque l'élément est sélectionné
                  Navigator.pop(context); // Ferme le drawer
                },
              ),
              ListTile(
                title: Text('Aide'),
                onTap: () {
                  // Ajoutez ici le code que vous souhaitez exécuter lorsque l'élément est sélectionné
                  Navigator.pop(context); // Ferme le drawer
                },
              ),
              ListTile(
                title: Text('A propos'),
                onTap: () {
                  // Ajoutez ici le code que vous souhaitez exécuter lorsque l'élément est sélectionné
                  Navigator.pop(context); // Ferme le drawer
                },
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                title: Text('Deconnexion'),
                onTap: () {
                  // Ajoutez ici le code que vous souhaitez exécuter lorsque l'élément est sélectionné
                  Navigator.pop(context); // Ferme le drawer
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu, color: Colors.white),
                iconSize: 35,
                alignment: Alignment.center,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: const Text(
            "SEBENW",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: [
            Container(
              child: IconButton(
                onPressed: () {
                  showDialogWidget(context);
                },
                icon: Icon(Icons.notifications, color: Colors.white, size: 30),
              ),
            )
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                  color: Colors.blue,
                  margin: EdgeInsets.only(top: 2),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .25,
                  child: CarouselSlider(
                    items: images
                        .map((item) => Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * .25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.red),
                              child: Image.asset(
                                item,
                                fit: BoxFit.cover,
                              ),
                            ))
                        .toList(),
                    options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2,
                        enlargeCenterPage: true),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              Expanded(
                //padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Color(0xFFDEE3E8),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    children: [
                      //Appel d'urgence
                      Container(
                        padding: EdgeInsets.all(5),
                        child: InkWell(
                          onTap: () {
                            //Navigator.of(context).push(MaterialPageRoute(builder: (_) =>Appel()));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color(0xFFD42125),
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.call,
                                  size: 80,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Extrait d'acte Naissance",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      //mes contacts
                      Container(
                        padding: EdgeInsets.all(5),
                        child: InkWell(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (_) =>Homescreen()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFD42125),
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  CupertinoIcons.person_crop_circle,
                                  size: 80,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Certificat de Nationalité",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      //ma fiche
                      Container(
                        padding: EdgeInsets.all(5),
//
                        child: InkWell(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (_) =>MaFiche()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF0054E0),
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.perm_contact_cal,
                                  size: 80,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Casier Judiciere",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      //apropos
                      Container(
                        padding: EdgeInsets.all(5),
                        child: InkWell(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (_) =>Apropos()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF0054E0),
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  CupertinoIcons.info_circle_fill,
                                  size: 80,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Certificat de Residence",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

Widget headerWidget() {
  return InkWell(
    child: Container(
      padding: EdgeInsets.all(10),
      color: Colors.blue,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            padding: EdgeInsets.all(10),
            child: const CircleAvatar(
              radius: 40,
              //backgroundImage: Image.asset(name)
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            "Nom Complet",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ],
      ),
    ),
  );
}

void onItemPressed(BuildContext context, {required int index}) {
  Navigator.pop(context);

  switch (index) {
    case 0:
      // Navigator.push(context, MaterialPageRoute(builder: (_) => Accueil()));
      break;

    case 1:
      //  Navigator.push(context, MaterialPageRoute(builder: (_) => Appel()));
      break;

    case 2:
      //  Navigator.push(context, MaterialPageRoute(builder: (_) => Homescreen()));
      break;

    case 3:
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (_) => GesteSecours()));
      break;

    case 4:
      // Navigator.push(context, MaterialPageRoute(builder: (_) => MaFiche()));
      break;

    case 5:
      // Navigator.push(context, MaterialPageRoute(builder: (_) => Aide()));
      break;

    case 6:
      // Navigator.push(context, MaterialPageRoute(builder: (_) => Apropos()));
      break;

    case 7:
      // Navigator.pushAndRemoveUntil(context,
      //     MaterialPageRoute(builder: (_) => Connexions()), (route) => false);
      break;

    default:
      Navigator.pop(context);
      break;
  }
}

showDialogWidget(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(32),
      )),
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.94,
          child: Column(
            children: [
              Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32))),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * .02),
                        height: 8,
                        width: MediaQuery.of(context).size.width * .3,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(30),
                                right: Radius.circular(30))),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text("Notifications",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold))
                    ],
                  )),
              SizedBox(height: MediaQuery.of(context).size.height * .02),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: CircleAvatar(
                            child: Icon(
                          Icons.person,
                          size: 45,
                        )),
                        height: 60,
                        width: 60,
                      ),
                      Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                            Text("Mamank99",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700)),
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(
                                "votre rdv est à 14h",
                                style: TextStyle(fontSize: 16),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                            )
                          ]))
                    ]),
              )
            ],
          ),
        );
      });
}
