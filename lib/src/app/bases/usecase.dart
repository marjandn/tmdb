import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

import '../errors/failure.dart';

abstract class UseCase<T, P> {
  Future<Either<Failur, T>> call(P params);
}

class NoParam extends Equatable {
  const NoParam();

  @override
  List<Object> get props => [];
}
