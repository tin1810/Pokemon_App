// ignore_for_file: prefer_const_constructors_in_immutables, annotate_overrides

part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

abstract class FailureState extends HomeState {
  late final Failure failure;
  FailureState(this.failure);

  @override
  List<Object> get props => [failure];
}

class HomeInitial extends HomeState {}

class GetHomeLoading extends HomeState {}

class GetHomeSuccess extends HomeState {
  final List<PokemonModel> pokemonList;
  GetHomeSuccess({required this.pokemonList});
  List<Object> get props => [pokemonList];
}

class GetHomeFailed extends FailureState {
  GetHomeFailed(Failure failure) : super(failure);
}
