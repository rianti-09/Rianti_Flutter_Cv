import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter_application_2/page/input_cv.dart';

class BerandaPage extends StatefulWidget {
  final Function({
    required String newNama,
    required String newSummary,
    required List<String> newExperiences,
    required List<String> newEducations,
  })?
  onSubmit;

  const BerandaPage({super.key, this.onSubmit});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beranda"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ================= DELETE =================
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.all(14),
                  ),
                  onPressed: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.warning,
                      animType: AnimType.scale,
                      title: "Yakin?",
                      desc: "Hapus data?",
                      btnOkOnPress: () {
                        CherryToast.success(
                          title: const Text("Data berhasil dihapus"),
                        ).show(context);
                      },
                      btnCancelOnPress: () {},
                    ).show();
                  },
                  child: const Text("Delete"),
                ),
              ),

              const SizedBox(height: 15),

              // ================= SHOW DIALOG =================
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    padding: const EdgeInsets.all(14),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Alert"),
                        content: const Text("Ini Alert Dialog"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Tutup"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text("Show Dialog"),
                ),
              ),

              const SizedBox(height: 20),

              // ================= INPUT CV =================
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.all(14),
                  ),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InputCVPage(),
                      ),
                    );

                    if (result != null) {
                      widget.onSubmit?.call(
                        newNama: result["nama"],
                        newSummary: result["summary"],
                        newExperiences: List<String>.from(
                          result["experiences"],
                        ),
                        newEducations: List<String>.from(result["educations"]),
                      );
                    }
                  },
                  child: const Text("Input CV"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
