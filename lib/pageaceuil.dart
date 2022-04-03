

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'drawer-main.dart';
import 'package:url_launcher/url_launcher.dart';

class Aceuil extends StatefulWidget {
  const Aceuil({Key? key}) : super(key: key);


  @override
  _AceuilState createState() => _AceuilState();
}

class _AceuilState extends State<Aceuil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 254, 229, 1),
      appBar: AppBar(
        backgroundColor:  Color.fromRGBO(179, 228, 233, 1.0),
        centerTitle: true,
        title: Text('Hospital Manager'),
      ),
      drawer: drawer(context),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 20.0),
          SizedBox(
            height: 240.0,
            width: double.infinity,
            child: Carousel(
              dotSize: 4.0,
              dotSpacing: 15.0,
             // dotColor: Colors.deepOrangeAccent,
              indicatorBgPadding: 5.0,
              dotBgColor: Colors.transparent,
              dotVerticalPadding: 5.0,
              dotPosition: DotPosition.bottomRight,
              images: [
                InkWell(
                    onTap:(){} ,
                    child: Image.asset(
                      'assets/san.jpg',
                      fit: BoxFit.cover,
                    )),
                Image.asset(
                  'assets/evax.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/cv.jpeg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/tabac.jpg',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(child: Text('Les contacts des docteurs :',textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold),),
          padding: EdgeInsets.only(left: 0.0,right: 160),
          ),
          Divider(color: Colors.amber, height: 20,indent: 20,),
          SizedBox(height: 20.0),
          card('assets/yeux.jpg', "Ophtalmologistes",context),
          SizedBox(height: 20.0 ),
          card('assets/estomac.jpg', "Gastro-entérologue",context),
          SizedBox(height: 20.0),
          card('assets/os.jpg', "les chirurgiens d'os",context),
          SizedBox(height: 20.0),

          /*con("Docteur des yeux", "12/08/2021", "12h30", "bloc a",
              'assets/yeux.jpg'),
          con("les chirurgiens", "Tomorrow", "8h30", "bloc b", 'assets/os.jpg'),
          con("Docteur d'estomac", '4/06/2021', '8h30', 'bloc d',
              'assets/estomac.jpg')*/
        ]),
      ),
      /*floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {

          await FirebaseFirestore.instance
              .collection("users").where("name", isEqualTo : "khalil")
              .get()
              .then((value) {
            setState((){
              if (value != null) {

                  print(value.docs[0].data()["name"]);



              }
            });
          });
          // Add your onPressed code here!
        },
        label: const Text('Reclamer'),
        icon: const Icon(Icons.add),
        backgroundColor: Color.fromRGBO(179, 228, 233, 1.0) ,
      ),*/
    );
  }
}

Widget con(String doc, String date, String temp, String lieu, String img) {
  return Container(
    margin: EdgeInsets.all(0.0),
    width: double.infinity,
    height: 250,
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // add this
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              child: Image.asset(img,
                  // width: 300,
                  height: 150,
                  fit: BoxFit.fill),
            ),
            ListTile(
              title: Center(child: Text(doc)),
              subtitle: Center(
                  child: Text('📅 ' + date + ' 🕔 ' + temp + ' 🏫 ' + lieu)),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget card(String s1, String s2, BuildContext context, ) {
  return InkWell(
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          /*BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),*/
          child: Image.asset(
            s1,
            height: 200,
            width: 350,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 20,
          right: 10,
          child: Container(
            color: Colors.black54,
            width: 300,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Text(
              s2,
              style: TextStyle(fontSize: 26, color: Colors.white),
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ],
    ),
    onTap: ()async{
      Navigator.pushNamed(
        context,
        '/3',
        arguments: {'a': s2},
      );



    },
  );
}

