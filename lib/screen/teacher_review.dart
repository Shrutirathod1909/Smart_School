import 'package:flutter/material.dart';

/// 🎨 ORBIT COLORS (Updated Multi Color Theme)
class AppColors {
  static const Color orbitDarkBlue = Color(0xff0D47A1);
  static const Color orbitBlue = Color(0xff1565C0);
  static const Color orbitPurple = Color(0xff8E24AA);

  static const Color orbitGreen = Color(0xff2E7D32);
  static const Color orbitOrange = Color(0xffF57C00);
  static const Color orbitRed = Color(0xffC62828);

  static const Color orbitSky = Color(0xffE3F2FD);
}

class ProfessionalTeacherReview extends StatefulWidget {
  const ProfessionalTeacherReview({super.key});

  @override
  State<ProfessionalTeacherReview> createState() =>
      _ProfessionalTeacherReviewState();
}

class _ProfessionalTeacherReviewState
    extends State<ProfessionalTeacherReview> {
  List<Map<String, dynamic>> reviews = [];

  void openReviewForm({int? editIndex}) {
    int teaching = editIndex != null ? reviews[editIndex]["teaching"] : 0;
    int communication =
        editIndex != null ? reviews[editIndex]["communication"] : 0;
    int behavior = editIndex != null ? reviews[editIndex]["behavior"] : 0;

    TextEditingController nameController = TextEditingController(
        text: editIndex != null ? reviews[editIndex]["name"] : "");
    TextEditingController professionController = TextEditingController(
        text: editIndex != null ? reviews[editIndex]["profession"] : "");
    TextEditingController commentController = TextEditingController(
        text: editIndex != null ? reviews[editIndex]["comment"] : "");

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {

            Widget buildStars(
                int value, Function(int) onChanged, Color activeColor) {
              return Row(
                children: List.generate(
                  5,
                  (index) => IconButton(
                    icon: Icon(
                      Icons.star,
                      color: index < value
                          ? activeColor
                          : Colors.grey.shade300,
                    ),
                    onPressed: () =>
                        setModalState(() => onChanged(index + 1)),
                  ),
                ),
              );
            }

            InputDecoration inputStyle(String hint) {
              return InputDecoration(
                hintText: hint,
                filled: true,
                fillColor: AppColors.orbitSky,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              );
            }

            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// 🟣 Title
                    Center(
                      child: Text(
                        "Teacher Review",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.orbitPurple,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Text("Teacher Name"),
                    TextField(
                      controller: nameController,
                      decoration: inputStyle("Enter teacher name"),
                    ),
                    const SizedBox(height: 15),

                    const Text("Profession / Subject"),
                    TextField(
                      controller: professionController,
                      decoration: inputStyle("Enter subject"),
                    ),
                    const SizedBox(height: 15),

                    const Text("Teaching Quality"),
                    buildStars(teaching, (val) => teaching = val,
                        AppColors.orbitGreen),

                    const Text("Communication"),
                    buildStars(communication, (val) => communication = val,
                        AppColors.orbitOrange),

                    const Text("Behavior & Support"),
                    buildStars(behavior, (val) => behavior = val,
                        AppColors.orbitRed),

                    const SizedBox(height: 10),

                    const Text("Comment"),
                    TextField(
                      controller: commentController,
                      decoration: inputStyle("Write your review..."),
                      maxLines: 3,
                    ),

                    const SizedBox(height: 20),

                    /// 🔵 Submit Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orbitBlue,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (nameController.text.isEmpty ||
                            professionController.text.isEmpty ||
                            teaching == 0 ||
                            communication == 0 ||
                            behavior == 0) return;

                        setState(() {
                          reviews.add({
                            "name": nameController.text,
                            "profession": professionController.text,
                            "teaching": teaching,
                            "communication": communication,
                            "behavior": behavior,
                            "comment": commentController.text,
                          });
                        });

                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildStarDisplay(int rating, Color color) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star,
          size: 16,
          color: index < rating ? color : Colors.grey.shade300,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orbitSky,

      /// 🔵 AppBar
      appBar: AppBar(
        title: const Text("Teacher Reviews",
            style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.orbitDarkBlue,
      ),

      body: reviews.isEmpty
          ? Center(
              child: Text(
                "No Reviews Yet",
                style: TextStyle(
                  color: AppColors.orbitPurple,
                  fontSize: 18,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                var review = reviews[index];

                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 5,
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.orbitBlue,
                              child: const Icon(Icons.person,
                                  color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                review["name"],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.orbitPurple,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete,
                                  color: AppColors.orbitRed),
                            )
                          ],
                        ),

                        const SizedBox(height: 10),
                        const Text("Teaching"),
                        buildStarDisplay(
                            review["teaching"], AppColors.orbitGreen),
                        const Text("Communication"),
                        buildStarDisplay(
                            review["communication"], AppColors.orbitOrange),
                        const Text("Behavior"),
                        buildStarDisplay(
                            review["behavior"], AppColors.orbitRed),

                        const SizedBox(height: 8),
                        Text(review["comment"].isEmpty
                            ? "No Comment"
                            : review["comment"]),
                      ],
                    ),
                  ),
                );
              },
            ),

      /// 🔵 FAB
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.orbitBlue,
        onPressed: () => openReviewForm(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}