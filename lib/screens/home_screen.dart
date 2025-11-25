import 'package:flutter/material.dart';
import 'package:hydropome/screens/onboarding_screen.dart';
import '../core/constants/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 330,
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: GreenCurveClipper(),
                      child: Container(height: 290, color: AppColor.primary),
                    ),
        
                    Positioned(
                      top: 72,
                      left: 20,
                      right: 20,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Halo Mellafasa!',
                                    style: TextStyle(
                                      color: AppColor.inactiveDot,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Image.asset('assets/tangan.png'),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Berkebun Apa Hari Ini?',
                                style: TextStyle(
                                  color: AppColor.inactiveDot,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage('assets/fotoprofile.png'),
                            backgroundColor: AppColor.greenLight,
                          ),
                        ],
                      ),
                    ),
        
                    Positioned(
                      top: 150,
                      left: 20,
                      right: 20,
                      child: Container(
                        width: 335,
                        height: 177,
                        padding: EdgeInsets.only(top: 35.5, left: 16),
                        decoration: BoxDecoration(
                          color: AppColor.inactiveDot,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2,),
                              spreadRadius: 1, 
                              blurRadius: 2, 
                              offset: Offset(1, 2), 
                            )
                          ]
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Belum Ada Progress\nTanaman Hari Ini…",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    wordSpacing: 2,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Ayo pilih tanaman pertama kamu\ndan mulai tanam sekarang!",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    wordSpacing: 4,
                                  ),
                                ),
                              ],
                            ),
                            Image.asset("assets/daun.png", width: 148),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
             SizedBox(height: 20),
        
              Container(
                width: 370,
                height: 58,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Cari Tanaman...",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset('assets/search.png'),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(244, 245, 247, 1),
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
              SizedBox(height: 17,),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: Row(
                  children: [
                    Text('Rekomendasi Untukmu',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),
                    ),
                    Spacer(),
                    Text('lihat semua',
                    style: TextStyle(
                        color: AppColor.activeDot,
                        fontSize: 14
                    ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16,),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  PlantCard(
                    judul: 'Selada Hidroponik', 
                    gambar: 'assets/tanaman1.png', 
                    kesulitan: 'Mudah', 
                    warnakesulitan: AppColor.activeDot, 
                    durasi: '3-5 Ming'),
                  PlantCard(
                    judul: 'Bayam Hidroponik', 
                    gambar: 'assets/tanaman2.png', 
                    kesulitan: 'Mudah', 
                    warnakesulitan: AppColor.activeDot, 
                    durasi: '3-4 Ming'),
                  PlantCard(
                    judul: 'Pakcoy Hidroponik', 
                    gambar: 'assets/tanaman3.png', 
                    kesulitan: 'Mudah', 
                    warnakesulitan: AppColor.activeDot, 
                    durasi: '4-5 Ming'),
                  PlantCard(
                    judul: 'Tomat Cherry',
                    gambar: 'assets/tanaman4.png',
                    kesulitan: 'Sedang',
                    warnakesulitan: Color.fromRGBO(229, 108, 63, 100),
                    durasi: '8-10 Ming',),
                  PlantCard(
                    judul: 'Seledri Hidroponik',
                    gambar: 'assets/tanaman5.png',
                    kesulitan: 'Sedang',
                    warnakesulitan: Color.fromRGBO(229, 108, 63, 100),
                    durasi: '5-6 Ming',),
                  PlantCard(
                    judul: 'Stroberi Hidroponik',
                    gambar: 'assets/tanaman6.png',
                    kesulitan: 'Sulit',
                    warnakesulitan: Color.fromRGBO(193, 1, 1, 100),
                    durasi: '12-16 Ming',
                  ),
                ],
              ),
              SizedBox(height: 36,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Text('Starter  Kit Flash Sale 🔥',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(width: 12,),
                    Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColor.activeDot,
                      ),
                      alignment: Alignment.center,
                      child: Text('01',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColor.inactiveDot,
                      ),
                      ),
                    ),
                    SizedBox(width: 2,),
                    Text(':',
                    style: TextStyle(fontSize: 12, color: AppColor.activeDot),
                    ),
                    SizedBox(width: 2,),
                    Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColor.activeDot,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '20',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColor.inactiveDot,
                        ),
                      ),
                    ),
                    SizedBox(width: 2),
                    Text(
                      ':',
                      style: TextStyle(fontSize: 12, color: AppColor.activeDot),
                    ),
                    SizedBox(width: 2),
                    Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColor.activeDot,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '47',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColor.inactiveDot,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16,),
              SizedBox(
                height: 231, 
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 20),
                  children: const [
                    ProductSales(
                      judul: 'Paket Pipa NFT',
                      gambar: 'assets/paket1.png',
                      paket: 'Starter Kit',
                      harga: 'Rp 125.000',
                      diskon: 'Rp 150.000',
                    ),
                    SizedBox(width: 16),
                    ProductSales(
                      judul: 'Paket Lengkap',
                      gambar: 'assets/paket2.png',
                      paket: 'Starter Kit',
                      harga: 'Rp 55.000',
                      diskon: 'Rp 75.000',
                    ),
                    SizedBox(width: 16),
                    ProductSales(
                      judul: 'Basic Starter Kit',
                      gambar: 'assets/paket3.png',
                      paket: 'Starter Kit',
                      harga: 'Rp 25.000',
                      diskon: 'Rp 50.000',
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

class ProductSales extends StatelessWidget{
  final String judul;
  final String gambar;
  final String paket;
  final String harga;
  final String diskon;

  const ProductSales({
    super.key,
    required this.judul,
    required this.gambar,
    required this.paket,
    required this.harga,
    required this.diskon,
  });

  @override
  Widget build(BuildContext context){
    return Card(
      color: AppColor.inactiveDot,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: (){
          print('njay');
        },
        child: Container(
          width: 170,
          padding: EdgeInsets.only(left: 14, top: 14, bottom: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(gambar),
              SizedBox(height: 6,),
              Text(paket,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
              Text(judul,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4,),
              Row(
                children: [
                  Text(harga,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.activeDot,
                    ),
                  ),
                  SizedBox(width: 4,),
                  Text(diskon,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}

class PlantCard extends StatelessWidget{
  final String judul;
  final String gambar;
  final String kesulitan;
  final Color warnakesulitan;
  final String durasi;

  const PlantCard({
    super.key,
    required this.judul,
    required this.gambar,
    required this.kesulitan,
    required this.warnakesulitan,
    required this.durasi,
  });

  @override
  Widget build(BuildContext context){
    return Card(
      color: AppColor.inactiveDot,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: (){
          print('njay');
        },
        child: Container(
          width: 170,
          padding: EdgeInsets.only(
            left: 14,
            top: 14,
            bottom: 14
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                gambar,
              ),
              SizedBox(height: 8,), 
              Text(judul,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8,),
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
                  SizedBox(width: 8),
                  Icon(Icons.access_time_filled, size: 14, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(
                    durasi,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
        ),
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


