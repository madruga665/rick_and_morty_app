import 'dart:convert';

import 'package:rick_and_morty_app/src/models/character_model.dart';
import 'package:rick_and_morty_app/src/models/page_info_model.dart';

class GetAllRequestModel {
  final List<CharacterModel> characterList;
  final PageInfoModel pageInfo;

  GetAllRequestModel(this.characterList, this.pageInfo);

  Map<String, dynamic> toMap() {
    return {
      'characterList': characterList.map((x) => x.toMap()).toList(),
      'pageInfo': pageInfo.toMap(),
    };
  }

  factory GetAllRequestModel.fromMap(Map<String, dynamic> map) {
    return GetAllRequestModel(
      List<CharacterModel>.from(
          map['characterList']?.map((x) => CharacterModel.fromMap(x))),
      PageInfoModel.fromMap(map['pageInfo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetAllRequestModel.fromJson(String source) =>
      GetAllRequestModel.fromMap(json.decode(source));
}
