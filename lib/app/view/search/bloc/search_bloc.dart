import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_app/app/model/pokemon_model.dart';
import 'package:pokemon_app/app/service/api_repository.dart';
import 'package:pokemon_app/app/util/failure.dart';
import 'package:pokemon_app/app/util/functions.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final apiRepository = ApiRepository();
  SearchBloc() : super(SearchInitial());
  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is GetSearchEvent) {
      yield* handleSearchEvent(event);
    }
  }

  Stream<SearchState> handleSearchEvent(SearchEvent event) async* {
    yield GetSearchLoading();
    if (!await Functions.getNetworkStatus()) {
      yield GetSearchFailed(NetworkException());
    } else {
      try {
        List<PokemonModel> pokemonList = await apiRepository.getPokemonList();
        print(pokemonList);
        yield GetSearchSuccess(pokemonList: pokemonList, searchList: []);
      } on Failure catch (failure) {
        yield GetSearchFailed(failure);
      } catch (error) {
        Failure failure = NoException();
        yield GetSearchFailed(failure);
      }
    }
  }
}
