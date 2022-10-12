part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeSelectedState extends DashboardState {}

class GeneresSelectedState extends DashboardState {}

class SearchSelectedState extends DashboardState {}
