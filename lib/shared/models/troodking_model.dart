import 'dart:convert';
import 'package:objectbox/objectbox.dart';


List<TroodkingModel> listTroodkingModelFromJson(String str) => List<TroodkingModel>.from(json.decode(str).map((x) => TroodkingModel.fromJson(x)));
TroodkingModel troodkingModelFromJson(String str) => TroodkingModel.fromJson(json.decode(str));


String troodkingModelToJson(List<TroodkingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));



@Entity()
class TroodkingModel {
  @Id()
  int id = 0;

  String? categorieName;
  String? categorieIcon;

  // En ObjectBox, las relaciones se definen con ToMany
  final categorieItems = ToMany<CategorieItem>();

  TroodkingModel({
    this.id = 0,
    this.categorieName,
    this.categorieIcon,
  });

  factory TroodkingModel.fromJson(Map<String, dynamic> json) {
    final model = TroodkingModel(
      categorieName: json["categorieName"],
      categorieIcon: json["CategorieIcon"],
    );
    if (json["categorieItems"] != null) {
      model.categorieItems.addAll(
        List<CategorieItem>.from(json["categorieItems"].map((x) => CategorieItem.fromJson(x)))
      );
    }
    return model;
  }

  Map<String, dynamic> toJson() => {
    "categorieName": categorieName,
    "CategorieIcon": categorieIcon,
    "categorieItems": categorieItems.map((x) => x.toJson()).toList(),
  };
}

@Entity()
class CategorieItem {
  @Id()
  int id = 0;

  String? nameItem;
  double? priceItem;
  String? grams;

  final macros = ToOne<Macros>();
  final troodkingModel = ToOne<TroodkingModel>();

  CategorieItem({
    this.id = 0,
    this.nameItem,
    this.priceItem,
    this.grams,
  });

  factory CategorieItem.fromJson(Map<String, dynamic> json) {
    final item = CategorieItem(
      nameItem: json["nameItem"],
      priceItem: json["priceItem"]?.toDouble(),
      grams: json["grams"],
    );
    if (json["macros"] != null) {
      item.macros.target = Macros.fromJson(json["macros"]);
    }
    return item;
  }

  Map<String, dynamic> toJson() => {
    "nameItem": nameItem,
    "priceItem": priceItem,
    "grams": grams,
    "macros": macros.target?.toJson(),
  };
}

@Entity()
class Macros {
  @Id()
  int id = 0;

  double? calories;
  double? protein;

  Macros({this.id = 0, this.calories, this.protein});

  factory Macros.fromJson(Map<String, dynamic> json) => Macros(
    calories: json["calories"]?.toDouble(),
    protein: json["protein"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "calories": calories,
    "protein": protein,
  };
}
