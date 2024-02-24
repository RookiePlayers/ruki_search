import 'dart:convert';

import 'package:example/test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruki_search/ruki_search.dart';
import 'package:http/http.dart' as http;

import 'beer.dart';

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

  Future<List<ISearchable>> _httpPunkApi(
      {dynamic offset, limit = 5}) async {
    print("Fetching data: ${'https://api.punkapi.com/v2/beers?page=${offset ?? 1}&per_page=${limit}'}");
    final response = await http.get(Uri.parse(
        'https://api.punkapi.com/v2/beers?page=${offset ?? 1}&per_page=${limit}'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List<Beer> beers = (decoded as List).map((e) {
        return Beer.fromJson(e);
      }).toList();
      return beers;
    } else {
      throw Exception('Failed to load beers');
    }
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
            const TabBar(
              tabs: <Widget>[
                Tab(icon: Text("Search Page")),
                Tab(icon: Text("Search Page Lazy")),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        child: _buildSearchByPage(),
                        padding: const EdgeInsets.all(12.0),
                      )),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        child: _buildSearchpageWithPagination(),
                        padding: const EdgeInsets.all(12.0),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildSearchpageWithPagination() {
    return SearchPage.searchBarButton(context,
        placeholder: "Search by name",
        enableLazyLoading: true,
        paginateByPageNumber: true,
        enableLoadMoreScroll: false,
        liveSearch: false,
        showExit: false, lazyRequest: (query, page) {
      return _httpPunkApi(offset: page, limit: 5);
    }, resultBuilder: (result) {
      final modelData = result as Beer;
      return Container(
        child: ListTile(
          leading: const Icon(Icons.wine_bar_rounded),
          title: Text(modelData.name ?? ""),
        ),
      );
    });
  }

  _buildSearchByPage() {
    return SearchPage.searchBarButton(context,
        placeholder: "Search by name",
        enableLazyLoading: false,
        showExit: false, request: (query) {
      return Future.value([
        Test(name: "Ruki"),
        Test(name: "Ruki2"),
        Test(name: "Ruki3"),
        Test(name: "Ruki4"),
        Test(name: "Ruki5"),
        Test(name: "Ruki6")
      ]
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList());
    }, resultBuilder: (result) {
      final modelData = result as Test;
      return Container(
        child: ListTile(
          title: Text(modelData.name),
        ),
      );
    });
  }
}
