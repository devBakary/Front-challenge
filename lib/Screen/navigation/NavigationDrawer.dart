import 'package:challenge_front/Globales/variable%20globale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer item.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  bool _isSelected = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      width: MediaQuery.of(context).size.width * .80,
      child: Material(
        elevation: 5,
        color: Colors.white,
        child: Column(
          children: [
            headerWidget(),
           
            const Divider(
              color: Colors.black,
              thickness: 2,
              endIndent: 45,
              indent: 45,
            ),
            DrawerItem(
              name: 'Accueil',
              icon: Icons.home,
              onPressed: () => onItemPressed(context, index: 0),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * .015,
            ),
            DrawerItem(
              name: 'Appel d\'urgence ',
              icon: CupertinoIcons.phone_fill,
              onPressed: () => onItemPressed(context, index: 1),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * .015,
            ),
            DrawerItem(
              name: 'Mes contacts',
              icon: CupertinoIcons.person_crop_circle,
              onPressed: () => onItemPressed(context, index: 2),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * .015,
            ),
            DrawerItem(
              name: 'Geste de secours',
              icon: Icons.healing_rounded,
              onPressed: () => onItemPressed(context, index: 3),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * .015,
            ),
            DrawerItem(
              name: 'Ma fiche',
              icon: Icons.perm_contact_cal_rounded,
              onPressed: () => onItemPressed(context, index: 4),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * .015,
            ),

            const Divider(
              color: Colors.black,
              thickness: 2,
              endIndent: 40,
              indent: 40,
            ),
            DrawerItem(
              name: 'Aide',
              icon: CupertinoIcons.question_circle,
              onPressed: () => onItemPressed(context, index: 5),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * .015,
            ),
            DrawerItem(
              name: 'A propos',
              icon: CupertinoIcons.info_circle_fill,
              onPressed: () => onItemPressed(context, index: 6),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * .015,
            ),
            DrawerItem(
              name: 'Deconnexion',
              icon: Icons.logout,
              onPressed: () => onItemPressed(context, index: 7),
            ),

            // SizedBox(height: MediaQuery.of(context).size.height * .05 ,),
            Expanded(
                child: Center(
                    child: Text(
              "Nos politiques de confidentialites",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            )))
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

  Widget headerWidget() {
    return uUsername == null
        ? Container(
            //height: MediaQuery.of(context).size.height,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : InkWell(
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
                    uUsername,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
            ),
          );
  }
}
