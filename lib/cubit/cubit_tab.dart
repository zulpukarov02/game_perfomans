import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cubit_state.dart';

class TapCubit extends Cubit<int> {
  TapCubit() : super(0);
  void updateIndex(int index) => emit(index);
}

  // Future<void> showDiologMetot(BuildContext context) async {
  //   final formKey = GlobalKey<FormState>();
  //   final gameNameControler = TextEditingController();
  //   final amountController = TextEditingController();
  //   final wonController = TextEditingController();
  //   final playOneController = TextEditingController();
  //   final playTwoController = TextEditingController();
  //   await showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         backgroundColor: const Color(0xff24222D),
  //         content: Builder(
  //           builder: (context) {
  //             return SizedBox(
  //               width: 600,
  //               height: 480,
  //               child: SingleChildScrollView(
  //                 child: Form(
  //                   key: formKey,
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       SizedBox(
  //                         height: 60,
  //                         width: double.infinity,
  //                         child: BlocBuilder<TapCubit, int>(
  //                           builder: (context, state) {
  //                             return ListView.builder(
  //                               shrinkWrap: true,
  //                               itemCount: 2,
  //                               scrollDirection: Axis.horizontal,
  //                               itemBuilder: (context, index) {
  //                                 return GestureDetector(
  //                                   onTap: () {
  //                                     context
  //                                         .read<TapCubit>()
  //                                         .updateIndex(index);
  //                                   },
  //                                   child: AnimatedContainer(
  //                                     curve: Curves.easeInOut,
  //                                     duration:
  //                                         const Duration(milliseconds: 400),
  //                                     height: 59,
  //                                     width: 125,
  //                                     color: Colors.transparent,
  //                                     margin: const EdgeInsets.all(5),
  //                                     child: Center(
  //                                       child: Text(
  //                                         index == 0 ? 'Win' : 'Lose',
  //                                         style: TextStyle(
  //                                           color: state == index
  //                                               ? Colors.deepPurple
  //                                               : Colors.white,
  //                                           fontSize: state == index ? 25 : 17,
  //                                         ),
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 );
  //                               },
  //                             );
  //                           },
  //                         ),
  //                       ),
  //                       const SizedBox(height: 5),
  //                       const Text(
  //                         'Game name',
  //                         style: TextStyle(color: Color(0xff8E86A6)),
  //                       ),
  //                       TextFieledGame(
  //                         controller: gameNameControler,
  //                       ),
  //                       const SizedBox(height: 5),
  //                       const Text(
  //                         'Investment amount',
  //                         style: TextStyle(color: Color(0xff8E86A6)),
  //                       ),
  //                       TextFieledGame(
  //                         controller: amountController,
  //                         keyboardType: TextInputType.number,
  //                       ),
  //                       const SizedBox(height: 5),
  //                       const Text(
  //                         'Won',
  //                         style: TextStyle(color: Color(0xff8E86A6)),
  //                       ),
  //                       const SizedBox(height: 4),
  //                       TextFieledGame(
  //                         controller: wonController,
  //                         keyboardType: TextInputType.number,
  //                       ),
  //                       const SizedBox(height: 5),
  //                       const Row(
  //                         children: [
  //                           Text(
  //                             'Play time',
  //                             style: TextStyle(color: Color(0xff8E86A6)),
  //                           ),
  //                           SizedBox(width: 4),
  //                         ]
  //                       ),
  //                       Row(
  //                         children: [
  //                           Expanded(
  //                             child: TextFieledGame(
  //                               controller: playOneController,
  //                               keyboardType: TextInputType.number,
  //                               labelText: ' h',
  //                             ),
  //                           ),
  //                           const SizedBox(width: 2),
  //                           Expanded(
  //                             child: TextFieledGame(
  //                               controller: playTwoController,
  //                               keyboardType: TextInputType.number,
  //                               labelText: 'm',
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       const SizedBox(
  //                         height: 2,
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.symmetric(
  //                             horizontal: 10, vertical: 5),
  //                         child: ElevatedButton(
  //                           style: ElevatedButton.styleFrom(
  //                             backgroundColor: Colors.white54,
  //                             minimumSize: const Size(100, 50),
  //                           ),
  //                           onPressed: () {
  //                             if (formKey.currentState!.validate()) {
  //                               setState(() {
  //                                 gameDataList.add(GameData(
  //                                   gameNameControler.text,
  //                                   int.parse(amountController.text),
  //                                   int.parse(wonController.text),
  //                                   int.parse(playOneController.text),
  //                                   int.parse(playTwoController.text),
  //                                 ));
  //                                 // Clear text fields after submitting
  //                                 gameNameControler.clear();
  //                                 amountController.clear();
  //                                 wonController.clear();
  //                                 playOneController.clear();
  //                                 playTwoController.clear();
  //                               });
  //                               Navigator.pop(context);
  //                             }
  //                           },
  //                           child: const Center(
  //                             child: Text(
  //                               'Add a game',
  //                               style: TextStyle(
  //                                 color: Colors.white60,
  //                                 fontSize: 20,
  //                                 fontWeight: FontWeight.w500,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             );
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }