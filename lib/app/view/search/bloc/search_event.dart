part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetSearchEvent extends SearchEvent {
  const GetSearchEvent();
}
