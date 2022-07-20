import 'package:daisy_application/core_services/models/artwork/artwork_model.dart';
import 'package:daisy_application/core_services/models/portfolio/portfolio_model.dart';
import 'package:flutter/material.dart';

class PortfolioState with ChangeNotifier {
  PortfolioModel? portfolio;
  List<ArtworkModel>? artworks = [
    ArtworkModel(
      id: 1,
      title: 'artwork 01',
      image:
          'https://i.natgeofe.com/n/46b07b5e-1264-42e1-ae4b-8a021226e2d0/domestic-cat_thumb_square.jpg',
    ),
    ArtworkModel(
      id: 2,
      title: 'artwork 02',
      image:
          'https://firebasestorage.googleapis.com/v0/b/test-37ba6.appspot.com/o/Cat03.jpg?alt=media&token=143bae7b-74d9-44d5-a73f-4eb1ba3fc1ab',
    ),
    ArtworkModel(
      id: 3,
      title: 'artwork 03',
      image:
          'https://firebasestorage.googleapis.com/v0/b/test-37ba6.appspot.com/o/Cat03.jpg?alt=media&token=143bae7b-74d9-44d5-a73f-4eb1ba3fc1ab',
    ),
    ArtworkModel(
      id: 4,
      title: 'artwork 04',
      image:
          'https://firebasestorage.googleapis.com/v0/b/test-37ba6.appspot.com/o/Cat03.jpg?alt=media&token=143bae7b-74d9-44d5-a73f-4eb1ba3fc1ab',
    ),
    ArtworkModel(
      id: 5,
      title: 'artwork 05',
      image:
          'https://firebasestorage.googleapis.com/v0/b/test-37ba6.appspot.com/o/Cat03.jpg?alt=media&token=143bae7b-74d9-44d5-a73f-4eb1ba3fc1ab',
    ),
    ArtworkModel(
      id: 6,
      title: 'artwork 06',
      image:
          'https://firebasestorage.googleapis.com/v0/b/test-37ba6.appspot.com/o/Cat03.jpg?alt=media&token=143bae7b-74d9-44d5-a73f-4eb1ba3fc1ab',
    ),
    ArtworkModel(
      id: 7,
      title: 'artwork 07',
      image:
          'https://firebasestorage.googleapis.com/v0/b/test-37ba6.appspot.com/o/Cat03.jpg?alt=media&token=143bae7b-74d9-44d5-a73f-4eb1ba3fc1ab',
    ),
    ArtworkModel(
      id: 8,
      title: 'artwork 08',
      image:
          'https://firebasestorage.googleapis.com/v0/b/test-37ba6.appspot.com/o/Cat03.jpg?alt=media&token=143bae7b-74d9-44d5-a73f-4eb1ba3fc1ab',
    ),
    ArtworkModel(
      id: 9,
      title: 'artwork 09',
      image:
          'https://firebasestorage.googleapis.com/v0/b/test-37ba6.appspot.com/o/Cat03.jpg?alt=media&token=143bae7b-74d9-44d5-a73f-4eb1ba3fc1ab',
    ),
  ];
}
