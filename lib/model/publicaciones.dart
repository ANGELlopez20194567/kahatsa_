import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Publicaciones{
  String _id;
  String _nombre;
  String _edad;
  String _titulo;
  String _texto;

  Publicaciones(this._id,this._nombre,this._edad,this._titulo,this._texto);

  Publicaciones.map(dynamic obj){
    this._nombre=obj['nombre'];
    this._edad=obj['edad'];
    this._titulo=obj['titulo'];
    this._texto=obj['texto'];

  }
  String get id => _id;
  String get nombre=>_nombre;
  String get edad=>_edad;
  String get titulo=>_titulo;
  String get texto=>_texto;

  Publicaciones.fromSnapShot(DataSnapshot snapshot){
    _id = snapshot.key;
    _nombre = snapshot.value['nombre'];
    _edad = snapshot.value['edad'];
    _titulo = snapshot.value['titulo'];
    _texto = snapshot.value['texto'];

  }

}