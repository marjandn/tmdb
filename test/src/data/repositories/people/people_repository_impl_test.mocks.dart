// Mocks generated by Mockito 5.3.2 from annotations
// in tmdb_prj/test/src/data/repositories/people/people_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:tmdb_prj/src/data/models/people_response.dart' as _i2;
import 'package:tmdb_prj/src/data/models/person_pictures_response.dart' as _i3;
import 'package:tmdb_prj/src/data/providers/remote/params/details_param.dart'
    as _i8;
import 'package:tmdb_prj/src/data/providers/remote/service/people_remote_datasource.dart'
    as _i4;
import 'package:tmdb_prj/src/domain/usecases/movie/get_popular_movies.dart'
    as _i6;
import 'package:tmdb_prj/src/domain/usecases/movie/search_movie.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePeopleResponse_0 extends _i1.SmartFake
    implements _i2.PeopleResponse {
  _FakePeopleResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePersonRespone_1 extends _i1.SmartFake implements _i2.PersonRespone {
  _FakePersonRespone_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePersonPicturesResponnse_2 extends _i1.SmartFake
    implements _i3.PersonPicturesResponnse {
  _FakePersonPicturesResponnse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PeopleRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPeopleRemoteDataSource extends _i1.Mock
    implements _i4.PeopleRemoteDataSource {
  MockPeopleRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.PeopleResponse> getPopularPeople(
          {required _i6.PagingParam? pagingParam}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularPeople,
          [],
          {#pagingParam: pagingParam},
        ),
        returnValue: _i5.Future<_i2.PeopleResponse>.value(_FakePeopleResponse_0(
          this,
          Invocation.method(
            #getPopularPeople,
            [],
            {#pagingParam: pagingParam},
          ),
        )),
      ) as _i5.Future<_i2.PeopleResponse>);
  @override
  _i5.Future<_i2.PeopleResponse> searchPeople(
          {required _i7.SearchParams? params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchPeople,
          [],
          {#params: params},
        ),
        returnValue: _i5.Future<_i2.PeopleResponse>.value(_FakePeopleResponse_0(
          this,
          Invocation.method(
            #searchPeople,
            [],
            {#params: params},
          ),
        )),
      ) as _i5.Future<_i2.PeopleResponse>);
  @override
  _i5.Future<_i2.PersonRespone> getPersonDetails(
          {required _i8.PersonDetailsParam? param}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPersonDetails,
          [],
          {#param: param},
        ),
        returnValue: _i5.Future<_i2.PersonRespone>.value(_FakePersonRespone_1(
          this,
          Invocation.method(
            #getPersonDetails,
            [],
            {#param: param},
          ),
        )),
      ) as _i5.Future<_i2.PersonRespone>);
  @override
  _i5.Future<_i3.PersonPicturesResponnse> getPersonPictures(
          {required _i8.PersonDetailsParam? param}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPersonPictures,
          [],
          {#param: param},
        ),
        returnValue: _i5.Future<_i3.PersonPicturesResponnse>.value(
            _FakePersonPicturesResponnse_2(
          this,
          Invocation.method(
            #getPersonPictures,
            [],
            {#param: param},
          ),
        )),
      ) as _i5.Future<_i3.PersonPicturesResponnse>);
}
