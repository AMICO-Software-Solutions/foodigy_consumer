// To parse this JSON data, do
//
//     final popularChefModelList = popularChefModelListFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

List<PopularChefModelList> popularChefModelListFromJson(String str) => List<PopularChefModelList>.from(json.decode(str).map((x) => PopularChefModelList.fromJson(x)));

String popularChefModelListToJson(List<PopularChefModelList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PopularChefModelList {
    PopularChefModelList({
        this.id,
        this.description,
        this.data,
        this.publishedAt,
        this.createdAt,
        this.updatedAt,
        this.chefimg,
    });

    int? id;
    String? description;
    Data? data;
    DateTime? publishedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<dynamic>? chefimg;

    factory PopularChefModelList.fromJson(Map<String, dynamic> json) => PopularChefModelList(
        id: json["id"],
        description: json["description"],
        data: Data.fromJson(json["data"]),
        publishedAt: DateTime.parse(json["published_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        chefimg: List<dynamic>.from(json["chefimg"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "data": data!.toJson(),
        "published_at": publishedAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "chefimg": List<dynamic>.from(chefimg!.map((x) => x)),
    };
}

class Data {
    Data({
        this.list,
    });

    List<ListElement>? list;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list!.map((x) => x.toJson())),
    };
}

class ListElement {
    ListElement({
        this.name,
        this.image,
        this.searchname,
        this.description,
        this.date,
        this.chefid,
        this.itemid,
        this.chefname,
        this.chefavatar,
    });

    String? name;
    String? image;
    String? searchname;
    String? description;
    String? date;
    int? chefid;
    int? itemid;
    String? chefname;
    String? chefavatar;

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        name: json["name"],
        image: json["image"],
        searchname: json["searchname"] == null ? null : json["searchname"],
        description: json["description"] == null ? null : json["description"],
        date: json["date"] == null ? null : json["date"],
        chefid: json["chefid"] == null ? null : json["chefid"],
        itemid: json["itemid"] == null ? null : json["itemid"],
        chefname: json["chefname"] == null ? null : json["chefname"],
        chefavatar: json["chefavatar"] == null ? null : json["chefavatar"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "searchname": searchname == null ? null : searchname,
        "description": description == null ? null : description,
        "date": date == null ? null : date,
        "chefid": chefid == null ? null : chefid,
        "itemid": itemid == null ? null : itemid,
        "chefname": chefname == null ? null : chefname,
        "chefavatar": chefavatar == null ? null : chefavatar,
    };
}
