part of 'parent_nav.bloc.dart';

sealed class ParentNavEvent extends Equatable {
  const ParentNavEvent();

  @override
  List<Object> get props => [];
}

final class ParentTabSelected extends ParentNavEvent {
  const ParentTabSelected(this.tab);

  final ParentTab tab;

  @override
  List<Object> get props => [tab];
}
