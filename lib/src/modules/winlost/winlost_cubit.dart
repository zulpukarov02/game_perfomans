import 'package:flutter_bloc/flutter_bloc.dart';

part 'winlost_state.dart';

class WinlostCubit extends Cubit<WinlostState> {
  WinlostCubit()
      : super(
          WinlostState(
            gameName: '',
            playTime: '',
            investment: '',
            playTimeTwo: '',
            won: '',
          ),
        );
  void addName(
      {required String gameName,
      required String won,
      required String playTime,
      required String investment,
      required String playTimeTwo}) {
    emit(WinlostState(
      gameName: gameName,
      investment: investment,
      playTimeTwo: playTimeTwo,
      playTime: playTime,
      won: won,
    ));
  }
}
        //  context.read<WinlostCubit>().addName(
        //                             gameName: gameNameControler.text,
        //                             investment: amountController.text,
        //                             won: wonController.text,
        //                             playTime: playOneController.text,
        //                             playTimeTwo: playTwoController.text,
        //                           );