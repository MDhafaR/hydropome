import 'package:flutter/material.dart';
import 'package:hydropome/core/constants/app_color.dart';
import 'package:hydropome/screens/pantau_detail_screen.dart';

class PantauTanamanScreen extends StatefulWidget {
  const PantauTanamanScreen({super.key});

  @override
  State<PantauTanamanScreen> createState() => _PantauTanamanScreenState();
}

class _PantauTanamanScreenState extends State<PantauTanamanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.inactiveDot,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 240,
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: GreenCurveClipper(),
                      child: Container(height: 290, color: AppColor.primary),
                    ),
                    Positioned(
                      top: 88,
                      left: 20, 
                      child: Row(
                        children: [
                          Text('Bagaimana Kabar\nTanamanmu Hari Ini?',
                          style: TextStyle(
                            color: AppColor.inactiveDot,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                          ),
                          SizedBox(width: 80,),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 60,
                      right: 20,
                      child: Image.asset('assets/daun.png'),
                    ),
                    Positioned(
                      top: 172,
                      right: 20,
                      child: Container(
                        width: 370,
                        height: 58,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(247, 248, 249, 1),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                0.10,
                              ), 
                              blurRadius: 10, 
                              spreadRadius: 1,
                              offset: Offset(
                                0,
                                3,
                              ), 
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Cari Tanaman...",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset('assets/search.png'),
                            ),
                            filled: true,
                            fillColor: Color.fromRGBO(247, 248, 249, 1),
                            contentPadding: EdgeInsets.symmetric(vertical: 14),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                padding: const EdgeInsets.only(top: 12, left:  12.0, right: 12.0, bottom: 12),
                decoration: BoxDecoration(
                  color: AppColor.inactiveDot,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daftar Tanamanmu',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Tanaman(
                      gambar: 'assets/tanamankec1.png',
                      judul: 'Selada Hidroponik',
                      kesulitan: 'Mudah',
                      warnakesulitan: AppColor.activeDot,
                      hari: 'Hari ke-1',
                      pageTujuan: DetailSeladaScreen(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.0),
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                    ),
                    Tanaman(
                      gambar: 'assets/tanamankec2.png',
                      judul: 'Bayam Hidroponik',
                      kesulitan: 'Mudah',
                      warnakesulitan: AppColor.activeDot,
                      hari: 'Hari ke-5',
                      pageTujuan: const Placeholder(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.0),
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                    ),
                    Tanaman(
                      gambar: 'assets/tanamankec3.png',
                      judul: 'Selada Hidroponik',
                      kesulitan: 'Sulit',
                      warnakesulitan: Color.fromRGBO(193, 1, 1, 100),
                      hari: 'Hari ke-10',
                      pageTujuan: const Placeholder(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                padding: const EdgeInsets.only(top: 12, left:  12.0, right: 12.0, bottom: 12),
                decoration: BoxDecoration(
                  color: AppColor.inactiveDot,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Riwayat',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Tanaman(
                      gambar: 'assets/tanamankec1.png',
                      judul: 'Selada Hidroponik',
                      kesulitan: 'Mudah',
                      warnakesulitan: AppColor.activeDot,
                      hari: 'Hari ke-1',
                      pageTujuan: DetailSeladaScreen() ,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.0),
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                    ),
                    Tanaman(
                      gambar: 'assets/tanamankec2.png',
                      judul: 'Bayam Hidroponik',
                      kesulitan: 'Mudah',
                      warnakesulitan: AppColor.activeDot,
                      hari: 'Hari ke-5',
                      pageTujuan: const Placeholder(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.0),
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                    ),
                    Tanaman(
                      gambar: 'assets/tanamankec3.png',
                      judul: 'Selada Hidroponik',
                      kesulitan: 'Sulit',
                      warnakesulitan: Color.fromRGBO(193, 1, 1, 100),
                      hari: 'Hari ke-10',
                      pageTujuan: const Placeholder(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class Tanaman extends StatelessWidget {
  final String gambar;
  final String judul;
  final String kesulitan;
  final Color warnakesulitan;
  final String hari;
  final Widget pageTujuan;

  const Tanaman({
    super.key,
    required this.gambar,
    required this.judul,
    required this.kesulitan,
    required this.warnakesulitan,
    required this.hari,
    required this.pageTujuan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.only(top: 12,right: 12,bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              gambar,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 8),

               Row(
                children: [
                  Icon(Icons.circle, color: warnakesulitan, size: 10),
                  SizedBox(width: 4),
                  Text(kesulitan, 
                  style: TextStyle(
                    fontSize: 12,
                    color: kesulitan == 'Mudah'
                      ? AppColor.activeDot
                      : kesulitan == 'Sedang'
                        ? Color.fromRGBO(229, 108, 63, 100)
                        : Color.fromRGBO(193, 1, 1, 100)
                    )
                  ),
                ],
              ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    Image.asset('assets/daunkecil.png', width: 13),
                    const SizedBox(width: 5),
                    Text(
                      hari,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => pageTujuan),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.activeDot,
              elevation: 0,
              minimumSize: const Size(60, 34),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Pantau",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}



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
