import 'package:flutter/material.dart';
import 'beranda_page.dart';
import 'input_cv.dart';

// ================= PROFILE (ADA DATA) =================
class ProfilePage extends StatefulWidget {
  final String nama;
  final String summary;
  final List<String> experiences;
  final List<String> educations;

  const ProfilePage({
    super.key,
    required this.nama,
    required this.summary,
    required this.experiences,
    required this.educations,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool showDetail = false;
  int _selectedIndex = 2; // posisi profile

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BerandaPage()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const InputCVPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),

      // ================= BOTTOM NAVBAR =================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Input CV'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // ================= HEADER =================
            SizedBox(
              height: 220,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/banner.jpeg.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Container(height: 150, color: Colors.black.withOpacity(0.3)),

                  Positioned(
                    bottom: 0,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          "assets/images/rianti.jpeg.jpeg",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // ================= NAMA =================
            Text(
              widget.nama,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            const Text(
              "Jakarta, Indonesia\nFlutter Software Engineer",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            // ================= BUTTON =================
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: () {
                setState(() {
                  showDetail = !showDetail;
                });
              },
              child: Text(
                showDetail ? "Sembunyikan Detail" : "Detail",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ================= DETAIL =================
            if (showDetail) ...[
              _sectionTitle("Summary"),
              _sectionContent(widget.summary),

              const SizedBox(height: 10),

              _sectionTitle("Experience"),
              ...widget.experiences.map((exp) {
                return _listTile(Icons.work, exp);
              }),

              const SizedBox(height: 10),

              _sectionTitle("Pendidikan"),
              ...widget.educations.map((edu) {
                return _listTile(Icons.school, edu);
              }),

              const SizedBox(height: 20),
            ],
          ],
        ),
      ),
    );
  }

  // ================= HELPER =================
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _sectionContent(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Align(alignment: Alignment.centerLeft, child: Text(text)),
    );
  }

  Widget _listTile(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}

// ================= PROFILE KOSONG =================
class EmptyProfilePage extends StatelessWidget {
  const EmptyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text(
          "Belum ada data CV\nSilakan isi di menu Input CV",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
