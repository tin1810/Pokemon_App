import 'package:pokemon_app/app/model/pokemon_model.dart';
import 'package:pokemon_app/app/service/api_client.dart';

class ApiRepository {
  final ApiClient apiClient = ApiClient();

  Future<List<PokemonModel>> getPokemonList() async {
    return await apiClient.getPokemonList();
  }
}
