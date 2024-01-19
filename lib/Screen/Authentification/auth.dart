import 'package:flutter/material.dart';

class Authentification extends StatefulWidget {
  const Authentification({super.key});

  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  bool _obscureText = true;
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
          image: DecorationImage(
              image: AssetImage("assets/images/toff.png"), fit: BoxFit.cover),
        ),
        child: Form(
          // key: formkey,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .04,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return " Veuillez renseigner le nom d'utilisateur ! ";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'Numero de telephone',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Color(0xFFe7edeb),
                              hintText: 'Numero de telephone',
                              hintStyle: const TextStyle(fontSize: 18),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.blueGrey,
                                size: 30,
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),

                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Veuillez renseigner le mot de passe";
                            }
                            return null;
                          },
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                              labelText: 'Mot de passe ',
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

                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),

                        InkWell(
                            onTap: () {},
                            child: const Text(
                              "Mot de passe oublié ?",
                              style: TextStyle(
                                  fontSize: 16,
                                  decoration: TextDecoration.underline),
                            )),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * .04,
                        ),

                        Container(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () async {},
                            style: ElevatedButton.styleFrom(
                              elevation: 3,
                            ),
                            child: const Text(
                              'Connexion',
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * .04,
                        ),

                        //container contenant le bouton de inscription
                        Container(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigator.of(context).push(MaterialPageRoute(builder: (_) =>Inscriptions()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              elevation: 3,
                            ),
                            child: const Text(
                              'Inscription',
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
