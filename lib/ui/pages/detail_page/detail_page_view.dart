import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../config/localizations.dart';
import '../../../domain/food/food.dart';
import '../../../domain/food/usecase/food_usecase.dart';
import '../../../infraestructure/repositories/food/food_local_repository.dart';
import '../../models/locale_model.dart';
import '../../presenters/detail_page_presenter.dart';
import '../../widgets/atoms/label_widget.dart';
import '../../widgets/organisms/food_detail_widget.dart';
import '../../widgets/molecules/food_recipe_widget.dart';
import 'interfaces.dart';

class DetailPageView extends StatefulWidget {
  const DetailPageView({
    required this.foodUsecase,
    required this.foodName,
    super.key,
  });

  final String foodName;
  final FoodUsecase foodUsecase;

  @override
  State<DetailPageView> createState() => _DetailPageViewState();
}

class _DetailPageViewState extends State<DetailPageView>
    implements ViewInterface {
  late DetailPagePresenter pagePresenter;
  late List<Widget> foodFavorite;
  late Food currentFood;

  @override
  void initState() {
    super.initState();
    pagePresenter = DetailPagePresenter(
      usecase: widget.foodUsecase,
      view: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final language =
        MyAppLocalizations.of(context)?.getJsonTranslate().detailModel;
    return Scaffold(
      backgroundColor: const Color(0xFFF4AA4A),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4AA4A),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: FutureBuilder<Food>(
        future: pagePresenter.initDetailFood(widget.foodName),
        builder: (BuildContext context, AsyncSnapshot<Food> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              padding: EdgeInsets.only(bottom: 30),
              children: [
                Image.asset(
                  snapshot.data?.imageUrl ?? '',
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                LabelWidget(
                  item: ItemModel(
                    semanticOrdinal: 0.0,
                    label: snapshot.data?.name ?? '',
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize:
                          Theme.of(context).textTheme.headlineLarge!.fontSize,
                      letterSpacing: -2.5),
                ),
                LabelWidget(
                  item: ItemModel(
                    label: language?.subTitle.label ?? '',
                    semantic: language?.subTitle.semantic,
                  ),
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.07,
                      vertical: MediaQuery.of(context).size.height * 0.02),
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.015,
                      horizontal: MediaQuery.of(context).size.width * 0.06),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: FoodDetailWidget(
                      iconsDetails: language?.iconsDetails,
                      food: snapshot.data!),
                ),
                FoodRecipeWidget(
                    semanticOrdinal: 1.0,
                    description: language?.description,
                    ingredients: language?.ingredients,
                    food: snapshot.data),
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  @override
  void showDetail(Food detailFood) {
    currentFood = detailFood;
  }
}
