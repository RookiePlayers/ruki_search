
This Widget is a replacement for Flutter's SearchPageDelegate. It's improved upon it and allows multiple types of search, it has in-built fetch async operations and also paginations for the result page.
The results page and suggestion pages are fully customizable. 

## Features

- **ISearchable** Make sure to implement the `ISearchable` class. The search page allows search on any model that has implemented this interface
- **Search Bar Button** You can use ` SearchPage.SearchBarButton` as the trigger for the search page or directly implement the search page as is.
- **Lazy Loading and Pagination**
- *Direct async data fetch when searching*

## Getting started

- `dart pub add ruki_search`
- Implement the ISearchable interface on your models
- That's it follow the example for more.

## Images
![alt Search Page](https://drive.google.com/uc?export=view&id=1uJKwf2yZzeFZD80QQRnmRad286zR9bBk)
![alt Search Page](https://drive.google.com/uc?export=view&id=1s7fFc4nEokgm_93-azgIm5IzjqL24K6w)
![alt Search Page](https://drive.google.com/uc?export=view&id=1VuBxwzzQWqgvqZThPM_KQtDGHNOj_5ff)

## Usage

```dart
//test.dart
class Test implements ISearchable {
  String name;

  Test({required this.name});

  @override
  Map<String, dynamic> data() {
    return {
      'name': name,
    };
  }

  @override
  String searchId() {
    return name;
  }
}

//main.dart
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

```

## API Reference

### ISearchable

|Name|Description|object-type
|---------|-----------------|--------------|
|searchId|The searched for item.|string
|data|The serialized object-data| Map<string, dynamic>

### SearchPage
| Property | Description | Type | Default |
| --- | --- | --- | --- |
| backgroundColor | The background color of the search page | Color | Colors.white24 |
| buttonColor | The color of the search button | Color | Colors.white24 |
| iconColor | The color of the search icon | Color | null |
| searchIcon | The icon to be used for the search button | IconData | LineIcons.search |
| closeIcon | The icon to be used for the close button | IconData | LineIcons.times |
| backIcon | The icon to be used for the back button | IconData | LineIcons.chevronLeft |
| borderRadius | The border radius of the search button | BorderRadius | const BorderRadius.all(Radius.circular(12)) |
| padding | The padding of the search button | EdgeInsets | const EdgeInsets.symmetric(vertical: 9, horizontal: 15) |
| textStyle | The text style of the search button | TextStyle | null |
| inputTextstyle | The text style of the search input | TextStyle | null |
| resultsAnimationDuration | The duration of the results animation | Duration | null |
| resultsAnimationOffset | The offset of the results animation | num | null |
| inputBackgroundColor | The background color of the search input | Color | null |
| inputBorder | The border of the search input | InputBorder | null |
| placeholder | The placeholder of the search input | String | "Search" |
| border | The border of the search button | Border | const Border() |
| initialQuery | The initial query of the search input | String | "" |
| showExit | Whether to show the exit button | bool | true |
| liveSearch | Whether to search live | bool | true |
| searchLeading | The leading widget of the search input | Widget | null |
| searchTrailing | The trailing widget of the search input | Widget | null |
| emptyScreen | The empty screen widget | Widget | null |
| resultScreen | The result screen widget | Widget | null |
| errorScreen | The error screen widget | Widget | null |
| loadingScreen | The loading screen widget | Widget | null |
| header | The header widget | Widget | null |
| history | The history widget | Widget | null |
| paginationCursor | The pagination cursor | dynamic | 1 |
| paginationLimit | The pagination limit | num | 30 |
| enableLazyLoading | Whether to enable lazy loading | bool | false |
| enableLoadMoreScroll | Whether to enable load more scroll | bool | false |
| loadMoreWidget | The load more widget | Widget | null |
| loadingWidget | The loading widget | Widget | null |
| resultBuilder | The result builder | Widget Function(ISearchable) | null |
| suggestionsBuilder | The suggestions builder | Widget Function(ISearchable) | null |
| suggestions | The suggestions method | Future<List<ISearchable>> Function(String) | null |
| request | The request method | Future<List<ISearchable>> Function(String) | null |
| lazyRequest | The lazy request method | Future<List<ISearchable>> Function(String, dynamic) | null |
| paginateByPageNumber | Whether to paginate by page number | bool | false |
| paginationOffset | The pagination offset | num | 1 |

