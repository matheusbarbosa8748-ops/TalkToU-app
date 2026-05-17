import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/section_title.dart';
import '../widgets/switch_tile.dart';

class UserPreferencesScreen extends StatefulWidget {
  const UserPreferencesScreen({super.key});

  @override
  State<UserPreferencesScreen> createState() => _UserPreferencesScreenState();
}

class _UserPreferencesScreenState extends State<UserPreferencesScreen> {
  bool useAccessibleFont = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferências",
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: "Acessibilidade"),
            CustomSwitchTile(
              title: "Fonte de Alta Legibilidade",
              subtitle: "Usa uma fonte mais clara e simples",
              value: useAccessibleFont,
              onChanged: (val) {
                setState(() => useAccessibleFont = val);
              },
            ),
          ],
        ),
      ),
    );
  }
}
