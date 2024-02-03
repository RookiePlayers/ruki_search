import 'package:example/test.dart';
import 'package:flutter/material.dart';
import 'package:ruki_search/ruki_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TabBar(
              tabs: <Widget>[
                Tab(icon: Text("Search Page By Button")),
                Tab(icon: Text("Search")),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Align(alignment: Alignment.topCenter, child: Padding(
                    child: _buildSearchByPage(),
                    padding: const EdgeInsets.all(12.0),
                  )),
                  Center(child: Text('Transit')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildSearchByPage() {
    return SearchPage.searchBarButton(context, 
    placeholder: "Search by name",
    enableLazyLoading: false,
    showExit: false,
    request: (query) {
      return Future.value([
        Test(name: "Ruki"),
        Test(name: "Ruki2"),
        Test(name: "Ruki3"),
        Test(name: "Ruki4"),
        Test(name: "Ruki5"),
        Test(name: "Ruki6")
      ].where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList());
    },
    resultBuilder: (result) {
      final modelData = result as Test;
      return Container(
        child: ListTile(
          
          title: Text(modelData.name),
        ),
      );
    
    }
    );
  }
}
