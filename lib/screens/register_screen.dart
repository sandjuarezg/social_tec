import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController txtNombre = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  PickedFile? _imageUser = null;
  
  void _openGallery(BuildContext context) async {
    var picture = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    
    if(picture != null) {
      setState(() {
        _imageUser =null;
        _imageUser = picture;
      });
    }

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    var picture = await ImagePicker.platform.pickImage(source: ImageSource.camera);
    if(picture != null) {
      _imageUser = null;
      _imageUser = picture;
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registrar usuario"
        ),
        backgroundColor: Color.fromARGB(163, 190, 76, 219),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text(
                    'Bienvenido a Social TEC',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Center(
                child: Stack(
                  children: [   
                    _imageUser!=null?
                    CircleAvatar(
                      radius: 90,
                      backgroundImage: FileImage(File(_imageUser!.path)),  
                    )
                    :
                    CircleAvatar(
                      radius: 90,
                      backgroundImage: NetworkImage("data:image/png;base64,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"),  
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 130,left: 120),
                      child: InkWell(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(68, 251, 157, 223),
                            borderRadius:BorderRadius.circular(100)
                          ),
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          showDialog(
                            context: context, 
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Subir Foto"),
                                actions: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(68, 251, 157, 223),
                                            shape: const CircleBorder(), padding: const EdgeInsets.all(30)),
                                        child: const Icon(
                                          Icons.add_a_photo,
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          _openCamera(context);
                                        },
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(68, 251, 157, 223),
                                            shape: const CircleBorder(), padding: const EdgeInsets.all(30)),
                                        child: const Icon(
                                          Icons.add_photo_alternate_outlined,
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          _openGallery(context);
                                        },
                                      ),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(68, 251, 157, 223),),
                                    child: Text("Cancelar"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              );
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              TextFormField(
                controller: txtNombre,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Sand Juarez',
                  labelText: 'Nombre completo',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  enabledBorder: OutlineInputBorder(
                       borderSide:BorderSide(width: 3, color: Color.fromARGB(68, 251, 157, 223)), 
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:BorderSide(width: 3, color: Color.fromARGB(68, 251, 157, 223)), 
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              TextFormField(
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'correo@email.com',
                  labelText: 'Correo',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  enabledBorder: OutlineInputBorder(
                       borderSide:BorderSide(width: 3, color: Color.fromARGB(68, 251, 157, 223)), 
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:BorderSide(width: 3, color: Color.fromARGB(68, 251, 157, 223)), 
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              TextFormField(
                controller: txtPass,
                autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '123',
                  labelText: 'Contraseña',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide:BorderSide(width: 3, color: Color.fromARGB(68, 251, 157, 223)), 
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:BorderSide(width: 3, color: Color.fromARGB(68, 251, 157, 223)), 
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 30)),
              ElevatedButton(
                child: Text(
                  "Guardar",
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  if(_imageUser == null || txtNombre.text == "" || txtEmail.text == "" || txtPass.text == "") {
                    final snackBar = SnackBar(content: Text('Llena todos los campos'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    if(EmailValidator.validate(txtEmail.text)) {
                      final snackBar = SnackBar(content: Text('Datos guardados correctamente'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      
                      _imageUser = null;
                      txtNombre.clear();
                      txtEmail.clear();
                      txtPass.clear();
                    } else {
                      final snackBar = SnackBar(content: Text('Ingresa un correo valido'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(50, 50), 
                  backgroundColor: Color.fromARGB(68, 251, 157, 223)
                ),
              )
            ],
          )
        ),
      ),
    );

  }
}