// To parse this JSON data, do
//
//     final trendyolApiDeneme = trendyolApiDenemeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TrendyolApiDeneme trendyolApiDenemeFromJson(String str) => TrendyolApiDeneme.fromJson(json.decode(str));

String trendyolApiDenemeToJson(TrendyolApiDeneme data) => json.encode(data.toJson());

class TrendyolApiDeneme {
    List<Ingredient> ingredients;
    List<ModifierGroup> modifierGroups;
    List<Product> products;
    List<Section> sections;

    TrendyolApiDeneme({
        required this.ingredients,
        required this.modifierGroups,
        required this.products,
        required this.sections,
    });

    factory TrendyolApiDeneme.fromJson(Map<String, dynamic> json) => TrendyolApiDeneme(
        ingredients: List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromJson(x))),
        modifierGroups: List<ModifierGroup>.from(json["modifierGroups"].map((x) => ModifierGroup.fromJson(x))),
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        sections: List<Section>.from(json["sections"].map((x) => Section.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "modifierGroups": List<dynamic>.from(modifierGroups.map((x) => x.toJson())),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "sections": List<dynamic>.from(sections.map((x) => x.toJson())),
    };
}

class Ingredient {
    int id;
    String name;
    int price;
    String status;

    Ingredient({
        required this.id,
        required this.name,
        required this.price,
        required this.status,
    });

    factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "status": status,
    };
}

class ModifierGroup {
    int id;
    int max;
    int min;
    List<ModifierProduct> modifierProducts;
    String name;

    ModifierGroup({
        required this.id,
        required this.max,
        required this.min,
        required this.modifierProducts,
        required this.name,
    });

    factory ModifierGroup.fromJson(Map<String, dynamic> json) => ModifierGroup(
        id: json["id"],
        max: json["max"],
        min: json["min"],
        modifierProducts: List<ModifierProduct>.from(json["modifierProducts"].map((x) => ModifierProduct.fromJson(x))),
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "max": max,
        "min": min,
        "modifierProducts": List<dynamic>.from(modifierProducts.map((x) => x.toJson())),
        "name": name,
    };
}

class ModifierProduct {
    int id;
    int position;
    int price;

    ModifierProduct({
        required this.id,
        required this.position,
        required this.price,
    });

    factory ModifierProduct.fromJson(Map<String, dynamic> json) => ModifierProduct(
        id: json["id"],
        position: json["position"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "position": position,
        "price": price,
    };
}

class Product {
    int id;
    String description;
    List<int> ingredients;
    List<int> extraIngredients;
    List<ProductElement> modifierGroups;
    String name;
    int originalPrice;
    int sellingPrice;
    String status;

    Product({
        required this.id,
        required this.description,
        required this.ingredients,
        required this.extraIngredients,
        required this.modifierGroups,
        required this.name,
        required this.originalPrice,
        required this.sellingPrice,
        required this.status,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        description: json["description"],
        ingredients: List<int>.from(json["ingredients"].map((x) => x)),
        extraIngredients: List<int>.from(json["extraIngredients"].map((x) => x)),
        modifierGroups: List<ProductElement>.from(json["modifierGroups"].map((x) => ProductElement.fromJson(x))),
        name: json["name"],
        originalPrice: json["originalPrice"],
        sellingPrice: json["sellingPrice"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
        "extraIngredients": List<dynamic>.from(extraIngredients.map((x) => x)),
        "modifierGroups": List<dynamic>.from(modifierGroups.map((x) => x.toJson())),
        "name": name,
        "originalPrice": originalPrice,
        "sellingPrice": sellingPrice,
        "status": status,
    };
}

class ProductElement {
    int id;
    int position;

    ProductElement({
        required this.id,
        required this.position,
    });

    factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        id: json["id"],
        position: json["position"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "position": position,
    };
}

class Section {
    int id;
    String name;
    int position;
    List<ProductElement> products;
    String status;

    Section({
        required this.id,
        required this.name,
        required this.position,
        required this.products,
        required this.status,
    });

    factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        name: json["name"],
        position: json["position"],
        products: List<ProductElement>.from(json["products"].map((x) => ProductElement.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "position": position,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "status": status,
    };
}
