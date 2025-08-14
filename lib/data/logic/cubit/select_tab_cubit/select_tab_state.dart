part of 'select_tab_cubit.dart';

class SelectTabState extends Equatable {
  final int selectIndex;
  const SelectTabState(this.selectIndex);

  @override
  List<Object> get props => [selectIndex];
}
