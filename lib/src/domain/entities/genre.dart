import 'package:equatable/equatable.dart';

class Genre extends Equatable {
  final int? id;

  const Genre({required this.id});

  @override
  List<Object?> get props => [id];
}
