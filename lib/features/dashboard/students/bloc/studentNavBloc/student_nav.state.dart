part of 'student_nav.bloc.dart';

 class StudentNavState extends Equatable {
  const StudentNavState({this.tab = StudentTab.home});

  final StudentTab tab;

  bool get isHome => tab == StudentTab.home;


  @override
  List<Object> get props => [tab];
}

