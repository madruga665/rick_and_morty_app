import 'dart:convert';

class CharacterModel {
  final int id;
  final String name;
  final String image;
  final String status;
  final String species;

  CharacterModel(this.id, this.name, this.image, this.status, this.species);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'status': status,
      'species': species
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      map['id']?.toInt() ?? 0,
      map['name'] ?? '',
      map['image'] ?? '',
      map['status'] ?? '',
      map['species'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromJson(String source) =>
      CharacterModel.fromMap(json.decode(source));
}
