import 'package:flutter/material.dart';
import 'package:hydropome/core/constants/app_color.dart';
import 'package:hydropome/screens/laman_taman.dart';

class DetailSeladaScreen extends StatelessWidget {
  const DetailSeladaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Pantau Tanaman",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Center(
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
        leadingWidth: 72,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
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
                padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Selada Hidroponik',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Icon(Icons.circle, color: AppColor.activeDot, size: 12),
                        SizedBox(width: 4,),
                        Text('Mudah',
                          style: TextStyle(
                            color: AppColor.activeDot,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(width: 16,),
                        Image.asset('assets/daunkecil.png'),
                        SizedBox(width: 4,),
                        Text('Hari ke-1')
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColor.inactiveDot,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          )
                        ]
                      ),
                      child: Row( 
                        children: [
                          Expanded( 
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4, top: 4, bottom: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Progres Menanam',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(height: 12,),
                                  Text('Ayo mulai menanam!'),
                                  SizedBox(height: 8),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 9,
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(255, 245, 233, 100),
                                          borderRadius: BorderRadius.circular(45)
                                        ),
                                      ),
                                      Container(
                                        height: 9,
                                        width: 10,
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(255, 140, 0, 1),
                                          borderRadius: BorderRadius.circular(50)
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Text('0% Selesai',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 35,),
                          Image.asset('assets/dauncut.png')
                        ],
                      ),
                    ),
                    SizedBox(height: 28,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _hariButton(label: "Hari", nomor: "01", active: true),
                          SizedBox(width: 12),
                          _hariButton(label: "Hari", nomor: "02"),
                          SizedBox(width: 12),
                          _hariButton(label: "Hari", nomor: "03"),
                          SizedBox(width: 12),
                          _hariButton(label: "Hari", nomor: "04"),
                          SizedBox(width: 12),
                          _hariButton(label: "Hari", nomor: "05"),
                          SizedBox(width: 12),
                          _hariButton(label: "Hari", nomor: "06"),
                          SizedBox(width: 12),
                          _hariButton(label: "Hari", nomor: "07"),
                          SizedBox(width: 12),
                          _hariButton(label: "Hari", nomor: "08"),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),

                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("📌 ", style: TextStyle(fontSize: 16)),
                              Text(
                                "Tugas Hari ke–1",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 16),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: AppColor.activeDot,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                "Siapkan Nutrisi & Air 🧪",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: Colors.black45,
                                    width: 2,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                "Rendam Rockwool 🧼",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: Colors.black45,
                                    width: 2,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                "Tanam Benih Selada 🌱",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: Colors.black45,
                                    width: 2,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                "Tutup & Simpan ☁️",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          SizedBox(height: 24),
                          Row(
                            children: [
                              Image.asset('assets/daunkecil.png'),
                              SizedBox(width: 4,),
                              Text(
                                "Tips Hari Ini:",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 8),

                          Text(
                            "Gunakan air tanpa kaporit untuk hasil terbaik!",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24,),
                    Image.asset('assets/iklan.png'),
                    SizedBox(height: 38,),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlantDetailScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColor.greenLight,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColor.activeDot,
                            width: 1.5, 
                          )
                        ),
                        child: Center(child: Text('Lihat Panduan',
                          style: TextStyle(
                            color: AppColor.activeDot,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                    SizedBox(height: 12,),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20,), 
                              ),
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(24.0,), 
                                child: Column(
                                  mainAxisSize: MainAxisSize.min, 
                                  children: [
                                    SizedBox(height: 10),
                                    Image.asset('assets/verif.png'),
                                    SizedBox(height: 20),
                                    const Text(
                                      "Tugas Hari ke-1 Selesai 🎉",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 30),

                                    SizedBox(
                                      width: double
                                          .infinity, // Agar tombol lebar penuh
                                      height: 50,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColor.activeDot,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12,),
                                          ),
                                          elevation: 0,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "Hari Berikutnya",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 12,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColor.greenLight, // Background hijau sangat muda
                                          foregroundColor: AppColor.activeDot, // Warna teks hijau
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12,),
                                          ),
                                          elevation: 0,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context); 
                                          Navigator.pop(context); 
                                        },
                                        child: const Text(
                                          "Kembali",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColor.activeDot,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(child: Text('Hari ke-1 Selesai',
                            style: TextStyle(
                              color: AppColor.inactiveDot,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                    ),                     
                  ],
                ),
              ),
            ]
          )
        ),
      )
    );
  }
}

Widget _hariButton({
  required String label,
  required String nomor,
  bool active = false,
}) {
  return Container(
    width: 54,
    height: 64,
    decoration: BoxDecoration(
      color: active ? AppColor.activeDot : AppColor.greenLight,
      borderRadius: BorderRadius.circular(54)
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: active ? Colors.white : Color(0xFF009F74),
          ),
        ),
        Text(
          nomor,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: active ? Colors.white : Color(0xFF009F74),
          ),
        ),
      ],
    ),
  );
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
