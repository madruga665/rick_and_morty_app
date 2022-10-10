import 'dart:convert';

class CharacterModel {
  final int id;
  final String name;
  final String image;

  CharacterModel(this.id, this.name, this.image);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      map['id']?.toInt() ?? 0,
      map['name'] ?? '',
      map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromJson(String source) =>
      CharacterModel.fromMap(json.decode(source));
}
