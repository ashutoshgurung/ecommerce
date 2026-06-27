import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextformfieldWidget extends StatelessWidget {
  const TextformfieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.white),
          suffixIcon: Icon(Icons.mic, color: Colors.white),
          hintText: "Search",
          hintStyle: GoogleFonts.poppins(color: Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
