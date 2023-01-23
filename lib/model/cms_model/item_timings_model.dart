// To parse this JSON data, do
//
//     final itemTimingsModel = itemTimingsModelFromJson(jsonString);

import 'dart:convert';

List<ItemTimingsModel> itemTimingsModelFromJson(String str) => List<ItemTimingsModel>.from(json.decode(str).map((x) => ItemTimingsModel.fromJson(x)));

String itemTimingsModelToJson(List<ItemTimingsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemTimingsModel {
    ItemTimingsModel({
        this.id,
        this.tagname,
        this.tagdetails,
        this.publishedAt,
        this.createdAt,
        this.updatedAt,
        this.tagimage,
    });

    int? id;
    String? tagname;
    dynamic tagdetails;
    DateTime? publishedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<Tagimage>? tagimage;

    factory ItemTimingsModel.fromJson(Map<String, dynamic> json) => ItemTimingsModel(
        id: json["id"],
        tagname: json["tagname"],
        tagdetails: json["tagdetails"],
        publishedAt: DateTime.parse(json["published_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        tagimage: List<Tagimage>.from(json["tagimage"].map((x) => Tagimage.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tagname": tagname,
        "tagdetails": tagdetails,
        "published_at": publishedAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "tagimage": List<dynamic>.from(tagimage!.map((x) => x.toJson())),
    };
}

class Tagimage {
    Tagimage({
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
    dynamic alternativeText;
    dynamic caption;
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

    factory Tagimage.fromJson(Map<String, dynamic> json) => Tagimage(
        id: json["id"],
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats: Formats.fromJson(json["formats"]),
        hash: json["hash"],
        ext: extValues.map[json["ext"]],
        mime: mimeValues.map[json["mime"]],
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

enum Ext { JPG }

final extValues = EnumValues({
    ".jpg": Ext.JPG
});

class Formats {
    Formats({
        this.thumbnail,
        this.large,
        this.small,
        this.medium,
    });

    Thumbnail? thumbnail;
    Thumbnail? large;
    Thumbnail? small;
    Thumbnail? medium;

    factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        large: json["large"] == null ? null : Thumbnail.fromJson(json["large"]),
        small: json["small"] == null ? null : Thumbnail.fromJson(json["small"]),
        medium: json["medium"] == null ? null : Thumbnail.fromJson(json["medium"]),
    );

    Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail!.toJson(),
        "large": large == null ? null : large!.toJson(),
        "small": small == null ? null : small!.toJson(),
        "medium": medium == null ? null : medium!.toJson(),
    };
}

class Thumbnail {
    Thumbnail({
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

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        ext: extValues.map[json["ext"]],
        url: json["url"],
        hash: json["hash"],
        mime: mimeValues.map[json["mime"]],
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

enum Mime { IMAGE_JPEG }

final mimeValues = EnumValues({
    "image/jpeg": Mime.IMAGE_JPEG
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}
