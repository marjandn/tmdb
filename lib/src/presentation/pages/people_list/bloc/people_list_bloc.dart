import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/people.dart';
import 'package:tmdb_prj/src/domain/usercases/movie/get_popular_movies.dart';
import 'package:tmdb_prj/src/domain/usercases/people/get_popular_people.dart';

part 'people_list_event.dart';
part 'people_list_state.dart';

class PeopleListBloc extends Bloc<PeopleListEvent, PeopleListState> {
  final GetPopularPeople getPopularPeople;

  PeopleListBloc({required this.getPopularPeople}) : super(PeopleListInitial()) {
    on<PopularPeopleListRequestedEvent>((event, emit) async {
      Either<Failur, List<People>> people =
          await getPopularPeople.call(PagingParam(page: event.page));

      people.fold((left) => emit(const PeopleFetchRequestFailedState()),
          (right) => emit(PeopleFetchRequestSuccessState(people: right)));
    });
  }
}
