import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'gallery.dart';
import 'theme.dart';

class MicroGalleryApp extends StatelessWidget {
  const MicroGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mix Micro',
      theme: microMaterialTheme(),
      builder: (context, child) {
        return MixScope(
          colors: microColors(),
          radii: microRadii(),
          child: child!,
        );
      },
      home: Scaffold(
        backgroundColor: const Color(0xFF07070B),
        appBar: AppBar(
          title: const Text('Mix Micro'),
          backgroundColor: const Color(0xFF07070B),
        ),
        body: const MicroGalleryScreen(),
      ),
    );
  }
}
