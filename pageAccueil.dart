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
      body:SafeArea(child: Column(
        children: [
          // pati fim tandans nan ppage akey(horizontal)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 18),
                Text('Chargement'),
                Text(
                  'Tendances',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //se bouton pou afiche tout fim tandans yo
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Voir tout',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          
          // Lis kp defile horizontal pou fim tandans
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              //konte fim lis tandans yo
              //itemCount: tandansMovies.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 120,
                  //se toujou pou konte fim nn lis ke chwazi pou fim tandans yo pou bay container lan maj
                 // margin: EdgeInsets.only(left: 16, right: index == tandansMovies.length - 1 ? 16 : 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Affiche du film
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[800],
                          //se pou afiche fim nap mmete an gran yo
                         //fim
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Section Films populaires (vertical)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Populaires',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //bouton pou f we tout fim popile yo wap afiche tout lis la
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Voir tout',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),

          // Liste verticale des films populaires
          Expanded(
            child: ListView.builder(
              //sa se lew finn chwazi lis fim popile yo wap kote pou l afiche lis la ap rele popileMovies
             // itemCount: popileMovies.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    width: 100,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[800],
                     //la wap ajoute fim nn
                    ),
                  ),
                  title: Text(
                     "titre film",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    'year',
                    style: TextStyle(color: Colors.black),
                  ),
                  //sa se pou detay wap relye icon nn avek detay sou fim nn
                  trailing: Icon(Icons.more_vert, color: Colors.black),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
      ),
    bottomNavigationBar: _BottomNav(0),
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
    backgroundColor: Colors.white,
    onTap: (idx) {
      //la wap fe relasyon yo
      //if(i==1)
    },
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
      //relye ak lis film
      BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Films'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Recherche'),
      //relye avek favori
      BottomNavigationBarItem(icon: Icon(Icons.favorite,
                                          color: Colors.red), label: 'Favoris'),
      
    ],
  );
}
