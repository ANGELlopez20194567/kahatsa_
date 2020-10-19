import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:kahatsa/UI/publicaciones_screen.dart';
import 'package:kahatsa/UI/publicaciones_information.dart';
import 'package:kahatsa/model/publicaciones.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:kahatsa/UI/listview_publicaciones.dart';
import 'package:kahatsa/UI/principal.dart';
import 'package:kahatsa/UI/fuera.dart';

void main() {
  runApp(
    /*new MaterialApp(
  home: ListViewPublicacion(),
  title: 'kahatsa',
)*/
      Myapp()


  );
}

class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      home: Mybottonnavigationbar(),
    );

  }

}












class Mybottonnavigationbar extends StatefulWidget {
  @override
  int numero;

  Mybottonnavigationbar();


  _MybottonnavigationbarState createState() => _MybottonnavigationbarState();
}

int _currentindex = 1;


class _MybottonnavigationbarState extends State<Mybottonnavigationbar> {




  /*void asies(int num){
    const _currentid =1;
    this._currentindex = _currentid;
  }*/




  final List<Widget> _children = [
    PublicacionesScreen(Publicaciones(null, '', '', '', '')),
    lavistadelista(),
  ];

  void onttappedbar(int index) {
    setState(() {
      _currentindex = index;
    });

    if(index == 2){
      SystemNavigator.pop();
    }





  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentindex],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.amber,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.black,
        height: 50,

        onTap: onttappedbar,
        index: _currentindex,
        items: [
          Icon(Icons.create, size: 20, color: Colors.white,),
          Icon(Icons.chrome_reader_mode, size: 20, color: Colors.white),
          Icon(Icons.exit_to_app, size: 20, color: Colors.white),
        ],
        animationDuration: Duration(
            milliseconds: 200
        ),
        animationCurve: Curves.bounceInOut,


      ),
    );
  }


  void _createNewPublicacion(BuildContext context) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
            PublicacionesScreen(Publicaciones(null, '', '', '', '')))
    );
  }

  void fuera (){
    SystemNavigator.pop();
  }



}

 class estes{
  int numero =1;

}
