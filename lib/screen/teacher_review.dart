import 'package:flutter/material.dart';

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
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            Widget buildStars(int value, Function(int) onChanged) {
              return Row(
                children: List.generate(
                  5,
                  (index) => IconButton(
                    icon: Icon(
                      Icons.star,
                      color: index < value
                          ? Colors.orange
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
                fillColor: Colors.grey.shade100,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
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
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "Teacher Review",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),

                      const Text("Teacher Name"),
                      const SizedBox(height: 6),
                      TextField(
                        controller: nameController,
                        decoration:
                            inputStyle("Enter teacher name"),
                      ),

                      const SizedBox(height: 15),

                      const Text("Profession / Subject"),
                      const SizedBox(height: 6),
                      TextField(
                        controller: professionController,
                        decoration:
                            inputStyle("Enter subject or profession"),
                      ),

                      const SizedBox(height: 15),

                      const Text("Teaching Quality"),
                      buildStars(teaching, (val) => teaching = val),

                      const Text("Communication"),
                      buildStars(
                          communication, (val) => communication = val),

                      const Text("Behavior & Support"),
                      buildStars(behavior, (val) => behavior = val),

                      const SizedBox(height: 10),

                      const Text("Comment"),
                      const SizedBox(height: 6),
                      TextField(
                        controller: commentController,
                        decoration:
                            inputStyle("Write your review..."),
                        maxLines: 3,
                      ),

                      const SizedBox(height: 20),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFF393939),
                          minimumSize:
                              const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (nameController.text.isEmpty ||
                              professionController.text.isEmpty ||
                              teaching == 0 ||
                              communication == 0 ||
                              behavior == 0) {
                            return;
                          }

                          setState(() {
                            if (editIndex != null) {
                              reviews[editIndex] = {
                                "name": nameController.text,
                                "profession":
                                    professionController.text,
                                "teaching": teaching,
                                "communication": communication,
                                "behavior": behavior,
                                "comment":
                                    commentController.text,
                              };
                            } else {
                              reviews.add({
                                "name": nameController.text,
                                "profession":
                                    professionController.text,
                                "teaching": teaching,
                                "communication": communication,
                                "behavior": behavior,
                                "comment":
                                    commentController.text,
                              });
                            }
                          });

                          Navigator.pop(context);
                        },
                        child: Text(
                          editIndex != null ? "Update" : "Submit",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildStarDisplay(int rating) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star,
          size: 16,
          color: index < rating
              ? Colors.orange
              : Colors.grey.shade300,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Teacher Reviews",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF383839),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: reviews.isEmpty
          ? const Center(
              child: Text(
                "No Reviews Yet",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
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
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 25,
                              backgroundColor:
                                  Color(0xFF5C5C5D),
                              child: Icon(Icons.person,
                                  color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(review["name"],
                                      style: const TextStyle(
                                          fontWeight:
                                              FontWeight.bold,
                                          fontSize: 16)),
                                  Text(review["profession"],
                                      style: TextStyle(
                                          color: Colors
                                              .grey.shade600)),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () =>
                                  openReviewForm(
                                      editIndex: index),
                              icon: const Icon(Icons.edit,
                                  color: Colors.blue),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  reviews.removeAt(index);
                                });
                              },
                              icon: const Icon(Icons.delete,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text("Teaching"),
                        buildStarDisplay(review["teaching"]),
                        const Text("Communication"),
                        buildStarDisplay(review["communication"]),
                        const Text("Behavior"),
                        buildStarDisplay(review["behavior"]),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF464646),
        onPressed: () => openReviewForm(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}