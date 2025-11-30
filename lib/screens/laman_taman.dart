import 'package:flutter/material.dart';
import 'package:hydropome/core/constants/app_color.dart';

class PlantDetailScreen extends StatelessWidget {
  const PlantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 48,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: EdgeInsets.only(left: 8, top: 8, bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Icon(Icons.arrow_back, color: Colors.black, size: 22),
          ),
        ),
      ),


      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: GreenCurveClipper(),
              child: SizedBox(
                height: 330,
                width: double.infinity,
                child: Image.asset(
                  'assets/detailSelada.png', 
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Selada Hidroponik",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 8),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  // Kesulitan
                  Icon(Icons.circle, color: AppColor.activeDot, size: 12),
                  SizedBox(width: 6),
                  Text(
                    "Mudah",
                    style: TextStyle(
                      color: AppColor.activeDot,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(width: 16),
                  Icon(Icons.access_time_filled, size: 14, color: Colors.grey),
                  SizedBox(width: 6),
                  Text("3–5 Ming", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),

            SizedBox(height: 20),

            _sectionTitle("Deskripsi"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Selada merupakan salah satu tanaman paling populer dalam budidaya hidroponik karena pertumbuhannya yang cepat dan perawatannya yang mudah. "
                "Tanaman ini cocok untuk pemula karena tidak memerlukan banyak nutrisi khusus atau perawatan intensif. "
                "Selada tumbuh subur di sistem hidroponik seperti NFT (Nutrient Film Technique) dan "
                "dapat dipanen dalam waktu 3–5 minggu setelah tanam.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 20),
            _sectionTitle("Alat dan Bahan"),

           Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  items.length,
                  (index) => numberedItem(index + 1, items[index]),
                ),
              ),
            ),

            const SizedBox(height: 20),
            _sectionTitle("Tutorial Menanam"),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                color: AppColor.inactiveDot,
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    8,
                  ), 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 170,
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/tutorial.png',
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.play_arrow,
                                size: 40,
                                color: AppColor.activeDot,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),
                      const Text(
                        "Menanam Selada Hidroponik",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 49),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.activeDot,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                  },
                  child: const Text(
                    "Mulai Tanam dan Pantau",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ======================= COMPONENTS =========================

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ),
    );
  }
}

Widget numberedItem(int number, String text) {
  final parts = text.split("–"); // pisah sebelum & sesudah tanda dash

  return Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$number. ", style: const TextStyle(fontSize: 14, height: 1.3)),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                height: 1.3,
              ),
              children: [
                TextSpan(
                  text: parts[0].trim(), // judul
                  style: const TextStyle(
                    fontWeight: FontWeight.bold, // BOLD di sini
                  ),
                ),
                if (parts.length > 1)
                  TextSpan(
                    text: " – ${parts[1].trim()}", // deskripsi
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

final List<String> items = [
  "Wadah atau Bak Tanam – Tempat air nutrisi dan tanaman diletakkan.",
  "Net Pot / Pot kecil berlubang – Untuk menanam tanaman dengan media tanam.",
  "Spons/Rockwool – Media tanam tempat benih tumbuh.",
  "Pompa Air (untuk NFT) – Mengalirkan nutrisi secara sirkulasi.",
  "Penutup atau Styrofoam (untuk rakit apung) – Untuk menopang netpot.",
  "Alat ukur pH dan TDS – Untuk memantau kualitas larutan nutrisi.",
  "Benih selada.",
  "Nutrisi AB Mix.",
  "Air bersih.",
];


class GreenCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 50);

    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 50,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _bullet extends StatelessWidget {
  final String text;

  const _bullet(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("•  ", style: TextStyle(fontSize: 16)),
          Expanded(
            child: Text(text, style: TextStyle(fontSize: 14, height: 1.5)),
          ),
        ],
      ),
    );
  }
}
