import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rattrapage prog mobile',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const MyHomePage(title: 'Ajouter une ville'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchController = TextEditingController();

  List<String> ville = ['a','b','c'];
  List<String> pays = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row (
          children: [
          Text(widget.title, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
        ],
        ),
      ),
          body: Column(
            children:[
               Container(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: "Saisissez le nom d'une ville",
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute (builder: (context) => Page2()));
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),

              Expanded(
              child: ListView.separated(
                itemCount: ville.length,
                itemBuilder: (context, i) {
                 //Construction du widget à répéter
                  return ListTile(
                    title: Text(ville[i], style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic)),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                ),
              ),
            ],
        ),
    );
  }
}

class Page2 extends StatelessWidget {
  Page2({Key? key}) : super(key: key);

  List<String> ville = ['a','b','c'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text('Mes villes', style: TextStyle(color: Colors.black)),
            actions: <Widget> [
              IconButton(
                  icon: Icon(Icons.add, color: Colors.black),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute (builder: (context) => MyApp()));
                  }
              ),
            ]
        ),

        body:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(2.0),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               /* Expanded(
                  child: ListView.builder(
                    itemCount: ville.length,
                    itemBuilder: (context, i) {
                      //Construction du widget à répéter
                      return Card (
                        child: ListTile(
                          title: Text(ville[i]),
                        ),
                      );
                    },
                  ),
                ), */
                const Text('Test ville, test Pays'),
                const Text('0°'),
                const Text('Pas beau'),
              ],
            ),
            SvgPicture.asset ('Icons/rain-2.svg'),
          ],
        ),
      ),
    );
  }
}
