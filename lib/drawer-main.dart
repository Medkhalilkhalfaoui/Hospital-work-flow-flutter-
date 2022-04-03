import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
final myC = TextEditingController();
Widget drawer(BuildContext ctx) {
  return Drawer(
    child: ListView(padding: EdgeInsets.all(0.0), children: <Widget>[
      DrawerHeader(
        child: null,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      ListTile(
        title: Text('fiche personnel'),
        leading: Icon(Icons.person),
        onTap: () {
          Navigator.of(ctx).pushNamed('/2');
        },
      ),
      Divider(),
      ListTile(
        title: Text('Relcamer'),
        leading: Icon(Icons.chat),
        onTap: () {
          showDialog(
            context: ctx,
            builder: (ctx) {
              return AlertDialog(
                title: Text('Reclamer :'),
                content: TextField(
                  controller: myC ,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 20),
                    border: OutlineInputBorder(),
                  ),
                ),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text(
                      'Envoyer',
                    ),
                    color: Color.fromRGBO(179, 228, 233, 1.0),
                    textColor: Colors.black,
                    onPressed: ()async {

                      CollectionReference users = FirebaseFirestore.instance.collection('reclamer');
                      users
                          .add({
                        'r': myC.text.toString(),

                      })
                          .then((value) => print("User Added"))
                          .catchError((error) => print("Failed to add user: $error"));


                      Navigator.of(ctx).pop();
                    },
                  )
                ],
              );
            },
          );
        },
      ),
      Divider(),
      ListTile(
          title: Text('Close'),
          leading: Icon(Icons.close),
          onTap: () {
            Navigator.of(ctx).pop();
          }),
    ]),
  );
}
