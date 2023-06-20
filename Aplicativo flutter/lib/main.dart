import 'package:flutter/material.dart';
import 'screens/user_list_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override                                                         
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/ListScreen': (context) => UserListScreen(),
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('OAT', style: TextStyle(fontSize: 20),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text('Olá!', style:TextStyle(fontSize: 24),
              ),
              const RotatedBox(quarterTurns: 0,
              child: Text('Consumindo uma API de usuários e usando a navegação para acessar \n detalhes dos usuários \n\n Autor: Samuel Lima',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(child: const Text('Listar'),
                onPressed: (){
                  Navigator.pushNamed(context, '/ListScreen');
                },
              ),
            ],
          ),
        ),
    );
  }

}



