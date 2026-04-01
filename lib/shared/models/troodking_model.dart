import 'dart:convert';

List<TroodkingModel> troodkingModelFromJson(String str) => List<TroodkingModel>.from(json.decode(str).map((x) => TroodkingModel.fromJson(x)));

String troodkingModelToJson(List<TroodkingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TroodkingModel {
    final String? categorieName;
    final String? categorieIcon;
    final List<CategorieItem>? categorieItems;

    TroodkingModel({
        this.categorieName,
        this.categorieIcon,
        this.categorieItems,
    });

    factory TroodkingModel.fromJson(Map<String, dynamic> json) => TroodkingModel(
        categorieName: json["categorieName"],
        categorieIcon: json["CategorieIcon"],
        categorieItems: json["categorieItems"] == null ? [] : List<CategorieItem>.from(json["categorieItems"]!.map((x) => CategorieItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categorieName": categorieName,
        "CategorieIcon": categorieIcon,
        "categorieItems": categorieItems == null ? [] : List<dynamic>.from(categorieItems!.map((x) => x.toJson())),
    };
}

class CategorieItem {
    final String? nameItem;
    final double? priceItem;
    final String? grams;
    final Macros? macros;

    CategorieItem({
        this.nameItem,
        this.priceItem,
        this.grams,
        this.macros,
    });

    factory CategorieItem.fromJson(Map<String, dynamic> json) => CategorieItem(
        nameItem: json["nameItem"],
        priceItem: json["priceItem"]?.toDouble(),
        grams: json["grams"],
        macros: json["macros"] == null ? null : Macros.fromJson(json["macros"]),
    );

    Map<String, dynamic> toJson() => {
        "nameItem": nameItem,
        "priceItem": priceItem,
        "grams": grams,
        "macros": macros?.toJson(),
    };
}

class Macros {
    Macros();

    factory Macros.fromJson(Map<String, dynamic> json) => Macros(
    );

    Map<String, dynamic> toJson() => {
    };
}
