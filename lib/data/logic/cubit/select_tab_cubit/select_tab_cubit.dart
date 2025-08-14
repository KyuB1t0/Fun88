import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'select_tab_state.dart';

class SelectTabCubit extends Cubit<SelectTabState> {
  SelectTabCubit() : super(const SelectTabState(0));

  void toggle(int selectedIndex) {
    emit(SelectTabState(selectedIndex));
  }
}
