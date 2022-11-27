import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/data/providers/remote/params/details_param.dart';

import '../../../app/bases/usecase.dart';
import '../../../app/errors/failure.dart';
import '../../entities/people.dart';
import '../../repositories/people_repository.dart';

class GetPersonDetails extends UseCase<People, PersonDetailsParam> {
  final PeopleRepository peopleRepository;

  GetPersonDetails({required this.peopleRepository});

  @override
  Future<Either<Failur, People>> call(PersonDetailsParam params) async =>
      await peopleRepository.getPersonDetails(param: params);
}
