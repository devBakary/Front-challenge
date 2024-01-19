import 'dart:io';

import 'package:challenge_front/global_widgets/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FormulairePage extends StatefulWidget {
  final String title;
  final String description;
  final String imageAsset;
  const FormulairePage(
      {super.key,
      required this.title,
      required this.description,
      required this.imageAsset});

  @override
  State<FormulairePage> createState() => _FormulairePageState();
}

class _FormulairePageState extends State<FormulairePage> {
  final ImagePicker picker = ImagePicker();
  late XFile? image;

  void _pickImages() async {
    print('eeeeeeeee');
    // Open the image picker
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() async {});
  }

  void _takePhotos() async {
    print('eeeeeeeee');
    image = await picker.pickImage(
      source: ImageSource.camera,
    );

    // Add the taken image to the list
    if (image != null) {
      setState(() {
        this.image = image;
      });
    }
  }

  Future<String> saveImage(XFile image) async {
    // Create a reference to the location you want to upload to in Firebase Storage
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('nationalité_casier')
        .child(image.path.split('/').last);

    // Upload the file to Firebase Storage
    UploadTask uploadTask = storageReference.putFile(File(image.path));

    // Get the URL of the uploaded image
    TaskSnapshot taskSnapshot = await uploadTask;
    String imageUrl = await taskSnapshot.ref.getDownloadURL();

    setState(() {});
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe7edeb),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.asset(
                      widget.imageAsset,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.description,
                        style: const TextStyle(
                          fontSize: 15,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              formulaireNationaliteCasier(context, _takePhotos, _pickImages),
            ],
          ),
        ),
      ),
    );
  }
}

// formulaire widget
Widget formulaireNationaliteCasier(BuildContext context,
    Function() onPressedCamera, Function() onPressedGallery) {
  TextEditingController nomController = TextEditingController();
  TextEditingController dateNaissanceController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  // TextEditingController statutController = TextEditingController();

  return Container(
    padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
    // height: MediaQuery.of(context).size.height,
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
    child: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: TextField(
                  controller: nomController,
                  decoration: const InputDecoration(
                    labelText: 'Prénom et Nom',
                    hintText: 'Ex: Madou Sow',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: adresseController,
                  decoration: const InputDecoration(
                    labelText: 'adresse',
                    hintText: 'Ex: Korofina-sud',
                    prefixIcon: Icon(Icons.location_city),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: nomController,
                  decoration: const InputDecoration(
                    labelText: 'Profession',
                    hintText: 'Ex: Etudiant',
                    prefixIcon: Icon(Icons.work),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: DatePickerWidget(
                  onDateSelected: (date) {
                    dateNaissanceController.text =
                        date.toIso8601String().split('T')[0];
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // const Text(
              //   'Selectionner votre statut Ex: Célibataire',
              //   textAlign: TextAlign.left,
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: DropdownButtonFormField<String>(
                  // elevation: 20,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    labelText: 'Statut',
                    hintText: 'Ex: Célibataire',
                    prefixIcon: Icon(Icons.person),
                  ),
                  items: <String>['Célibataire', 'Marié', 'Divorcé', 'Veuf']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // setState(() {
                    //   dropdownValue = newValue!;
                    // });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Photo d\'identité',
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: onPressedCamera,
                    child: const Icon(
                      Icons.camera_alt,
                      size: 50,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                      onPressed: onPressedGallery,
                      child: const Icon(
                        Icons.photo,
                        size: 50,
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Envoye votre demande'),
              )
            ],
          )),
    ),
  );
}
