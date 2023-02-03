import 'package:flutter/material.dart';

class AtomsAvatar extends StatelessWidget {
  final String url;
  const AtomsAvatar({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Center(
      
      child: CircleAvatar(
        maxRadius: 30,
        backgroundColor: Colors.grey[900],
        backgroundImage: NetworkImage(url),
      ),
    );
  }
}
