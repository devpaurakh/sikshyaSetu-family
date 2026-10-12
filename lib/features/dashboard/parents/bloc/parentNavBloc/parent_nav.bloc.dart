import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:school360/core/constant/enums.constant.dart';

part 'parent_nav.event.dart';
part 'parent_nav.state.dart';

class ParentNavBloc extends Bloc<ParentNavEvent, ParentNavState> {
  ParentNavBloc() : super(ParentNavState()) {
    on<ParentTabSelected>((event, emit) {
      emit(ParentNavState(tab: event.tab));
    });
  }
}
