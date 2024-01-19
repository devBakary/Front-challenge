import 'package:challenge_front/Screen/Accueil/Accueil.dart';
import 'package:challenge_front/Screen/Inscription/inscription.dart';
import 'package:flutter/material.dart';

import '../../services/auth.dart';

class Authentification extends StatefulWidget {
  const Authentification({super.key});

  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF0F2D42),
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.only(top: 80, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Connexion",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Votre aventure commence ici",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
            const Text("connectez-vous pour explorer.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
            const SizedBox(
              height: 40,
            ),
            // ======== ========== ============
            const Text(
              "Numero de telephone",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color(0xFFe7edeb),
                hintText: '91 22 88 29 ',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // ======== ========== ============
            const Text(
              "Mot de passe",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color(0xFFe7edeb),
                  hintText: 'Mot de passe',
                  suffixIcon: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 30,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            // ======== ========== ============
            Container(
              alignment: Alignment.centerRight,
              child: const Text(
                'Mot de passe oublié?',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 50,
              // color: Colors.blue,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () async {
                  final email = emailController.text + '@gmail.com';
                  final result = await signInWithEmailPassword(
                      email, passwordController.text);
                  if (result != null) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => Accueil()));
                  }
                },
                child: const Text(
                  "Se Connecter",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .18,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.facebook_outlined,
                      size: 40,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .18,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.report_gmailerrorred,
                      size: 40,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .18,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.apple_outlined,
                      size: 40,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .18,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.apple_rounded,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    child: const Text(
                      'Vous navez de compte?',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const Inscription()));
                      },
                      child: const Text(
                        "S'inscrire",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
