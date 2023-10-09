import 'package:flutter/material.dart';

class GuruGetSiswaAbsen extends StatelessWidget {
  const GuruGetSiswaAbsen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(title: Text('Absen Siswa')),
        preferredSize: Size.fromHeight(60),
      ),
    );
  }
}
