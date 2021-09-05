class WallpaperModel {
  String? name;
  String? url;
  int? id;
  SrcModel? src;

  WallpaperModel({this.id, this.url, this.name, this.src});

  WallpaperModel.fromMap(Map<dynamic, dynamic> jsonData) {
    src = SrcModel.fromMap(jsonData["src"]);
    id = jsonData["photographer_id"];
    url = jsonData["photographer_url"];
    name = jsonData["photographer"];
  }
}

class SrcModel {
  String? original;
  String? small;
  String? portrait;

  SrcModel({this.original, this.portrait, this.small});

  SrcModel.fromMap(Map<dynamic, dynamic> map) {
    original = map["original"];
    small = map["small"];
    portrait = map["portrait"];
  }
}
