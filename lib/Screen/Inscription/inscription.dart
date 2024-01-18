import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/auth.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  bool _obscureText = true;
  // TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.lightBlueAccent],
                begin: Alignment.topLeft,
                end: Alignment.centerRight)),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: Image.asset(
                    "assets/images/loggo.png",
                    width: 600,
                    height: 600,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45))),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .60,
                        padding: const EdgeInsets.all(20.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),
                              TextFormField(
                                controller: usernameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return " Le nom est obligatoire ! ";
                                  } else if (value.length < 3) {
                                    return "le nom doit contenir au minimum (3) caractères !";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    labelText: 'Nom Prénom *',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFe7edeb),
                                    hintText: 'Nom d\'utilisateur',
                                    hintStyle: const TextStyle(fontSize: 18),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.blueGrey,
                                      size: 30,
                                    )),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),

                              //numero
                              TextFormField(
                                controller: numeroController,
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return " Le numero est obligatoire !";
                                  } else if (value.length != 8) {
                                    return " Le format incorrect, veuillez entrer les (8) chiffres !";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    labelText: 'Numero *',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFe7edeb),
                                    hintText: 'Numero de telephone *',
                                    hintStyle: const TextStyle(fontSize: 18),
                                    prefixIcon: Icon(
                                      CupertinoIcons.phone,
                                      color: Colors.blueGrey,
                                      size: 30,
                                    )),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),

                              //email
                              // TextFormField(
                              //   controller: emailController,
                              //   decoration: InputDecoration(
                              //       labelText: 'Email ',
                              //       border: OutlineInputBorder(
                              //         borderRadius: BorderRadius.circular(10),
                              //         borderSide: BorderSide.none,
                              //       ),
                              //       filled: true,
                              //       fillColor: Color(0xFFe7edeb),
                              //       hintText: 'bak@gmail.com',
                              //       hintStyle: const TextStyle(fontSize: 18),
                              //       prefixIcon: Icon(
                              //         CupertinoIcons.mail,
                              //         color: Colors.blueGrey,
                              //         size: 30,
                              //       )),
                              // ),
                              // SizedBox(
                              //   height:
                              //       MediaQuery.of(context).size.height * .02,
                              // ),

                              //adresse
                              TextFormField(
                                controller: adresseController,
                                decoration: InputDecoration(
                                    labelText: 'Adresse',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFe7edeb),
                                    hintText: 'Adresse',
                                    hintStyle: const TextStyle(fontSize: 18),
                                    prefixIcon: Icon(
                                      CupertinoIcons.location,
                                      color: Colors.blueGrey,
                                      size: 30,
                                    )),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .02,
                              ),

                              //mot de passe
                              TextFormField(
                                controller: passwordController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return " Le mot de passe est obligatoire! ";
                                  } else if (value.length < 6) {
                                    return " Le mot de passe doit contenir au minimum (6) caractères ! ";
                                  }
                                  return null;
                                },
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                    labelText: 'Mot de passe *',
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      child: Icon(_obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFe7edeb),
                                    hintText: 'Mot de passe ',
                                    prefixIcon: Icon(
                                      Icons.key,
                                      color: Colors.blueGrey,
                                      size: 30,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),

                      //container contenant le bouton de inscription
                      Container(
                        padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor: Colors.blue,
                            elevation: 3,
                          ),
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              final String email = "${numeroController.text}@gmail.com";
                              final result = await signUpWithEmailPassword(
                                  email,
                                  passwordController.text);
                              if (result != null) {
                                
                                // Navigator.of(context).pushReplacement(
                                //     MaterialPageRoute(
                                //         builder: (_) => const Connexions()));
                              }
                            }
                          },
                          child: const Text(
                            'Inscription',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                //Navigator.of(context).push(MaterialPageRoute(builder: (_) =>Connexions()));
                              },
                              child: const Text(
                                "Allez à la page de connexion",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              )),
                          const SizedBox(
                            width: 3,
                          ),
                          const Icon(
                            CupertinoIcons.right_chevron,
                            size: 26,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
