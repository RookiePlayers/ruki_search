import 'package:json_annotation/json_annotation.dart';
import 'package:ruki_search/ruki_search.dart';

part 'beer.g.dart';

@JsonSerializable(explicitToJson: true)
class Beer implements ISearchable {
  int? id;
  String? name;
  String? tagline;
  String? firstBrewed;
  String? description;
  String? imageUrl;
  double? abv;
  double? ibu;
  double? targetFg;
  double? targetOg;
  double? ebc;
  double? srm;
  double? ph;
  double? attenuationLevel;
  Volume? volume;
  Volume? boilVolume;
  Method? method;
  Ingredients? ingredients;
  List<String>? foodPairing;
  String? brewersTips;
  String? contributedBy;

  Beer(
      {this.id,
      this.name,
      this.tagline,
      this.firstBrewed,
      this.description,
      this.imageUrl,
      this.abv,
      this.ibu,
      this.targetFg,
      this.targetOg,
      this.ebc,
      this.srm,
      this.ph,
      this.attenuationLevel,
      this.volume,
      this.boilVolume,
      this.method,
      this.ingredients,
      this.foodPairing,
      this.brewersTips,
      this.contributedBy});

  factory Beer.fromJson(Map<String, dynamic> json) => _$BeerFromJson(json);

  Map<String, dynamic> toJson() => _$BeerToJson(this);

  @override
  Map<String, dynamic> data() {
    return toJson();
  }

  @override
  String searchId() {
    return name!;
  }
}
@JsonSerializable(explicitToJson: true)
class Volume {
  double value = 0;
  String unit = "";

  Volume({this.value = 0, this.unit = ""});

  factory Volume.fromJson(Map<String, dynamic> json) => _$VolumeFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeToJson(this);
}
@JsonSerializable(explicitToJson: true)
class Method {
  List<MashTemp>? mashTemp;
  Fermentation? fermentation;
  dynamic twist;

  Method({this.mashTemp, this.fermentation, this.twist});

  factory Method.fromJson(Map<String, dynamic> json) => _$MethodFromJson(json);

  Map<String, dynamic> toJson() => _$MethodToJson(this);
}
@JsonSerializable(explicitToJson: true)
class MashTemp {
  Temp? temp;
  int duration = 0;

  MashTemp({this.temp, this.duration = 0});

  factory MashTemp.fromJson(Map<String, dynamic> json) => _$MashTempFromJson(json);

  Map<String, dynamic> toJson() => _$MashTempToJson(this);
}
@JsonSerializable(explicitToJson: true)
class Temp {
  double value = 0;
  String unit = "";

  Temp({this.value = 0, this.unit = ""});

  factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);

  Map<String, dynamic> toJson() => _$TempToJson(this);
}
@JsonSerializable(explicitToJson: true)
class Fermentation {
  Temp? temp;

  Fermentation({this.temp});

  factory Fermentation.fromJson(Map<String, dynamic> json) => _$FermentationFromJson(json);

  Map<String, dynamic> toJson() => _$FermentationToJson(this);
}
@JsonSerializable(explicitToJson: true)
class Ingredients {
  List<Malt>? malt;
  List<Hops>? hops;
  String? yeast;

  Ingredients({this.malt, this.hops, this.yeast});

  factory Ingredients.fromJson(Map<String, dynamic> json) => _$IngredientsFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientsToJson(this);
}
@JsonSerializable(explicitToJson: true)
class Malt {
  String? name;
  Amount? amount;

  Malt({this.name, this.amount});

  factory Malt.fromJson(Map<String, dynamic> json) => _$MaltFromJson(json);

  Map<String, dynamic> toJson() => _$MaltToJson(this);
}
@JsonSerializable(explicitToJson: true)
class Hops {
  String? name;
  Amount? amount;
  String? add;
  String? attribute;

  Hops({this.name, this.amount, this.add, this.attribute});

  factory Hops.fromJson(Map<String, dynamic> json) => _$HopsFromJson(json);

  Map<String, dynamic> toJson() => _$HopsToJson(this);
}
@JsonSerializable(explicitToJson: true)
class Amount {
  double value = 0;
  String unit = "";

  Amount({this.value = 0, this.unit = ""});

  factory Amount.fromJson(Map<String, dynamic> json) => _$AmountFromJson(json);

  Map<String, dynamic> toJson() => _$AmountToJson(this);
}
