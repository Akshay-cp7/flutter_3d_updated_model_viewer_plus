import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: addButtons(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              const Image(
                image: AssetImage('assets/buds/image.png'),
                width: double.infinity,
                height: 430,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: IconButton(
                  icon: const Icon(
                    Icons.view_in_ar,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '  Awesome earbuds',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Get ready to immerse yourself in pure sound bliss with our Awesome Earbuds! These sleek, stylish, and feature-packed earbuds are designed to take your music experience to the next level.',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          const Image(
            image: AssetImage('assets/buds/reviews.jpg'),
            width: double.infinity,
            height: 200,
          ),
        ],
      ),
    );
  }

  Row addButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: Colors.white,
              side: const BorderSide(width: 2, color: Colors.yellow),
            ),
            onPressed: () {
              // Add to Cart logic here
            },
            child: const Text(
              'Add to Cart',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: Colors.yellow,
            ),
            onPressed: () {
              // Buy Now logic here
            },
            child: const Text(
              'Buy Now',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('View in 3D'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Expanded(
            child: ModelViewer(
              backgroundColor: Colors.white,
              src: 'assets/buds/earbud.glb',
              alt: 'A 3D model of an earbud',
              ar: true,
              autoRotate: true,
              disableZoom: true,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20),
                          backgroundColor: Colors.white,
                          side:
                              const BorderSide(width: 2, color: Colors.yellow),
                        ),
                        onPressed: () {
                          // Add to Cart logic here
                        },
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20),
                          backgroundColor: Colors.yellow,
                        ),
                        onPressed: () {
                          // Buy Now logic here
                        },
                        child: const Text(
                          'Buy Now',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
