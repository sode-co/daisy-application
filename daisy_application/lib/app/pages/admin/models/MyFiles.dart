// ignore: file_names
import 'package:daisy_application/app/pages/admin/constants.dart';
import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String imgSrc, title, totalStorage;
  final int? numOfFiles, percentage;
  final Color? color;

  CloudStorageInfo({
    required this.imgSrc,
    required this.title,
    required this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: 'Người dùng mới',
    numOfFiles: 1328,
    imgSrc: 'assets/icons/user.png',
    totalStorage: '2.9GB',
    color: const Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudStorageInfo(
    title: 'Giao dịch gần đây',
    numOfFiles: 1328,
    imgSrc: 'assets/icons/transaction.png',
    totalStorage: '1GB',
    color: primaryColor,
    percentage: 50,
  ),
  CloudStorageInfo(
    title: 'Dự án hoàn thành',
    numOfFiles: 5328,
    imgSrc: 'assets/icons/project.png',
    totalStorage: '7.3GB',
    color: Colors.green,
    percentage: 78,
  ),
  CloudStorageInfo(
    title: 'Bài đăng mới',
    numOfFiles: 1328,
    imgSrc: 'assets/icons/jobpost.png',
    totalStorage: '1.9GB',
    color: Colors.pink,
    percentage: 35,
  ),
];
