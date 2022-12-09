part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

abstract class FailureState extends SearchState {
  late final Failure failure;
  FailureState(this.failure);

  @override
  List<Object> get props => [failure];
}

class SearchInitial extends SearchState {}

class GetSearchLoading extends SearchState {}

class GetSearchSuccess extends SearchState {
  final List<String> searchList;
  final List<PokemonModel> pokemonList;
  GetSearchSuccess({required this.pokemonList, required this.searchList});
  List<Object> get props => [pokemonList, searchList];
}

class GetSearchFailed extends FailureState {
  GetSearchFailed(Failure failure) : super(failure);
}
