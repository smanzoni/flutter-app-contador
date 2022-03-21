
import 'package:flutter/material.dart';



//Clase original del widget. Siempre son Stateful. Cuando deseamos que manejen estado debemos crear una clase auxiliar para dicho fin
class CounterScreen extends StatefulWidget {
  
  const CounterScreen({Key? key}) : super(key: key);


  //Método original de la clase StatefulWidget (herencia), el cual inicializa el estado creando una instancia de la clase auxiliar
  @override
  State<CounterScreen> createState() => _CounterScreenState(); //Aquí se inicializa la clase auxiliar para almacenar el estado del widget
}



//Clase que funciona de extensión de la clase original para manejar el estado de la misma
class _CounterScreenState extends State<CounterScreen> { //Extiende de State<ClaseOriginal>. Es la clase que disponibiliza (entre otros) la función setState() para redibujar el widget actualizando los valores del mismo
  
  //Definimos las variables que almacenaran el estado
  int counter = 0;

  //Definimos las funciones que manipularan el estado
  void increase(){
    counter++;
    setState(() {});
  }
  void decrease(){
    counter--;
    setState(() {});
  }
  void reset(){
    counter = 0;
    setState(() {});
  }
  

  @override
  Widget build(BuildContext context) {

    const fontStyle = TextStyle(fontSize: 30, color: Colors.blueAccent);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("CounterScreen")),
        elevation: 5,
      ),
    
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Numero de Clicks", style:fontStyle ), 
            Text("$counter", style:fontStyle )
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked , //Maneja la ubicación del floatingActionButton

      //Widget custom con los 3 btns 
      //Recibe las funciones que manejan el estado del widget padre por parámetro en el constructor del custom widget 
      floatingActionButton: CustomFloatingActions( increaseFn: increase, decreaseFn: decrease, resetFn: reset,),
    );
  }
}




//Se define sección de botones como un Widget único (custom), el cual incluye los 3 btns
class CustomFloatingActions extends StatelessWidget {

  //Funciones guardadas como propiedades de clase
  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;

  //Constructor
  //Recibe funciones por parámetro para modificar el estado del widget padre
  const CustomFloatingActions({ 
      Key? key, 
      required this.increaseFn,
      required this.decreaseFn,
      required this.resetFn
    }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //Retorna la creación del Widget
    return Row(
      //Propiedades del Widget
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      //Widgets hijos se setean como propiedades del padre
      children: [
        //Widget hijo (btn)
        FloatingActionButton(  
          onPressed: () => decreaseFn(), 
          child: const Icon( Icons.exposure_minus_1_outlined )
        ),

        //Widget hijo (btn)
        FloatingActionButton(  
          onPressed: () => resetFn(), 
          child: const Icon( Icons.exposure_zero_outlined )
        ),

        //Widget hijo (btn)
        FloatingActionButton(  
          onPressed: () => increaseFn(), 
          child: const Icon( Icons.exposure_plus_1 )
        ),
      ],
    );
  }
}
