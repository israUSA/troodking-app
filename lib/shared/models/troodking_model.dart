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

  
  @Backlink('troodkingModel')
  final categorieItems = ToMany<CategorieItem>();

  List<CategorieItem>? get categories => categorieItems;
  set categories(List<CategorieItem>? d){
    categorieItems.clear();
    if (d != null) categorieItems.addAll(d);
  }


  TroodkingModel();


  factory TroodkingModel.fromJson(Map<String, dynamic> json) {
    final instance = TroodkingModel();

    instance.categorieIcon = json["CategorieIcon"];
    instance.categorieName = json["categorieName"];

    if (json["categorieItems"] != null) {
      instance.categories!.addAll(
        List<CategorieItem>.from(json["categorieItems"].map((x) => CategorieItem.fromJson(x)))
      );
    }
    return instance;
  }

  Map<String, dynamic> toJson() => {
    "categorieName": categorieName,
    "CategorieIcon": categorieIcon,
    "categorieItems": categories!.map((x) => x.toJson()).toList(),
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
