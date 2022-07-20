import 'package:flutter/material.dart';

abstract class PortfolioListener<T extends StatefulWidget> implements State<T> {
  void onAddArtworkBtnClick(String title, String image);
}
