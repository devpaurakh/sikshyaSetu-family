import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:school360/core/constant/enums.constant.dart';

part 'student_nav.event.dart';
part 'student_nav.state.dart';

class StudentNavBloc extends Bloc<StudentNavEvent, StudentNavState> {
  StudentNavBloc() : super(const StudentNavState()) {
    on<StudentTabSelection>((event, emit) {
      emit(StudentNavState(tab: event.tab));
    });
  }
}
