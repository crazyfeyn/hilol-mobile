import 'package:flutter/material.dart';

Widget buildBanner(
  String? image,
  String title,
  String? subtitle,
  String? extra,
  Color color,
) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [color.withOpacity(0.8), color],
      ),
    ),
    child: Stack(
      children: [
        if (image != null)
          Positioned(
            right: 20,
            bottom: 0,
            child: Image.asset(image, height: 150, width: 120),
          ),
        Positioned(
          left: 20,
          top: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              if (extra != null)
                Text(
                  extra,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ),
      ],
    ),
  );
}
