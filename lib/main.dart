import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int corbaNo = 0;
  int yemekNo = 0;
  int tatliNo = 0;

  final List<FoodCategory> corbalar = [
    FoodCategory('Mercimek Çorbası', 'assets/corba_1.jpg'),
    FoodCategory('Tarhana Çorbası', 'assets/corba_2.jpg'),
    FoodCategory('Tavuk Suyu Çorbası', 'assets/corba_3.jpg'),
    FoodCategory('Düğün Çorbası', 'assets/corba_4.jpg'),
    FoodCategory('Yoğurtlu Çorba', 'assets/corba_5.jpg'),
  ];

  final List<FoodCategory> yemekler = [
    FoodCategory('Karnıyarık', 'assets/yemek_1.jpg'),
    FoodCategory('Mantı', 'assets/yemek_2.jpg'),
    FoodCategory('Kuru Fasulye', 'assets/yemek_3.jpg'),
    FoodCategory('İçli Köfte', 'assets/yemek_4.jpg'),
    FoodCategory('Pilav Üstü Tavuk', 'assets/yemek_5.jpg'),
  ];

  final List<FoodCategory> tatlilar = [
    FoodCategory('Kadayıf', 'assets/tatli_1.jpg'),
    FoodCategory('Baklava', 'assets/tatli_2.jpg'),
    FoodCategory('Sütlaç', 'assets/tatli_3.jpg'),
    FoodCategory('Kazandibi', 'assets/tatli_4.jpg'),
    FoodCategory('Dondurma', 'assets/tatli_5.jpg'),
  ];

  void rastgeleCorbaSec() {
    setState(() {
      corbaNo = Random().nextInt(corbalar.length);
    });
  }

  void rastgeleYemekSec() {
    setState(() {
      yemekNo = Random().nextInt(yemekler.length);
    });
  }

  void rastgeleTatliSec() {
    setState(() {
      tatliNo = Random().nextInt(tatlilar.length);
    });
  }

  void hepsiniDegistir() {
    setState(() {
      corbaNo = Random().nextInt(corbalar.length);
      yemekNo = Random().nextInt(yemekler.length);
      tatliNo = Random().nextInt(tatlilar.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Bugün Ne Yesem?'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: _buildFoodCard(
              context,
              corbalar[corbaNo],
              Colors.blue[50]!,
              rastgeleCorbaSec,
            ),
          ),
          _buildDivider(),
          Expanded(
            child: _buildFoodCard(
              context,
              yemekler[yemekNo],
              Colors.green[50]!,
              rastgeleYemekSec,
            ),
          ),
          _buildDivider(),
          Expanded(
            child: _buildFoodCard(
              context,
              tatlilar[tatliNo],
              Colors.pink[50]!,
              rastgeleTatliSec,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: hepsiniDegistir,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Yeni Öğün Öner',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey[300],
      indent: 32,
      endIndent: 32,
    );
  }

  Widget _buildFoodCard(
      BuildContext context,
      FoodCategory food,
      Color bgColor,
      VoidCallback onTap,
      ) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        food.imagePath,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          food.category,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: onTap,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.deepPurple,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            side: const BorderSide(color: Colors.deepPurple),
                          ),
                          child: const Text('VEYA'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FoodCategory {
  final String category;
  final String imagePath;

  FoodCategory(this.category, this.imagePath);
}