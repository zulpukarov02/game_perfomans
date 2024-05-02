import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cubit_state.dart';

class TapCubit extends Cubit<int> {
  TapCubit() : super(0);
  void updateIndex(int index) => emit(index);
}
