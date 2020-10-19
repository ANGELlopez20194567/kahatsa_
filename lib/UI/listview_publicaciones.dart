import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:kahatsa/UI/publicaciones_screen.dart';
import 'package:kahatsa/UI/publicaciones_information.dart';
import 'package:kahatsa/main.dart';
import 'package:kahatsa/model/publicaciones.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class ListViewPublicacion extends StatefulWidget{
  @override
 _ListViewPublicacionState createState() => _ListViewPublicacionState();
  }



final publicacionreference = FirebaseDatabase.instance.reference().child('publicacion');

class _ListViewPublicacionState extends State<ListViewPublicacion>{


 List<Publicaciones> items;
 StreamSubscription<Event> _onPublicacionAddSubscription;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items=new List();

    _onPublicacionAddSubscription = publicacionreference.onChildAdded.listen(_onPublicacionAdded);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _onPublicacionAddSubscription.cancel();

  }
//nuevo
  /*
 int bottomSelectedIndex = 0;
 List<BottomNavigationBarItem> buildBottomNavBarItems() {
   return[
     BottomNavigationBarItem(
       icon: new Icon(Icons.create,color:Colors.white),
     ),
     BottomNavigationBarItem(
       icon: new Icon(Icons.chrome_reader_mode,color:Colors.white),
     ),
     BottomNavigationBarItem(
       icon: new Icon(Icons.exit_to_app,color: Colors.white,),
     ),
   ];
 }
 //nuevo
 */
   

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Kahatsa',
        home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.amber,
              title: Center(child: Text(
                "Kahatsá",

                style: TextStyle(
                  fontFamily: 'Maya',
                  fontSize: 40,


                  color: Colors.white,

                  shadows: [
                    Shadow(
                      blurRadius: 15.0,
                      color: Colors.black,
                      offset: Offset(1.0, 1.0),
                    ),
                  ],



                ),

              ),)
          ),





          body: Center(

            child: ListView.builder(
              itemCount: items.length,
              padding: EdgeInsets.only(top: 12.0),
              itemBuilder: (context, position){
                  return Column(
                    children: <Widget>[
                      Divider(height: 7.0,),
                      Row(
                        
                        children: <Widget>[
                          Expanded(child: ListTile(
                            title:Text('${items[position].titulo}',
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 21,
                                fontFamily: 'Maya',
                              ),

                            ) ,

                            subtitle: Text(
                              '${items[position].nombre}'+' '+'${items[position].edad}',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 17,

                              ),
                            ),

                            onTap: () => _navigateToPublicacion(context, items[position]),

                          ),)
                        ],
                      ),
                    ],

                  );

              },

            )
          ),




          bottomNavigationBar: CurvedNavigationBar(

            color: Colors.amber,
            backgroundColor: Colors.white,
            buttonBackgroundColor: Colors.black,
            height: 50,
            items:<Widget>[
              Icon(Icons.create,size:20,color:Colors.white),
              Icon(Icons.chrome_reader_mode,size:20,color:Colors.white),
              Icon(Icons.exit_to_app,size:20,color:Colors.white),
            ],

            animationDuration: Duration(
                milliseconds: 200
            ),
            index: 1,
            animationCurve: Curves.bounceInOut,
            onTap: (index){
              debugPrint("current index is $index");
              if(index==0){
                _createNewPublicacion(context);

              }
              if(index ==2){
                fuera();
              }
            },
          ),

        ),

      );
  }
  void _onPublicacionAdded(Event event){
   setState(() {
     items.add(new Publicaciones.fromSnapShot(event.snapshot));
   });
  }

  void _navigateToPublicacion(BuildContext context, Publicaciones publicaciones)async{
   await Navigator.push(context,
   MaterialPageRoute(builder:(context)=>PublicacionesInformacion(publicaciones)),
   );

  }

  void _createNewPublicacion(BuildContext context)async{
   await Navigator.push(context,
     MaterialPageRoute(builder: (context)=>PublicacionesScreen(Publicaciones(null,'','','','')))
   );




  }
  void fuera (){
   SystemNavigator.pop();
  }
  
}
