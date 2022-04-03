

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Personne extends StatefulWidget {
  const Personne({Key? key}) : super(key: key);

  @override
  _PersonneState createState() => _PersonneState();
}

class _PersonneState extends State<Personne> {

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String nom = arguments['nom'];
    String prenom = arguments['prenom'];
    String rend = arguments['rend'];
    var  mal = arguments['mal'];
    String h = arguments['h'];
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 254, 229, 1),

        appBar: AppBar(
          backgroundColor: Color.fromRGBO(179, 228, 233, 1.0),
          centerTitle: true,
          title: Text('Fiche de '+prenom+' '+nom),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(children: <Widget>[
                SizedBox(height: 30,),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Table(
                    border: TableBorder.all(),
                    //columnWidths: {0: FractionColumnWidth(.4), 1: FractionColumnWidth(.2), 2: FractionColumnWidth(.4)},
                    children: [
                      TableRow( children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                          Text('les rendez-vous  ',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color:  Colors.amber),),
                          Icon(Icons.date_range),

                        ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Text("l'heure  ",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color:  Colors.amber),),
                              Icon(Icons.access_time ),

                            ]),

                      ]),


                      TableRow( children: [
                       Text('\n'+rend+'\n', textAlign: TextAlign.center,),
                        Text('\n'+h+'\n', textAlign: TextAlign.center,),
                      ]),
                      TableRow( children: [
                        Text(''),
                        Text(''),
                      ]),
                      TableRow( children: [
                        Text(''),
                        Text(''),

                      ]),
                    ],
                  ),
                ),
                SizedBox(height: 50,),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Table(
                    border: TableBorder.all(),
                    //columnWidths: {0: FractionColumnWidth(.4), 1: FractionColumnWidth(.2), 2: FractionColumnWidth(.4)},
                    children: [
                      TableRow( children: [
                        Column(children:[
                          Text('les maladies',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.amber),),
                        ]),

                      ]),
                      TableRow( children: [
                        Text(mal[0],textAlign: TextAlign.center),
                      ]),
                      TableRow( children: [
                        Text(mal[1],textAlign: TextAlign.center),
                      ]),
                      TableRow( children: [
                        Text(''),
                      ]),
                    ],
                  ),
                ),
                SizedBox(height: 50,),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Table(
                    border: TableBorder.all(),
                   // columnWidths: {0: FractionColumnWidth(.4), 1: FractionColumnWidth(.2), 2: FractionColumnWidth(.4)},
                    children: [
                      TableRow( children: [
                        Column(children:[
                          Text('historique des opérations',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.amber),)
                        ]),

                      ]),
                      TableRow( children: [
                        Text(''),
                      ]),
                      TableRow( children: [
                        Text(''),
                      ]),
                      TableRow( children: [
                        Text(''),
                      ]),
                    ],
                  ),
                ),
                SizedBox(height: 50,),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Table(
                    border: TableBorder.all(),
                    //columnWidths: {0: FractionColumnWidth(.4), 1: FractionColumnWidth(.2), 2: FractionColumnWidth(.4)},
                    children: [
                      TableRow( children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Text('liste des vacins  ',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color:  Colors.amber,),),
                            ]),
                      ]),
                      TableRow( children: [
                        Text(''),
                      ]),
                      TableRow( children: [
                        Text(''),

                      ]),
                      TableRow( children: [
                        Text(''),
                      ]),
                    ],
                  ),
                ),

              ])),
        ));
  }
}
