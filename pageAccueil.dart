import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.blue
      ),
      body: Center(
        
        child: Text(""),
      ),
     bottomNavigationBar:_BottomNav(0)
    );
  }
}

class _BottomNav extends StatelessWidget {
  final int i;
  _BottomNav(this.i);
  @override
  Widget build(BuildContext c) => BottomNavigationBar(
    currentIndex: i,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
    onTap: (idx) {
    },
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
      BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Films'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Recherche'),
      BottomNavigationBarItem(icon: Icon(Icons.favorite,
                                          color: Colors.red), label: 'Favoris'),
      
    ],
  );
}
