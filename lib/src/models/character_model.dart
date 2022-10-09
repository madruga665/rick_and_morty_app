class CharacterModel {
  final int id;
  final String name;
  final String image;

  CharacterModel(this.id, this.name, this.image);

  CharacterModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
}
