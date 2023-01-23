// To parse this JSON data, do
//
//     final onboadingScreenModel = onboadingScreenModelFromJson(jsonString);

import 'dart:convert';

List<OnboadingScreenModel> onboadingScreenModelFromJson(String str) => List<OnboadingScreenModel>.from(json.decode(str).map((x) => OnboadingScreenModel.fromJson(x)));

String onboadingScreenModelToJson(List<OnboadingScreenModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OnboadingScreenModel {
    OnboadingScreenModel({
        this.id,
        this.title,
        this.description,
        this.publishedAt,
        this.createdAt,
        this.updatedAt,
        this.image,
        this.backgroundimage,
    });

    int? id;
    String? title;
    String? description;
    DateTime? publishedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<Image>? image;
    List<Image>? backgroundimage;

    factory OnboadingScreenModel.fromJson(Map<String, dynamic> json) => OnboadingScreenModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        publishedAt: DateTime.parse(json["published_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
        backgroundimage: List<Image>.from(json["backgroundimage"].map((x) => Image.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "published_at": publishedAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "image": List<dynamic>.from(image!.map((x) => x.toJson())),
        "backgroundimage": List<dynamic>.from(backgroundimage!.map((x) => x.toJson())),
    };
}

class Image {
    Image({
        this.id,
        this.name,
        this.alternativeText,
        this.caption,
        this.width,
        this.height,
        this.formats,
        this.hash,
        this.ext,
        this.mime,
        this.size,
        this.url,
        this.previewUrl,
        this.provider,
        this.providerMetadata,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? name;
    String? alternativeText;
    String? caption;
    int? width;
    int? height;
    Formats? formats;
    String? hash;
    Ext? ext;
    Mime? mime;
    double? size;
    String? url;
    dynamic previewUrl;
    String? provider;
    dynamic providerMetadata;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats: Formats.fromJson(json["formats"]),
        hash: json["hash"],
        ext: extValues.map![json["ext"]],
        mime: mimeValues.map![json["mime"]],
        size: json["size"].toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats!.toJson(),
        "hash": hash,
        "ext": extValues.reverse[ext],
        "mime": mimeValues.reverse[mime],
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}

enum Ext { PNG }

final extValues = EnumValues({
    ".png": Ext.PNG
});

class Formats {
    Formats({
        this.small,
        this.thumbnail,
    });

    Small? small;
    Small? thumbnail;

    factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        small: Small.fromJson(json["small"]),
        thumbnail: Small.fromJson(json["thumbnail"]),
    );

    Map<String, dynamic> toJson() => {
        "small": small!.toJson(),
        "thumbnail": thumbnail!.toJson(),
    };
}

class Small {
    Small({
        this.ext,
        this.url,
        this.hash,
        this.mime,
        this.name,
        this.path,
        this.size,
        this.width,
        this.height,
    });

    Ext? ext;
    String? url;
    String? hash;
    Mime? mime;
    String? name;
    dynamic path;
    double? size;
    int? width;
    int? height;

    factory Small.fromJson(Map<String, dynamic> json) => Small(
        ext: extValues.map![json["ext"]],
        url: json["url"],
        hash: json["hash"],
        mime: mimeValues.map![json["mime"]],
        name: json["name"],
        path: json["path"],
        size: json["size"].toDouble(),
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "ext": extValues.reverse[ext],
        "url": url,
        "hash": hash,
        "mime": mimeValues.reverse[mime],
        "name": name,
        "path": path,
        "size": size,
        "width": width,
        "height": height,
    };
}

enum Mime { IMAGE_PNG }

final mimeValues = EnumValues({
    "image/png": Mime.IMAGE_PNG
});

class EnumValues<T> {
    Map<String, T>? map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap ??= map!.map((k, v) => MapEntry(v, k));
        return reverseMap!;
    }
}
