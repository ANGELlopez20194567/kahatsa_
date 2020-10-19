import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:kahatsa/model/publicaciones.dart';

class PublicacionesInformacion extends StatefulWidget{
  final Publicaciones publicaciones;
  PublicacionesInformacion(this.publicaciones);
  @override
  State<StatefulWidget> createState() {
   return _PublicacionesInformacionState();
  }

}

final publicacionreference = FirebaseDatabase.instance.reference().child('publicacion');


class _PublicacionesInformacionState extends State<PublicacionesInformacion>{

  List<Publicaciones> items;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Center(child: Text(
            "Relato",

            style: TextStyle(
              fontFamily: 'Maya',
              fontSize: 30,


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
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(this.context).size.height,
        width: MediaQuery.of(this.context).size.width,
        padding: const EdgeInsets.all(20.00),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                new Text("${widget.publicaciones.titulo}",
                  style: TextStyle(fontSize: 18.00,color: Colors.amber),

                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),

                new Text("${widget.publicaciones.nombre}"+" "+"${widget.publicaciones.edad}",
                  style: TextStyle(fontSize: 15.00,color: Colors.blueGrey),

                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),

                new Text("${widget.publicaciones.texto}",
                  style: TextStyle(fontSize: 20.00,color: Colors.black),

                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),

              ],
            ),
          ),
        ),
      ),
    );
  }

}