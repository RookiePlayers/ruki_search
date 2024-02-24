<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

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

## Usage

```dart
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
```

## API Reference

### ISearchable

|Name|Description|object-type
|---------|-----------------|--------------|
|searchId|The searched for item.|string
|data|The serialized object-data| Map<string, dynamic>



