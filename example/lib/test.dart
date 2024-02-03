import 'package:ruki_search/ruki_search.dart';

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
