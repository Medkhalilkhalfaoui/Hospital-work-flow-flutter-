import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Cin extends StatefulWidget {
  const Cin({Key? key}) : super(key: key);

  @override
  State<Cin> createState() => _CinState();
}

class _CinState extends State<Cin> {
  @override
  Widget build(BuildContext context) {
   var rend = '';
    var prenom= '';
    var nom = '';
    var mal = [];
    var h = '';
    final myController = TextEditingController();
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 254, 229, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(179, 228, 233, 1.0),
        centerTitle: true,
        title: Text('Hopital'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                child: Image.asset('assets/health.jpg', height: 190,fit: BoxFit.cover,),
              ),
              //SizedBox(height: 20,),

              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 30.0, 12.0, 2.0),
                child: TextField(
                  maxLength: 8,
                  controller: myController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Saisir Numéro de CIN ',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: FlatButton(
                  minWidth: 50,
                  child: Text(
                    '-->',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  color: Color.fromRGBO(179, 228, 233, 1.0),
                  textColor: Colors.black,
                  onPressed: () async {
                    var x = myController.text.toString();
                    if(x.length==8) {
                      FirebaseFirestore.instance
                          .collection('personne')
                          .where('cin', isEqualTo: int.parse(x))
                          .get()
                          .then((QuerySnapshot querySnapshot) {
                        querySnapshot.docs.forEach((doc) {
                          setState(() {
                            print(doc["nom"]);
                            nom = doc["nom"];
                            prenom = doc["prénom"];
                            rend = doc["rend"];
                            mal = doc["maladies"];
                            h = doc["h"];
                          });
                          Navigator.pushNamed(context,
                            '/4',
                            arguments: {
                              'nom': nom,
                              'prenom': prenom,
                              'rend': rend,
                              'mal': mal,
                              'h': h,
                            },

                          );




                        });
                      });
                    }else{
                    showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              // Retrieve the text the that user has entered by using the
                              // TextEditingController.
                                content: Text('erreur de saisie ou introuvable')
                              //Text(myController.text),
                            );
                          },
                        );}

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
