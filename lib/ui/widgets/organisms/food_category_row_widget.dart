import 'package:flutter/material.dart';

import '../../models/locale_model.dart';
import '../atoms/custom_item_icon.dart';
import '../atoms/label_widget.dart';

class FoodCategoryRowWidget extends StatelessWidget {
  const FoodCategoryRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _CategoryItem(
            imageUrl: 'assets/images/main.png',
            name: 'Principales',
            focusable: false,
          ),
          SizedBox(width: 20,),
          _CategoryItem(
            imageUrl: 'assets/images/salad.png',
            name: 'Ensaladas',
            focusable: true,
          ),
          SizedBox(width: 20,),
          _CategoryItem(
            imageUrl: 'assets/images/appetizer.png',
            name: 'Aperitivos',
            focusable: true,
          ),
          SizedBox(width: 20,),
          _CategoryItem(
            imageUrl: 'assets/images/drinks.png',
            name: 'Bebidas',
            focusable: true,
          ),
          SizedBox(width: 20,),
          _CategoryItem(
            imageUrl: 'assets/images/dessert.png',
            name: 'Postres',
            focusable: true,
          ),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final bool focusable;

  const _CategoryItem({
    required this.imageUrl,
    required this.name,
    required this.focusable,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      focusable: focusable,
      child: Column(
        children: [
          CustomItemIcon(
            imageAssetIcon: imageUrl,
            iconSize: 0.05,
          ),
          LabelWidget(
            item: ItemModel(label: name),
          ),
        ],
      ),
    );
  }
}
