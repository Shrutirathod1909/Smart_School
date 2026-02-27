import 'dart:async';
import 'package:flutter/material.dart';
import 'package:market/screen/result_screen.dart';

class QuestionScreen extends StatefulWidget {
  final int totalQuestions;
  final bool enableTimer;
  final bool enableFilter;

  const QuestionScreen({
    super.key,
    required this.totalQuestions,
    required this.enableTimer,
    required this.enableFilter,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentIndex = 0;
  int selectedOption = -1;
  bool isSubmitted = false;
  bool isGridView = true;
  Timer? _timer;
  late int totalSeconds;
  bool isPaused = false;

  late List<Map<String, dynamic>> questions;
  Map<int, int> userAnswers = {};
  Map<int, bool> markForReview = {};

  int correctCount = 0;
  int wrongCount = 0;
  int unattemptedCount = 0;

  List<Map<String, dynamic>> allQuestions = [
{
"question": "Explain the process of photosynthesis in detail and describe the role of chlorophyll, sunlight, carbon dioxide, and water in this biological process.",
"options": [
"It is the process by which plants make food using sunlight",
"It is the process of digestion in animals",
"It is the process of respiration in plants",
"It is the process of water absorption"
],
"correctIndex": 0
},
{
"question": "Describe Newton’s three laws of motion and explain how they apply in real-life situations with examples.",
"options": [
"They explain motion and force interaction",
"They explain sound waves",
"They explain plant growth",
"They explain electricity generation"
],
"correctIndex": 0
},
{
"question": "Explain the structure of an atom and describe the role of protons, neutrons, and electrons.",
"options": [
"Atom consists of nucleus and electrons",
"Atom is made of only electrons",
"Atom contains only neutrons",
"Atom has no internal structure"
],
"correctIndex": 0
},
{
"question": "Discuss the importance of the periodic table and explain how elements are arranged in it.",
"options": [
"Elements arranged by atomic number",
"Elements arranged randomly",
"Elements arranged by color",
"Elements arranged by weight only"
],
"correctIndex": 0
},
{
"question": "Explain the process of respiration in human beings including inhalation, exhalation and cellular respiration.",
"options": [
"It releases energy from food",
"It produces sunlight",
"It produces gravity",
"It creates water"
],
"correctIndex": 0
},
{
"question": "Describe the water cycle and explain evaporation, condensation, and precipitation.",
"options": [
"It explains movement of water in nature",
"It explains electricity flow",
"It explains soil formation",
"It explains rock formation"
],
"correctIndex": 0
},
{
"question": "Explain the theory of evolution proposed by Charles Darwin.",
"options": [
"Species evolve through natural selection",
"Species never change",
"Evolution happens in one day",
"Humans never evolved"
],
"correctIndex": 0
},
{
"question": "Discuss the causes and effects of global warming and climate change.",
"options": [
"Increased greenhouse gases raise temperature",
"It cools the Earth",
"It stops rainfall",
"It reduces oxygen completely"
],
"correctIndex": 0
},
{
"question": "Explain Ohm’s Law and describe the relationship between voltage, current and resistance.",
"options": [
"V = I × R",
"V = R ÷ I",
"I = V × R",
"R = V + I"
],
"correctIndex": 0
},
{
"question": "Describe the digestive system of humans and explain the function of each organ.",
"options": [
"It breaks down food into nutrients",
"It produces oxygen",
"It pumps blood only",
"It produces hormones only"
],
"correctIndex": 0
},
{
"question": "Explain the difference between renewable and non-renewable sources of energy with examples.",
"options": [
"Renewable can be replenished naturally",
"Both are unlimited",
"Non-renewable never end",
"They are same"
],
"correctIndex": 0
},
{
"question": "Describe the structure and function of the human heart.",
"options": [
"It pumps blood throughout body",
"It produces insulin",
"It stores oxygen",
"It filters air"
],
"correctIndex": 0
},
{
"question": "Explain the process of cell division (mitosis and meiosis).",
"options": [
"It produces new cells",
"It produces electricity",
"It produces sunlight",
"It produces bones"
],
"correctIndex": 0
},
{
"question": "Discuss the importance of biodiversity in maintaining ecological balance.",
"options": [
"It maintains ecosystem stability",
"It reduces oxygen",
"It increases pollution",
"It destroys forests"
],
"correctIndex": 0
},
{
"question": "Explain the structure of DNA and its role in heredity.",
"options": [
"DNA carries genetic information",
"DNA produces sunlight",
"DNA pumps blood",
"DNA stores water"
],
"correctIndex": 0
},
{
"question": "Describe the working principle of a generator.",
"options": [
"It converts mechanical energy to electrical energy",
"It converts light to sound",
"It converts water to air",
"It converts heat to cold"
],
"correctIndex": 0
},
{
"question": "Explain the greenhouse effect and its importance.",
"options": [
"It traps heat in atmosphere",
"It removes oxygen",
"It stops sunlight",
"It reduces gravity"
],
"correctIndex": 0
},
{
"question": "Describe the structure and function of neurons in the nervous system.",
"options": [
"They transmit nerve impulses",
"They pump blood",
"They digest food",
"They produce hormones"
],
"correctIndex": 0
},
{
"question": "Explain the importance of vaccines in preventing diseases.",
"options": [
"They build immunity",
"They cause disease",
"They remove oxygen",
"They increase sugar"
],
"correctIndex": 0
},
{
"question": "Discuss the layers of the Earth and their characteristics.",
"options": [
"Crust, mantle, core",
"Water, fire, air",
"Soil, sand, rocks",
"Cloud, rain, wind"
],
"correctIndex": 0
},
{
"question": "Explain the meaning and objectives of accounting in business organizations.",
"options": [
"Recording financial transactions",
"Producing goods",
"Manufacturing machines",
"Transporting goods"
],
"correctIndex": 0
},
{
"question": "Describe the concept of demand and supply with graphical explanation.",
"options": [
"It explains market price determination",
"It explains gravity",
"It explains rainfall",
"It explains electricity"
],
"correctIndex": 0
},
{
"question": "Explain the functions of a bank in modern economy.",
"options": [
"Accept deposits and give loans",
"Manufacture products",
"Grow crops",
"Produce electricity"
],
"correctIndex": 0
},
{
"question": "Discuss the importance of marketing management in business growth.",
"options": [
"It promotes and sells products",
"It builds houses",
"It produces oil",
"It controls rainfall"
],
"correctIndex": 0
},
{
"question": "Explain different types of business organizations.",
"options": [
"Sole proprietorship, partnership, company",
"Mountain, river, sea",
"Rock, sand, soil",
"Sun, moon, stars"
],
"correctIndex": 0
},
{
"question": "Describe the concept of GST and its impact on Indian economy.",
"options": [
"It is indirect tax reform",
"It is direct tax only",
"It is bank loan",
"It is stock market"
],
"correctIndex": 0
},
{
"question": "Explain the meaning of inflation and its causes.",
"options": [
"Rise in general price level",
"Fall in rainfall",
"Increase in oxygen",
"Decrease in gravity"
],
"correctIndex": 0
},
{
"question": "Discuss the functions of management in business organization.",
"options": [
"Planning, organizing, directing, controlling",
"Digging, planting, watering",
"Heating, cooling, freezing",
"Buying, selling only"
],
"correctIndex": 0
},
{
"question": "Explain the concept of balance sheet and its components.",
"options": [
"Assets and liabilities statement",
"Rainfall report",
"Weather forecast",
"Electricity bill"
],
"correctIndex": 0
},
{
"question": "Describe the role of stock exchange in economic development.",
"options": [
"It facilitates buying and selling of shares",
"It produces goods",
"It grows crops",
"It builds roads"
],
"correctIndex": 0
},
{
"question": "Explain the concept of national income.",
"options": [
"Total income of country",
"Income of one person",
"Income of bank only",
"Income of shop only"
],
"correctIndex": 0
},
{
"question": "Discuss the importance of entrepreneurship.",
"options": [
"It creates new business opportunities",
"It stops production",
"It reduces jobs",
"It increases loss"
],
"correctIndex": 0
},
{
"question": "Explain the law of diminishing returns.",
"options": [
"Output eventually decreases",
"Output always increases",
"Output stays same",
"No production"
],
"correctIndex": 0
},
{
"question": "Describe different types of accounts in accounting.",
"options": [
"Personal, Real, Nominal",
"River, mountain, forest",
"Cold, heat, wind",
"Oil, gas, coal"
],
"correctIndex": 0
},
{
"question": "Explain the concept of business ethics.",
"options": [
"Moral principles in business",
"Cooking methods",
"Medical treatment",
"Construction rules"
],
"correctIndex": 0
},
{
"question": "Discuss the importance of consumer protection.",
"options": [
"Protects rights of consumers",
"Protects animals",
"Protects forests",
"Protects rivers"
],
"correctIndex": 0
},
{
"question": "Explain the objectives of financial management.",
"options": [
"Profit maximization and wealth maximization",
"Rainfall maximization",
"Heat maximization",
"Noise maximization"
],
"correctIndex": 0
},
{
"question": "Describe the functions of Reserve Bank of India.",
"options": [
"It controls monetary policy",
"It manufactures goods",
"It builds roads",
"It grows crops"
],
"correctIndex": 0
},
{
"question": "Explain the concept of international trade.",
"options": [
"Trade between countries",
"Trade within village only",
"Trade inside home",
"No trade"
],
"correctIndex": 0
},
{
"question": "Discuss the role of advertising in modern marketing.",
"options": [
"It creates awareness about products",
"It reduces sales",
"It stops marketing",
"It increases pollution"
],
"correctIndex": 0
}
];
@override
  void initState() {
    super.initState();
    questions = allQuestions.take(widget.totalQuestions).toList();
    totalSeconds = widget.totalQuestions * 60;

    if (widget.enableTimer) {
      startTimer();
    }
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!isPaused) {
        if (totalSeconds > 0) {
          setState(() {
            totalSeconds--;
          });
        } else {
          submitExam();
        }
      }
    });
  }

  void togglePause() {
    setState(() {
      isPaused = !isPaused;
    });
  }

  String get timerText {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    return "$minutes:${seconds.toString().padLeft(2, '0')}";
  }

  void selectOption(int index) {
    if (isSubmitted) return;
    if (widget.enableFilter && userAnswers.containsKey(currentIndex)) return;

    setState(() {
      selectedOption = index;
      userAnswers[currentIndex] = index;
    });
  }

  void clearSelection() {
    if (isSubmitted) return;
    if (widget.enableFilter && userAnswers.containsKey(currentIndex)) return;

    setState(() {
      selectedOption = -1;
      userAnswers.remove(currentIndex);
    });
  }

  void toggleMarkForReview() {
    setState(() {
      markForReview[currentIndex] =
          !(markForReview[currentIndex] ?? false);
    });
  }

 void submitExam() {
  _timer?.cancel();

  correctCount = 0;
  wrongCount = 0;
  unattemptedCount = 0;

  for (int i = 0; i < questions.length; i++) {
    if (!userAnswers.containsKey(i)) {
      unattemptedCount++;
    } else if (userAnswers[i] == questions[i]["correctIndex"]) {
      correctCount++;
    } else {
      wrongCount++;
    }
  }

  double accuracy = correctCount + wrongCount == 0
      ? 0
      : (correctCount / (correctCount + wrongCount)) * 100;

  int totalTime = widget.totalQuestions * 60;
  int takenTime = totalTime - totalSeconds;

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => TestResultScreen(
        totalQuestions: questions.length,
        correct: correctCount,
        wrong: wrongCount,
        unattempted: unattemptedCount,
        accuracy: accuracy,
        timeTaken: takenTime, // ✅ Correct time pass
        questions: questions,
        userAnswers: userAnswers,
      ),
    ),
  );
}
  Color getOptionColor(int index) {
  // Before submit
  if (!widget.enableFilter) {
    if (userAnswers[currentIndex] == index) {
      return Colors.blue.shade100;
    }
    return Colors.white;
  }

  // After submit
  if (userAnswers.containsKey(currentIndex)) {
    int selected = userAnswers[currentIndex]!;
    int correct = questions[currentIndex]["correctIndex"];

    if (index == correct) return Colors.green.shade200;
    if (index == selected && selected != correct) {
      return Colors.red.shade200;
    }
  }

  return Colors.white;
}
  @override
  Widget build(BuildContext context) {
    final question = questions[currentIndex];
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Scaffold(
      endDrawer: buildQuestionDrawer(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.enableTimer)
              Text(
                timerText,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: isTablet ? 20 : 16),
              ),
            IconButton(
              icon: Icon(
                  isPaused ? Icons.play_arrow : Icons.pause),
              onPressed: togglePause,
            ),
            ElevatedButton(
              onPressed: submitExam,
              child: const Text("SUBMIT"),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(isTablet ? 24 : 16),
        child: Column(
          children: [
            Text(
              "Q ${currentIndex + 1}/${questions.length}",
              style: TextStyle(fontSize: isTablet ? 18 : 14),
            ),
            const SizedBox(height: 10),
            Text(
              question["question"],
              style: TextStyle(
                  fontSize: isTablet ? 20 : 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: question["options"].length,
                itemBuilder: (context, index) =>
                    GestureDetector(
                  onTap: () => selectOption(index),
                  child: Container(
                    padding:
                        EdgeInsets.all(isTablet ? 18 : 12),
                    margin:
                        const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: getOptionColor(index),
                      borderRadius:
                          BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.grey.shade400),
                    ),
                    child: Text(
                      question["options"][index],
                      style: TextStyle(
                          fontSize:
                              isTablet ? 16 : 14),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
  padding: const EdgeInsets.only(bottom: 25), 
           child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ElevatedButton(
                  onPressed: currentIndex > 0
                      ? () {
                          setState(() {
                            currentIndex--;
                          });
                        }
                      : null,
                  child: const Icon(Icons.arrow_back),
                ),
                ElevatedButton(
                  onPressed: clearSelection,
                  child: const Text("Clear"),
                ),
                ElevatedButton(
                  onPressed: toggleMarkForReview,
                  child: const Text("Mark"),
                ),
                ElevatedButton(
                  onPressed:
                      currentIndex < questions.length - 1
                          ? () {
                              setState(() {
                                currentIndex++;
                              });
                            }
                          : null,
                  child:
                      const Icon(Icons.arrow_forward),
                ),
              ],
            )
         ) ],
        ),
      ),
    );
  }

 Widget buildQuestionDrawer() {
  final size = MediaQuery.of(context).size;
  final isTablet = size.width > 600;
  final isLarge = size.width > 1000;

  int crossAxisCount = isLarge
      ? 8
      : isTablet
          ? 6
          : 4;

  return Drawer(
    child: Column(
      children: [
        const DrawerHeader(
          child: Text(
            "All Questions",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        /// GRID / LIST TOGGLE (Same as your original)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              const Text(
                "View: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(
                  Icons.grid_view,
                  color: isGridView ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    isGridView = true;
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.list,
                  color: !isGridView ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  isGridView = false;
                  setState(() {});
                },
              ),
            ],
          ),
        ),

        /// QUESTIONS VIEW
        Expanded(
          child: isGridView
              ? GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                  ),
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    Color color = Colors.grey;

                    if (userAnswers.containsKey(index)) {
                      int selected = userAnswers[index]!;
                      int correct =
                          questions[index]["correctIndex"];

                      if (widget.enableFilter) {
                        color = selected == correct
                            ? Colors.green
                            : Colors.red;
                      } else {
                        color = Colors.blue;
                      }
                    }

                    if (markForReview[index] == true) {
                      color = Colors.orange;
                    }

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                          selectedOption =
                              userAnswers[index] ?? -1;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.4),
                          borderRadius:
                              BorderRadius.circular(8),
                        ),
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(
                              fontSize: isTablet ? 16 : 12),
                        ),
                      ),
                    );
                  },
                )
              : ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    Color color = Colors.grey;

                    if (userAnswers.containsKey(index)) {
                      int selected = userAnswers[index]!;
                      int correct =
                          questions[index]["correctIndex"];

                      if (widget.enableFilter) {
                        color = selected == correct
                            ? Colors.green
                            : Colors.red;
                      } else {
                        color = Colors.blue;
                      }
                    }

                    if (markForReview[index] == true) {
                      color = Colors.orange;
                    }

                    return ListTile(
                      tileColor: color.withOpacity(0.3),
                      title: Text(
                        "Q ${index + 1}",
                        style: TextStyle(
                          fontSize: isTablet ? 16 : 14,
                        ),
                      ),
                      subtitle: Text(
                        questions[index]["question"],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                          selectedOption =
                              userAnswers[index] ?? -1;
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
        ),
      ],
    ),
  );
}}