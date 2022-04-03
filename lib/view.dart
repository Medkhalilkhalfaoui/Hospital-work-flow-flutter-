
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class View extends StatefulWidget {



  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String cle;
    if (arguments != null)
       cle = arguments['a'];
    else cle = 'Ophtalmologistes';

    final Map<String, dynamic> dynamicMap = {

      'Ophtalmologistes': ['chedi abdelkader', 'hadil belanes', 'med khalil khalfaoui'],
      'Ophtalmologistesp': ['24789562', '25963157', '98265345'],
      'Gastro-entérologue': ['taher bouriga', 'fadi kerkni', 'olfa zaouali'],
      'Gastro-entérologuep': ['24789562', '25963157', '98265345'],
      "les chirurgiens d'os": ['arij yeddes', 'iheb mechregi', 'rayana ataoui'],
      "les chirurgiens d'osp": ['24789562', '25963157', '98265345'],
    };





    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(179, 228, 233, 1.0),
        centerTitle: true,
        title: Text('listes des docteurs'),
      ),


      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: dynamicMap[cle].length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                SizedBox(height: 25,),
                Container(
                  height: 50,
                  color: Colors.amber,
                  child: Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.account_circle,   ),
                      Text('${dynamicMap[cle][index]}'),
                      Icon(Icons.phone),
                      InkWell(
                          child: Text(' ${dynamicMap[cle+'p'][index]}',style: TextStyle(backgroundColor: Colors.amber),),
                          onTap: (){

                          },
                      ),
                    ],
                  )),
                ),
                Divider()
              ],
            );
          }
      ),
    );
  }
}
