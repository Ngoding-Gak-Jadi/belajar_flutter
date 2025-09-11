import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String userEmail;
  final String userPass;

  final List<String> animeList = [
    "Naruto Shippuden",
    "One Piece",
    "Attack on Titan",
    "Demon Slayer",
    "Jujutsu Kaisen",
    "Fullmetal Alchemist",
    "Tokyo Ghoul",
    "Bleach",
    "Death Note",
    "My Hero Academia",
  ];

  Map<String, String> greetingMessage() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    String formattedTime =
        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";

    String greeting;

    if (hour >= 5 && hour < 12) {
      greeting = "Selamat Pagi 🌅";
    } else if (hour >= 12 && hour < 15) {
      greeting = "Selamat Siang ☀️";
    } else if (hour >= 15 && hour < 18) {
      greeting = "Selamat Sore 🌇";
    } else {
      greeting = "Selamat Malam 🌙";
    }

    return {"greeting": greeting, "time": formattedTime};
  }

  MyHomePage({super.key, required this.userEmail, required this.userPass});

  @override
  Widget build(BuildContext context) {
    final message = greetingMessage();
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.deepPurple[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome!",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Text("Email: $userEmail"),
                Text("Password: $userPass"),
                Text(message["greeting"]!),
                const SizedBox(height: 10),
                Text("Sekarang jam ${message["time"]}"),
                const SizedBox(height: 20),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            child: const Text('Logout'),
          ),

          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Daftar Anime Favorit:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: animeList.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  elevation: 4,
                  color: Colors.deepPurple[50],
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.movie,
                          color: Color.fromARGB(255, 1, 255, 86),
                          size: 28,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            animeList[index],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.deepPurple,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
