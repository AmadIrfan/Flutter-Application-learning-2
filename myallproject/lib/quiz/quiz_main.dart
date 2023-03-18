import 'package:flutter/material.dart';
import '../quiz/restartQuiz.dart';
import '../quiz/answerpage.dart';
import '../quiz/questionpage.dart';

class QuizMain extends StatefulWidget {
  const QuizMain({super.key});
  static const routName = '/quiz_main';

  @override
  State<QuizMain> createState() => _QuizMainState();
}

class _QuizMainState extends State<QuizMain> {
  int index = 0;
  List<Map<String, Object>> questionList = [
    {
      "question": "Which is the capital city of Pakistan ",
      'Answers': [
        {'ans': 'islamabad', 'tag': '(A)'},
        {'ans': 'lahore', "tag": '(B)'},
        {'ans': 'karachi', "tag": '(C)'},
        {'ans': 'multan', "tag": '(D)'},
      ],
    },
    {
      'question': 'She is _____ tired and cannot walk anymore.',
      'Answers': [
        {'ans': 'so such', 'tag': '(A)'},
        {'ans': 'so', "tag": '(B)'},
        {'ans': 'too', "tag": '(C)'},
        {'ans': 'such', "tag": '(D)'},
      ],
    },
  ];

  void incrementor() {
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: index < questionList.length
          ? CustomScrollView(
              slivers: [
                const SliverAppBar(
                  pinned: true,
                  expandedHeight: 300,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      'Quiz',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 10,
                        ),
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.amber.withOpacity(0.5),
                            Colors.green.withOpacity(0.4),
                            Colors.red.withOpacity(0.4),
                          ]),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Answer the following Questions...',
                          style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 46, 46, 46),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      QuestionPage(
                        qString: questionList[index]['question'].toString(),
                      ),
                      ...(questionList[index]['Answers'] as List)
                          .map((e) => AnswerPage(
                                ansString: e['ans'].toString(),
                                tag: e['tag'].toString(),
                                questionInc: incrementor,
                              ))
                    ],
                  ),
                ),
              ],
            )
          : RestartQuiz(reQuiz: resetQuiz),
    );
  }

  void resetQuiz() {
    setState(() {
      index = 0;
    });
  }
}
