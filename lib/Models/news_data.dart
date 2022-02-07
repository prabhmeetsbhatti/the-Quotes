import 'dart:convert';

import 'package:two_sides_app/Utils/null_checker.dart';

List<NewsData> newsDataFromJson(String str) =>
    List<NewsData>.from(json.decode(str).map((x) => NewsData.fromJson(x)));

String newsDataToJson(List<NewsData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsData {
  NewsData({
    this.title1,
    this.title2,
    this.media1Date,
    this.media2Date,
    this.media1Name,
    this.media2Name,
    this.media1Text,
    this.media2Text,
    this.reference1,
    this.reference2,
    this.shortDescription,
    this.category,
    this.featured,
    this.images,
    this.media1Logo,
    this.media2Logo,
  });

  String? title1;
  String? title2;
  String? media1Date;
  String? media2Date;
  String? media1Name;
  String? media2Name;
  String? media1Text;
  String? media2Text;
  String? reference1;
  String? reference2;
  String? shortDescription;
  String? category;
  bool? featured = false;
  Images? images;
  MediaLogo? media1Logo;
  MediaLogo? media2Logo;

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
        title1: json["title1"],
        title2: json["title2"],
        media1Date: json["media1_date"],
        media2Date: json["media2_date"],
        media1Name: json["media1_name"],
        media2Name: json["media2_name"],
        media1Text: json["Media1_text"],
        media2Text: json["Media2_text"],
        reference1: json["reference1"],
        reference2: NullChecker.check(json["reference2"]) != null
            ? json["reference2"]
            : null,
        shortDescription: json["short_description"] ?? '',
        category: json["category"],
        featured: json["Featured"] ?? false,
        images: Images.fromJson(json["image"]),
        media1Logo: MediaLogo.fromJson(json["media1_logo"]),
        media2Logo: MediaLogo.fromJson(json["media_2_logo"]),
      );

  Map<String, dynamic> toJson() => {
        "title1": title1,
        "title2": title2,
        "media1_date": media1Date,
        "media2_date": media2Date,
        "media1_name": media1Name,
        "media2_name": media2Name,
        "Media1_text": media1Text,
        "Media2_text": media2Text,
        "reference1": reference1,
        "reference2": reference2,
        "short_description": shortDescription,
        "category": category,
        "Featured": featured,
        "image": images?.toJson(),
        "media1_logo": media1Logo?.toJson(),
        "media_2_logo": media2Logo?.toJson(),
      };
}

class Images {
  Images({
    required this.id,
    required this.name,
    required this.alternativeText,
    required this.caption,
    required this.width,
    required this.height,
    required this.formats,
  });

  int id;
  String name;
  String alternativeText;
  String caption;
  int width;
  int height;
  Formats formats;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        id: json["id"],
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats: Formats.fromJson(json["formats"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats.toJson(),
      };
}

class Formats {
  Formats({
    required this.thumbnail,
  });

  Thumbnail thumbnail;

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: Thumbnail.fromJson(json["medium"] ?? json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "medium": thumbnail.toJson(),
      };
}

class Thumbnail {
  Thumbnail({
    required this.name,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.width,
    required this.height,
    required this.size,
    required this.path,
    required this.url,
    required this.providerMetadata,
  });

  String name;
  String hash;
  String ext;
  String mime;
  int width;
  int height;
  double size;
  dynamic path;
  String url;
  ProviderMetadata providerMetadata;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        name: json["name"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        width: json["width"],
        height: json["height"],
        size: json["size"].toDouble(),
        path: json["path"],
        url: json["url"],
        providerMetadata: ProviderMetadata.fromJson(json["provider_metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "width": width,
        "height": height,
        "size": size,
        "path": path,
        "url": url,
        "provider_metadata": providerMetadata.toJson(),
      };
}

class ProviderMetadata {
  ProviderMetadata({
    required this.publicId,
    required this.resourceType,
  });

  String publicId;
  String resourceType;

  factory ProviderMetadata.fromJson(Map<String, dynamic> json) =>
      ProviderMetadata(
        publicId: json["public_id"],
        resourceType: json["resource_type"],
      );

  Map<String, dynamic> toJson() => {
        "public_id": publicId,
        "resource_type": resourceType,
      };
}

class MediaLogo {
  MediaLogo({
    required this.name,
    required this.formats,
  });

  String name;
  Formats formats;

  factory MediaLogo.fromJson(Map<String, dynamic> json) => MediaLogo(
        name: json["name"],
        formats: Formats.fromJson(json["formats"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "formats": formats.toJson(),
      };
}
