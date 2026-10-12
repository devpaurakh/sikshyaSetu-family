part of 'parent_nav.bloc.dart';

final class ParentNavState extends Equatable {
  const ParentNavState({this.tab = ParentTab.home});

  final ParentTab tab;

  bool get isHome => tab == ParentTab.home;

  @override
  List<Object> get props => [tab];
}
