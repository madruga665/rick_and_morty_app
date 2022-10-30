import 'package:rick_and_morty_app/src/models/get_all_request_model.dart';

abstract class CharacterRepository {
  Future<GetAllRequestModel> getAll();
  Future<GetAllRequestModel> getNextPage(String nextPageUrl);
}
