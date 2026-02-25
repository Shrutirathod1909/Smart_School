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
  bool isGridView = true; // Drawer toggle
  Timer? _timer;
  late int totalSeconds;
  bool isPaused = false;

  Duration remainingTime = const Duration(minutes: 90);
  Timer? timer;

  late List<Map<String, dynamic>> questions;
  Map<int, int> userAnswers = {};
  Map<int, bool> markForReview = {};

  int correctCount = 0;
  int wrongCount = 0;
  int unattemptedCount = 0;

  List<Map<String, dynamic>> allQuestions = [
    {
      "question": "What is the chemical symbol for water?",
      "options": ["H2O", "O2", "CO2", "NaCl"],
      "correctIndex": 0,
    },
    {
      "question": "What is 12 × 8?",
      "options": ["96", "108", "88", "100"],
      "correctIndex": 0,
    },
    {
      "question": "Who was the first President of the United States?",
      "options": [
        "George Washington",
        "Thomas Jefferson",
        "Abraham Lincoln",
        "John Adams",
      ],
      "correctIndex": 0,
    },
    {
      "question": "Which is the largest continent on Earth?",
      "options": ["Africa", "Asia", "Europe", "North America"],
      "correctIndex": 1,
    },
    {
      "question": "What is the boiling point of water at sea level?",
      "options": ["100°C", "90°C", "80°C", "120°C"],
      "correctIndex": 0,
    },
    {
      "question": "What is 45 ÷ 5?",
      "options": ["9", "10", "8", "7"],
      "correctIndex": 0,
    },
    {
      "question": "Who discovered gravity?",
      "options": [
        "Isaac Newton",
        "Albert Einstein",
        "Galileo Galilei",
        "Nikola Tesla",
      ],
      "correctIndex": 0,
    },
    {
      "question": "Which country is known as the Land of the Rising Sun?",
      "options": ["China", "Japan", "Thailand", "India"],
      "correctIndex": 1,
    },
    {
      "question": "What is 15% of 200?",
      "options": ["20", "25", "30", "35"],
      "correctIndex": 2,
    },
    {
      "question": "Who wrote the epic 'Ramayana'?",
      "options": ["Valmiki", "Vyasa", "Kalidasa", "Tulsidas"],
      "correctIndex": 0,
    },
    {
      "question": "Which planet is known as the Red Planet?",
      "options": ["Mars", "Jupiter", "Venus", "Saturn"],
      "correctIndex": 0,
    },
    {
      "question": "What is 20 × 12?",
      "options": ["220", "240", "260", "200"],
      "correctIndex": 1,
    },
    {
      "question": "Who was the first Prime Minister of India?",
      "options": [
        "Jawaharlal Nehru",
        "Mahatma Gandhi",
        "Indira Gandhi",
        "Rajendra Prasad",
      ],
      "correctIndex": 0,
    },
    {
      "question": "Which is the longest river in the world?",
      "options": ["Amazon", "Nile", "Ganga", "Yangtze"],
      "correctIndex": 1,
    },
    {
      "question": "What is the freezing point of water?",
      "options": ["0°C", "32°C", "-1°C", "100°C"],
      "correctIndex": 0,
    },
    {
      "question": "What is 9 × 7?",
      "options": ["63", "72", "56", "60"],
      "correctIndex": 0,
    },
    {
      "question": "Who invented the telephone?",
      "options": [
        "Alexander Graham Bell",
        "Thomas Edison",
        "Nikola Tesla",
        "James Watt",
      ],
      "correctIndex": 0,
    },
    {
      "question": "Which is the largest ocean on Earth?",
      "options": ["Atlantic", "Pacific", "Indian", "Arctic"],
      "correctIndex": 1,
    },
    {
      "question": "What is the capital of France?",
      "options": ["Paris", "London", "Berlin", "Rome"],
      "correctIndex": 0,
    },
    {
      "question": "Which gas is essential for human respiration?",
      "options": ["Oxygen", "Carbon Dioxide", "Nitrogen", "Hydrogen"],
      "correctIndex": 0,
    },
    {
      "question": "What is 50 ÷ 5?",
      "options": ["5", "10", "15", "20"],
      "correctIndex": 1,
    },
    {
      "question": "Who wrote 'Macbeth'?",
      "options": [
        "William Shakespeare",
        "Charles Dickens",
        "Leo Tolstoy",
        "Mark Twain",
      ],
      "correctIndex": 0,
    },
    {
      "question": "Which planet is closest to the Sun?",
      "options": ["Mercury", "Venus", "Earth", "Mars"],
      "correctIndex": 0,
    },
    {
      "question": "What is the capital of India?",
      "options": ["New Delhi", "Mumbai", "Kolkata", "Chennai"],
      "correctIndex": 0,
    },
    {
      "question": "What is the sum of angles in a triangle?",
      "options": ["180°", "90°", "360°", "270°"],
      "correctIndex": 0,
    },
    {
      "question": "Who was the first man to step on the moon?",
      "options": [
        "Neil Armstrong",
        "Buzz Aldrin",
        "Yuri Gagarin",
        "Michael Collins",
      ],
      "correctIndex": 0,
    },
    {
      "question": "Which is the smallest prime number?",
      "options": ["0", "1", "2", "3"],
      "correctIndex": 2,
    },
    {
      "question": "Which is the national bird of India?",
      "options": ["Peacock", "Sparrow", "Eagle", "Parrot"],
      "correctIndex": 0,
    },
    {
      "question": "What is the chemical symbol for Gold?",
      "options": ["Au", "Ag", "Gd", "Go"],
      "correctIndex": 0,
    },
    {
      "question": "What is 11 × 11?",
      "options": ["111", "121", "131", "112"],
      "correctIndex": 1,
    },
    {
      "question": "Who discovered penicillin?",
      "options": [
        "Alexander Fleming",
        "Marie Curie",
        "Louis Pasteur",
        "Gregor Mendel",
      ],
      "correctIndex": 0,
    },
    {
      "question": "Which is the largest desert in the world?",
      "options": ["Sahara", "Gobi", "Arabian", "Kalahari"],
      "correctIndex": 0,
    },
    {
      "question": "Which vitamin is produced when skin is exposed to sunlight?",
      "options": ["Vitamin A", "Vitamin B", "Vitamin C", "Vitamin D"],
      "correctIndex": 3,
    },
    {
      "question": "What is the chemical formula for table salt?",
      "options": ["NaCl", "KCl", "Na2SO4", "CaCl2"],
      "correctIndex": 0,
    },
    {
      "question": "What is the capital of Australia?",
      "options": ["Sydney", "Melbourne", "Canberra", "Perth"],
      "correctIndex": 2,
    },
    {
      "question": "What is the sum of first 10 natural numbers?",
      "options": ["45", "50", "55", "60"],
      "correctIndex": 2,
    },
    {
      "question": "Who proposed the theory of relativity?",
      "options": [
        "Isaac Newton",
        "Albert Einstein",
        "Galileo Galilei",
        "Stephen Hawking",
      ],
      "correctIndex": 1,
    },
    {
      "question": "Which planet is the largest in our solar system?",
      "options": ["Jupiter", "Saturn", "Earth", "Mars"],
      "correctIndex": 0,
    },
    {
      "question": "Which is not a mammal?",
      "options": ["Dolphin", "Shark", "Bat", "Elephant"],
      "correctIndex": 1,
    },
    {
      "question": "Who is known as the Father of Computers?",
      "options": ["Charles Babbage", "Alan Turing", "Bill Gates", "Steve Jobs"],
      "correctIndex": 0,
    },
  ];
 @override
void initState() {
  super.initState();

  // ✅ IMPORTANT – initialize questions list
  questions = allQuestions.take(widget.totalQuestions).toList();

  totalSeconds = widget.totalQuestions * 60; // 1 min per question

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
        submitExam(); // auto submit
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

    // If filter is enabled and user already selected, don't allow change
    if (widget.enableFilter && userAnswers.containsKey(currentIndex)) return;

    setState(() {
      selectedOption = index;
      userAnswers[currentIndex] = index;
    });
  }

  void clearSelection() {
    if (isSubmitted) return;
    setState(() {
      selectedOption = -1;
      userAnswers.remove(currentIndex);
    });
  }

  void toggleMarkForReview() {
    setState(() {
      markForReview[currentIndex] = !(markForReview[currentIndex] ?? false);
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
    int totalSeconds = 90 * 60;
    int timeTakenInSeconds = totalSeconds - remainingTime.inSeconds;

    // Navigate to ResultScreen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TestResultScreen(
          totalQuestions: questions.length,
          correct: correctCount, // ✅ must match constructor
          wrong: wrongCount,
          unattempted: unattemptedCount,
          accuracy: accuracy,
          timeTaken: timeTakenInSeconds,
          questions: questions, // ✅ ADD THIS
          userAnswers: userAnswers,
        ),
      ),
    ).then((_) {
      // After ResultScreen closes, notify MockTestScreen to update status
      Navigator.pop(context, true);
    });
  }

  Color getOptionColor(int index) {
    if (!widget.enableFilter) {
      return selectedOption == index ? Colors.blue.shade100 : Colors.white;
    }

    if (userAnswers.containsKey(currentIndex)) {
      int selected = userAnswers[currentIndex]!;
      int correct = questions[currentIndex]["correctIndex"];

      if (index == correct) return Colors.green.shade200;
      if (index == selected && selected != correct) return Colors.red.shade200;
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentIndex];

    return Scaffold(
      endDrawer: buildQuestionDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      if (widget.enableTimer)
        Text(
          timerText,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
    ],
  ),
  actions: [
    if (widget.enableTimer)
      IconButton(
        icon: Icon(
          isPaused ? Icons.play_arrow : Icons.pause,
          color: Colors.black,
        ),
        onPressed: togglePause,
      ),

            if (!isSubmitted)
              ElevatedButton(
                onPressed: submitExam,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("SUBMIT"),
              ),
          ],
        ),
      
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Score summary after submit
            if (isSubmitted)
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      "Score: $correctCount / ${questions.length}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Correct: $correctCount",
                          style: const TextStyle(color: Colors.green),
                        ),
                        Text(
                          "Wrong: $wrongCount",
                          style: const TextStyle(color: Colors.red),
                        ),
                        Text(
                          "Unattempted: $unattemptedCount",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            // Question header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Q ${currentIndex + 1}/${questions.length}",
                  style: const TextStyle(fontSize: 16),
                ),
                if (markForReview[currentIndex] == true)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade200,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      "Marked",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),

            // Question text
            Text(
              question["question"],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),

            // Options
            Expanded(
              child: ListView.builder(
                itemCount: question["options"].length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => selectOption(index),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: getOptionColor(index),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: Text(question["options"][index]),
                  ),
                ),
              ),
            ),

            // Bottom buttons
            // Bottom buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Previous arrow only
                ElevatedButton(
                  onPressed: currentIndex > 0
                      ? () {
                          setState(() {
                            currentIndex--;
                            selectedOption = userAnswers[currentIndex] ?? -1;
                          });
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(Icons.arrow_back),
                ),

                // Clear button with text
                ElevatedButton.icon(
                  icon: const Icon(Icons.clear),
                  label: const Text("Clear"),
                  onPressed: clearSelection,
                ),

                // Mark button with text
                ElevatedButton.icon(
                  icon: const Icon(Icons.flag),
                  label: const Text("Mark"),
                  onPressed: toggleMarkForReview,
                ),

                // Next arrow only
                ElevatedButton(
                  onPressed: currentIndex < questions.length - 1
                      ? () {
                          setState(() {
                            currentIndex++;
                            selectedOption = userAnswers[currentIndex] ?? -1;
                          });
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQuestionDrawer() {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Text(
              "All Questions",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          // Toggle Grid/List inside drawer
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
                    setState(() {
                      isGridView = false;
                    });
                  },
                ),
              ],
            ),
          ),

          // Questions list/grid
          Expanded(
            child: isGridView
                ? GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                        ),
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      Color color = Colors.grey;
                      if (userAnswers.containsKey(index)) {
                        int selected = userAnswers[index]!;
                        int correct = questions[index]["correctIndex"];
                        if (widget.enableFilter) {
                          color = selected == correct
                              ? Colors.green
                              : Colors.red;
                        } else {
                          color = Colors.blue;
                        }
                      }
                      if (markForReview[index] == true) color = Colors.orange;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                            selectedOption = userAnswers[index] ?? -1;
                          });
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          alignment: Alignment.center,
                          child: Text("${index + 1}"),
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
                        int correct = questions[index]["correctIndex"];
                        if (widget.enableFilter) {
                          color = selected == correct
                              ? Colors.green
                              : Colors.red;
                        } else {
                          color = Colors.blue;
                        }
                      }
                      if (markForReview[index] == true) color = Colors.orange;

                      return ListTile(
                        tileColor: color.withOpacity(0.3),
                        title: Text(
                          "Q ${index + 1}: ${questions[index]["question"]}",
                        ),
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                            selectedOption = userAnswers[index] ?? -1;
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
  }
}
