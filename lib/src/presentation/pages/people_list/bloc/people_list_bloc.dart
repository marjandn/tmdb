import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/people.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_popular_movies.dart';
import 'package:tmdb_prj/src/domain/usecases/people/get_popular_people.dart';

part 'people_list_event.dart';
part 'people_list_state.dart';

class PeopleListBloc extends Bloc<PeopleListEvent, PeopleListState> {
  final GetPopularPeople getPopularPeople;

  int _totalPage = 1;
  int _currentPage = 0;

  dispose() {
    _totalPage = 1;
    _currentPage = 0;
  }

  PeopleListBloc({required this.getPopularPeople}) : super(PeopleListInitial()) {
    on<PopularPeopleListRequestedEvent>((event, emit) async {
      if (!_showLazyLoading()) return;

      Either<Failur, List<People>> people =
          await getPopularPeople.call(PagingParam(page: ++_currentPage));

      people.fold((left) => emit(const PeopleFetchRequestFailedState()), (right) {
        _totalPage = right.first.totalPages ?? 1;

        emit(PeopleFetchRequestSuccessState(people: right, showLazyLoading: _showLazyLoading()));
      });
    });
  }

  bool _showLazyLoading() => _currentPage < _totalPage;
}
