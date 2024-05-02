import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_perfomans/cubit/cubit_tab.dart';
import 'package:game_perfomans/src/model/model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<GameData> gameDataList = [];
  final List<String> items = <String>[
    "Games",
    "Total bets",
    "Playtime",
    "Won",
    "Loses",
    "Win rate",
  ];
  List<String> items2 = [
    "0",
    "\$0",
    "0h 0m",
    "\$0",
    "\$0",
    "0%",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff24222D),
      appBar: AppBar(
        backgroundColor: const Color(0xff24222D),
        leading: const Icon(
          Icons.arrow_back_ios_new,
          size: 32,
          color: Colors.white,
        ),
        title: const Text(
          'Game Performance\nAnalytics',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Overview',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 184,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 2.9),
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    if (index == items.length - 1) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xFF7A83FF),
                        ),
                        width: 19,
                        height: 18,
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            Text(
                              items[index],
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              updateDigits(items2[index], '1234567890'),
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xFF363344),
                      ),
                      width: 19,
                      height: 18,
                      child: Column(
                        children: [
                          SizedBox(height: 15),
                          Text(
                            items[index],
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            updateDigits(items2[index], '1234567890'),
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Graph',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 228,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xFF363344),
                ),
                child: charts.LineChart(
                  _createChartData(),
                  animate: true,
                  behaviors: [
                    charts.ChartTitle('Play Time',
                        behaviorPosition: charts.BehaviorPosition.bottom,
                        titleOutsideJustification:
                            charts.OutsideJustification.middleDrawArea),
                    charts.ChartTitle('Wins',
                        behaviorPosition: charts.BehaviorPosition.start,
                        titleOutsideJustification:
                            charts.OutsideJustification.middleDrawArea),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
        child: SizedBox(
          width: 380,
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7A83FF),
            ),
            onPressed: () async {
              await showDiologMetot(context);
            },
            child: const Text(
              '+ Add a game',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  String updateDigits(String originalString, String newDigits) {
    List<String> originalParts = originalString.split(RegExp(r'(\d+)'));
    List<String> newParts = [];
    for (int i = 0; i < originalParts.length - 1; i++) {
      newParts.add(originalParts[i]);
      newParts.add(newDigits[i]);
    }
    newParts.add(originalParts.last);
    return newParts.join('');
  }

  List<charts.Series<GameData, int>> _createChartData() {
    return [
      charts.Series<GameData, int>(
        id: 'Game Performance',
        domainFn: (GameData data, _) => data.playTime,
        measureFn: (GameData data, _) => data.wins,
        data: gameDataList,
      ),
    ];
  }

  Future<void> showDiologMetot(BuildContext context) async {
    final _formKey = GlobalKey<FormState>();
    final gameNameControler = TextEditingController();
    final amountController = TextEditingController();
    final wonController = TextEditingController();
    final playOneController = TextEditingController();
    final playTwoController = TextEditingController();
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xff24222D),
          content: Builder(
            builder: (context) {
              return SizedBox(
                width: 600,
                height: 480,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: BlocBuilder<TapCubit, int>(
                            builder: (context, state) {
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: 2,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      context
                                          .read<TapCubit>()
                                          .updateIndex(index);
                                    },
                                    child: AnimatedContainer(
                                      curve: Curves.easeInOut,
                                      duration:
                                          const Duration(milliseconds: 400),
                                      height: 59,
                                      width: 125,
                                      color: Colors.transparent,
                                      margin: const EdgeInsets.all(5),
                                      child: Center(
                                        child: Text(
                                          index == 0 ? 'Win' : 'Lose',
                                          style: TextStyle(
                                            color: state == index
                                                ? Colors.deepPurple
                                                : Colors.white,
                                            fontSize: state == index ? 25 : 17,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Game name',
                          style: TextStyle(color: Color(0xff8E86A6)),
                        ),
                        TextFieledGame(
                          controller: gameNameControler,
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Investment amount',
                          style: TextStyle(color: Color(0xff8E86A6)),
                        ),
                        TextFieledGame(
                          controller: amountController,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Won',
                          style: TextStyle(color: Color(0xff8E86A6)),
                        ),
                        const SizedBox(height: 4),
                        TextFieledGame(
                          controller: wonController,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 5),
                        const Row(
                          children: [
                            Text(
                              'Play time',
                              style: TextStyle(color: Color(0xff8E86A6)),
                            ),
                            SizedBox(width: 4),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFieledGame(
                                controller: playOneController,
                                keyboardType: TextInputType.number,
                                labelText: ' h',
                              ),
                            ),
                            const SizedBox(width: 2),
                            Expanded(
                              child: TextFieledGame(
                                controller: playTwoController,
                                keyboardType: TextInputType.number,
                                labelText: 'm',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white54,
                              minimumSize: const Size(100, 50),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  gameDataList.add(GameData(
                                    gameNameControler.text,
                                    int.parse(amountController.text),
                                    int.parse(wonController.text),
                                    int.parse(playOneController.text),
                                    int.parse(playTwoController.text),
                                  ));
                                  // Clear text fields after submitting
                                  gameNameControler.clear();
                                  amountController.clear();
                                  wonController.clear();
                                  playOneController.clear();
                                  playTwoController.clear();
                                });
                                Navigator.pop(context);
                              }
                            },
                            child: const Center(
                              child: Text(
                                'Add a game',
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class TextFieledGame extends StatelessWidget {
  TextEditingController? controller;
  final Widget? prefixIcon;
  final String? labelText;
  final TextInputType? keyboardType;
  void Function(String)? onChanged;

  TextFieledGame({
    super.key,
    required this.controller,
    this.keyboardType,
    this.labelText,
    this.prefixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: h * 0.018, horizontal: 15), // Установка отступов
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff8E86A6), width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          prefixIcon: prefixIcon,
          prefixIconColor: const Color(0xff8E86A6),
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: h * 0.02, // Размер текста для подписи
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        style: const TextStyle(color: Colors.white),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}
