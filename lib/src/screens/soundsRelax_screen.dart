import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SoundsrelaxScreen extends StatefulWidget {
  const SoundsrelaxScreen({super.key});

  @override
  State<SoundsrelaxScreen> createState() => _SoundsrelaxScreenState();
}

class _SoundsrelaxScreenState extends State<SoundsrelaxScreen> {
  String? playingSound;
  double volume = 0.5;

  final List<Map<String, dynamic>> sounds = [
    {"name": "Chuva Suave", "icon": Icons.umbrella, "color": Colors.blue},
    {"name": "Ruído Branco", "icon": Icons.waves, "color": Colors.grey},
    {"name": "Floresta", "icon": Icons.forest, "color": Colors.green},
    {"name": "Oceano", "icon": Icons.water, "color": Colors.cyan},
    {"name": "Fogo", "icon": Icons.local_fire_department, "color": Colors.orange},
    {"name": "Meditação", "icon": Icons.self_improvement, "color": Colors.purple},
  ];

  void _toggleSound(String name) {
    setState(() {
      if (playingSound == name) {
        playingSound = null;
      } else {
        playingSound = name;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Sons Relaxantes",
          style: GoogleFonts.orbitron(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Escolha um ambiente para relaxar ou se concentrar.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[600]),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.1,
              ),
              itemCount: sounds.length,
              itemBuilder: (context, index) {
                final sound = sounds[index];
                final isPlaying = playingSound == sound['name'];

                return GestureDetector(
                  onTap: () => _toggleSound(sound['name']),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isPlaying ? sound['color'].withOpacity(0.2) : Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isPlaying ? sound['color'] : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          sound['icon'],
                          size: 40,
                          color: isPlaying ? sound['color'] : Colors.grey[400],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          sound['name'],
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: isPlaying ? sound['color'] : Colors.black54,
                          ),
                        ),
                        if (isPlaying)
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Icon(Icons.equalizer, size: 16, color: Colors.blueAccent),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          if (playingSound != null)
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.volume_down, color: Colors.grey),
                      Expanded(
                        child: Slider(
                          value: volume,
                          onChanged: (val) => setState(() => volume = val),
                          activeColor: Colors.blueAccent,
                        ),
                      ),
                      const Icon(Icons.volume_up, color: Colors.grey),
                    ],
                  ),
                  Text(
                    "Tocando agora: $playingSound",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
