import 'package:flutter/material.dart';
import 'profile_page.dart';

class InputCVPage extends StatefulWidget {
  const InputCVPage({super.key});

  @override
  State<InputCVPage> createState() => _InputCVPageState();
}

class _InputCVPageState extends State<InputCVPage> {
  final nama = TextEditingController();
  final summary = TextEditingController();

  List<TextEditingController> expControllers = [TextEditingController()];

  List<TextEditingController> eduControllers = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Input CV")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// NAMA
            TextField(
              controller: nama,
              decoration: const InputDecoration(labelText: "Nama"),
            ),

            /// SUMMARY
            TextField(
              controller: summary,
              decoration: const InputDecoration(labelText: "Summary"),
            ),

            const SizedBox(height: 20),

            /// EXPERIENCE
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Experience",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            ...expControllers.asMap().entries.map((entry) {
              int index = entry.key;
              return Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: expControllers[index],
                      decoration: InputDecoration(
                        hintText: "Experience ${index + 1}",
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        expControllers.removeAt(index);
                      });
                    },
                  ),
                ],
              );
            }),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  expControllers.add(TextEditingController());
                });
              },
              child: const Text("Tambah Experience"),
            ),

            const SizedBox(height: 20),

            /// EDUCATION
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Education",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            ...eduControllers.asMap().entries.map((entry) {
              int index = entry.key;
              return Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: eduControllers[index],
                      decoration: InputDecoration(
                        hintText: "Education ${index + 1}",
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        eduControllers.removeAt(index);
                      });
                    },
                  ),
                ],
              );
            }),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  eduControllers.add(TextEditingController());
                });
              },
              child: const Text("Tambah Education"),
            ),

            const SizedBox(height: 30),

            /// SUBMIT
            ElevatedButton(
              onPressed: () {
                List<String> experiences = expControllers
                    .map((e) => e.text)
                    .toList();

                List<String> educations = eduControllers
                    .map((e) => e.text)
                    .toList();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      nama: nama.text,
                      summary: summary.text,
                      experiences: experiences,
                      educations: educations,
                    ),
                  ),
                );
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
