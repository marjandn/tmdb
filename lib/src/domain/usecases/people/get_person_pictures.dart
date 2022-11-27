import 'package:either_dart/either.dart';

import '../../../app/bases/usecase.dart';
import '../../../app/errors/failure.dart';
import '../../../data/providers/remote/params/details_param.dart';
import '../../repositories/people_repository.dart';

class GetPersonPictures extends UseCase<List<String>, PersonDetailsParam> {
  final PeopleRepository peopleRepository;

  GetPersonPictures({required this.peopleRepository});

  @override
  Future<Either<Failur, List<String>>> call(PersonDetailsParam params) async =>
      await peopleRepository.getPersonPictures(param: params);
}
