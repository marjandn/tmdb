import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/data/providers/remote/params/details_param.dart';

import '../../../app/errors/failure.dart';
import '../../entities/people.dart';
import '../../repositories/people_repository.dart';

class GetPersonDetails {
  final PeopleRepository peopleRepository;

  GetPersonDetails({required this.peopleRepository});

  Future<Either<Failur, People>> call(int personID) async =>
      await peopleRepository.getPersonDetails(param: PersonDetailsParam(personId: personID));
}
