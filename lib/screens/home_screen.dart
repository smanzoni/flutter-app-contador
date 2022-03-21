

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  
  const HomeScreen({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {

    const fontStyle = TextStyle(fontSize: 30, color: Colors.blueAccent);
    int counter = 10;

    //El widget Scaffold se utiliza para representar toda la pantalla de la aplicación de nuestro dispositivo
    //Podemos asignarle un AppBar(barra header)
    //un FloatingActionButton (barra de botones de navegación)
    //El que siempre se utiliza es el body, que es donde se especifica el cuerpo de la aplicación
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("HomeScreen")),
        elevation: 5,
      ),
    
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text("Numero de Clicks", style:fontStyle ), 
            Text("$counter", style:fontStyle )
          ],
        ),
      ),

      //floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat , //Maneja la ubicación del floatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          counter++;
          print('Hola mundo: $counter');
        }, 
        child: const Icon( Icons.add )
      ),
    );
  }
}
