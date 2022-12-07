import 'package:dio/dio.dart';
import 'package:pokemon_app/app/model/pokemon_model.dart';
import 'package:pokemon_app/app/util/constant.dart';
import 'package:pokemon_app/app/util/failure.dart';

class ApiClient {
  final _dio = Dio();
  ApiClient() {
    _dio.options.baseUrl = Constants.BaseUrl;
    _dio.options.connectTimeout = 20000;
    _dio.options.receiveTimeout = 20000;
    _dio.options.sendTimeout = 20000;
    _dio.options.headers['Content-Type'] = 'text/plain';
  }
  Future<List<PokemonModel>> getPokemonList() async {
    try {
      final response = await _dio.get(Constants.BaseUrl);
      print(response);
      final pokemonList = response.data as List;
      print(pokemonList);
      return pokemonList.map((item) => PokemonModel.fromJson(item)).toList();
    } on DioError catch (e) {
      print(e.response);
      throw BottomPlacedException(code: e.response?.data?['data'] ?? e.message);
    } catch (e) {
      print(e);
      throw UnimplementedError("Something went wrong");
    }
  }
}
