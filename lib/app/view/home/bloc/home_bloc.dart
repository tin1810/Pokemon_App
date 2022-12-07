import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pokemon_app/app/model/pokemon_model.dart';
import 'package:pokemon_app/app/service/api_repository.dart';
import 'package:pokemon_app/app/util/failure.dart';
import 'package:pokemon_app/app/util/functions.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final apiRepository = ApiRepository();
  HomeBloc() : super(HomeInitial());
  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetHomeEvent) {
      yield* handleHomeEvent(event);
    }
  }

  Stream<HomeState> handleHomeEvent(GetHomeEvent event) async* {
    yield GetHomeLoading();
    if (!await Functions.getNetworkStatus()) {
      yield GetHomeFailed(NetworkException());
    } else {
      try {
        List<PokemonModel> pokemonList = await apiRepository.getPokemonList();
        print(pokemonList);
        yield GetHomeSuccess(pokemonList: pokemonList);
      } on Failure catch (failure) {
        yield GetHomeFailed(failure);
      } catch (error) {
        Failure failure = NoException();
        yield GetHomeFailed(failure);
      }
    }
  }
}
