import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Show Modal Sheet'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> itemsList = [
    'Please Select Item ...',
    'Amad Irfan',
    'Saad Irfan',
    'Fatima Maryyam',
    'Jawad Irfan',
    'Abieha Maryyam',
  ];
  int currentStep = 0;
  String? dropVal = 'Please Select Item ...';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          child: DropdownButton(
            dropdownColor: Color.fromARGB(255, 83, 80, 80),
            isDense: true,
            hint: Text('select item'),
            style: TextStyle(
              wordSpacing: 2.0,
              locale: Locale.fromSubtags(),
              fontSize: 25,
              fontWeight: FontWeight.bold,
              // foreground: Paint(),
              color: Colors.white,
            ),
            value: dropVal,
            isExpanded: true,
            // elevation: 0,
            items: itemsList
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ),
                )
                .toList(),
            onChanged: (String? value) {
              setState(() {
                dropVal = value;
              });
            },
          ),
        ),
      ),
      body: Stepper(
        margin: currentStep == 3
            ? EdgeInsets.symmetric(horizontal: 45)
            : EdgeInsets.symmetric(horizontal: 60),
        currentStep: currentStep,
        onStepContinue: () {
          if (currentStep < 3) {
            setState(() {
              currentStep += 1;
            });
          } else {
            setState(() {
              currentStep = 3;
            });
          }
        },
        onStepCancel: () {
          if (currentStep > 0) {
            setState(() {
              currentStep -= 1;
            });
          } else {
            setState(() {
              currentStep = 0;
            });
          }
        },
        onStepTapped: (setStep) {
          setState(() {
            currentStep = setStep;
          });
        },
        controlsBuilder: (ctx, Controls) {
          return Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                ),
                onPressed: Controls.onStepContinue,
                child: Text(
                  currentStep == 3 ? 'Confirm ' : ' Next',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              currentStep == 0
                  ? Container()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                      ),
                      onPressed: Controls.onStepCancel,
                      child: Text(
                        ' Cancel',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
            ],
          );
        },
        steps: [
          Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0 ? true : false,
            title: Text('Personal Information'),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: const Text('Name'),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: const Text('father Name'),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: const Text('CNIC'),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: const Text('Date of birth'),
                  ),
                ),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
          Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1 ? true : false,
            title: Text('Other Information'),
            content: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: const Text('City'),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: const Text('Province'),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: const Text('country '),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          Step(
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2 ? true : false,
            title: Text('Education'),
            content: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: const Text('School Name'),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: const Text('Collage Name'),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: const Text('University'),
                  ),
                ),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
          Step(
            state: currentStep > 3 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 3 ? true : false,
            title: Text('Future Planes'),
            content: Column(
              children: [
                TextField(
                  textInputAction: TextInputAction.newline,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Future Planes'),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
