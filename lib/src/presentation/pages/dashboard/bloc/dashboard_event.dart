part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object?> get props => [];
}

class BottomNavigationItemSelect extends DashboardEvent {
  final int itemIndex;

  const BottomNavigationItemSelect({required this.itemIndex});

  @override
  List<Object?> get props => [itemIndex];
}
