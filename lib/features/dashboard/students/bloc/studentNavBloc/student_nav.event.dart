part of 'student_nav.bloc.dart';

sealed class StudentNavEvent extends Equatable {
  const StudentNavEvent();

  @override
  List<Object> get props => [];
}

final class StudentTabSelection extends StudentNavEvent {
  const StudentTabSelection(this.tab);

  final StudentTab tab;

  @override
  List<Object> get props =>   [tab];

}
