import 'dart:convert';

class PageInfoModel {
  final int pages;
  final String next;

  PageInfoModel({
    required this.pages,
    required this.next,
  });

  Map<String, dynamic> toMap() {
    return {
      'pages': pages,
      'next': next,
    };
  }

  factory PageInfoModel.fromMap(Map<String, dynamic> map) {
    return PageInfoModel(
      pages: map['pages']?.toInt() ?? 0,
      next: map['next'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PageInfoModel.fromJson(String source) =>
      PageInfoModel.fromMap(json.decode(source));
}
