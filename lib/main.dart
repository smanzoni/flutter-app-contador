import 'package:counter_app/screens/counter_screen.dart';
//import 'package:counter_app/screens/home_screen.dart';

import 'package:flutter/material.dart';


void main(){
  //Funcion que se utiliza para lanzar nuestra aplicación
  //Especifica cuál es el widget inicial que se debe ejecutar para levantar toda nuestra app
  //Dentro del widget principal se desarrollará toda la aplicación
  runApp( const MyApp() );
}


//Definición de widget inicial
class MyApp extends  StatelessWidget{

  const MyApp({Key? key}) : super(key: key);

  //Todo StatelessWidget necesita un método build que devuelva un Widget
  @override
  Widget build(BuildContext context) {
    //Generalmente tiene un MaterialApp o CupertinoApp (los cuales definen la visualización si es de estilo Android o IOs)
    //Es el widget "padre". El mismo contiene el punto más alto de nuestro context
    //Todos los demás widgets van a tener de padre el widget inicial
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //Quita el banner de debug
      home:  CounterScreen()
    );
  }

}