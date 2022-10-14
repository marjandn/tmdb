import 'package:equatable/equatable.dart';

abstract class Failur extends Equatable {
  const Failur();

  @override
  List<Object> get props => [];
}

class ServerFailuer extends Failur {
  final String errorMessage;

  const ServerFailuer([this.errorMessage = ""]);

  @override
  List<Object> get props => [errorMessage];
}
