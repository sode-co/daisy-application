import 'package:daisy_application/core_services/models/artwork/artwork_model.dart';
import 'package:flutter/material.dart';

abstract class FindDesignerListener<T extends StatefulWidget>
    implements State<T> {
  void onSearchDesignersByCategoryId(int id);
  Future<ArtworkModel> onGetLatestArtwork(String designerEmail);
}
