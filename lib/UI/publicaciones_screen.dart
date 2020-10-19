import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:kahatsa/model/publicaciones.dart';
import 'package:kahatsa/main.dart';
import 'package:kahatsa/UI/principal.dart';



class PublicacionesScreen extends StatefulWidget{
  final Publicaciones publicaciones;

  PublicacionesScreen(this.publicaciones);
  @override
  State<StatefulWidget> createState() {
     return PublicacionesScreenState();
  }

}

final publicacionreference = FirebaseDatabase.instance.reference().child('publicacion');



class PublicacionesScreenState extends State<PublicacionesScreen>{
  List<Publicaciones> items;

  TextEditingController _nombreControlador;
  TextEditingController _edadControlador;
  TextEditingController _titulocontrolador;
  TextEditingController _textoControlador;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nombreControlador =
    new TextEditingController(text: widget.publicaciones.nombre);
    _edadControlador =
    new TextEditingController(text: widget.publicaciones.edad);
    _titulocontrolador =
    new TextEditingController(text: widget.publicaciones.titulo);
    _textoControlador =
    new TextEditingController(text: widget.publicaciones.texto);
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Center(child: Text(
            "cuentenos...",

            style: TextStyle(
              fontFamily: 'Maya',
              fontSize: 20,


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
        height: MediaQuery.of(this.context).size.height,
        width: MediaQuery.of(this.context).size.width,
        padding: const EdgeInsets.all(20.00),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _nombreControlador,
                  style: TextStyle(
                    fontSize: 17.00,
                    color: Colors.deepOrangeAccent,
                  ),
                  decoration: InputDecoration(icon: Icon(Icons.person),
                  labelText: 'Nombre'),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),

                TextField(
                  controller: _edadControlador,
                  style: TextStyle(
                    fontSize: 17.00,
                    color: Colors.deepOrangeAccent,
                  ),
                  decoration: InputDecoration(icon: Icon(Icons.cake),
                      labelText: 'Edad (años)'),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(color: Colors.black,),

                TextField(
                  controller: _titulocontrolador,
                  style: TextStyle(
                    fontSize: 17.00,
                    color: Colors.deepOrangeAccent,
                  ),
                  decoration: InputDecoration(icon: Icon(Icons.title),
                      labelText: 'Titulo'),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),

                TextField(
                  controller: _textoControlador,
                  style: TextStyle(
                    fontSize: 17.00,
                    color: Colors.deepOrangeAccent,

                  ),
                  decoration: InputDecoration(
                      labelText: 'escriba su historia...'),

                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                FlatButton(onPressed: (){
                  if(widget.publicaciones.id != null){
                    publicacionreference.child(widget.publicaciones.id).set({
                      'nombre':_nombreControlador.text,
                      'edad':_edadControlador.text,
                      'titulo':_titulocontrolador.text,
                      'texto':_textoControlador.text,

                    }).then((_){
                      Navigator.pop(context);

                    });

                    iralprincipio(context);


                  }else{
                    publicacionreference.push().set({
                      'nombre':_nombreControlador.text,
                      'edad':_edadControlador.text,
                      'titulo':_titulocontrolador.text,
                      'texto':_textoControlador.text,
                    }).then((_){
                      Navigator.pop(context);
                    });

                    

                    iralprincipio(context);

                    debugPrint(context.toString());
                  }
                },
                  child: (widget.publicaciones.id != null) ? Text("Listo!") : Text("Listo"))

              ],
            ),
          ),
        ),
      ),


    );

  }

  void iralprincipio(BuildContext context)async{
    await Navigator.push(context,
    MaterialPageRoute(builder: (context) => Mybottonnavigationbar(

    ),));




  }

}