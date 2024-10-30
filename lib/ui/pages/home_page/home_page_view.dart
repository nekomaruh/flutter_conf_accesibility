import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../domain/banner/usecase/banner_usecase.dart';
import '../../../domain/food/usecase/food_usecase.dart';
import '../../../infraestructure/repositories/food/food_local_repository.dart';
import '../../../infraestructure/services/local_storage.dart';
import '../../interfaces/home_page_interface.dart';
import '../../widgets/molecules/banners_widget.dart';
import '../../widgets/organisms/for_you_section_widget.dart';
import '../../widgets/molecules/search_food_food_widget.dart';
import '../detail_page/detail_page_view.dart';
import '../../../config/localizations.dart';
import '../../presenters/home_page_presenter.dart';
import '../../widgets/organisms/custom_bottom_navigation_bar.dart';
import '../../widgets/organisms/food_category_row_widget.dart';
import '../../widgets/atoms/label_widget.dart';

class HomePage extends StatefulWidget {
  final BannerUsecase bannerUsecase;
  final FoodUsecase foodUsecase;

  const HomePage({
    super.key,
    required this.bannerUsecase,
    required this.foodUsecase,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomePageInterface {
  late final Widget myfoods;
  late final HomePagePresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = HomePagePresenter(
      bannerUsercase: widget.bannerUsecase,
      fooUsecase: widget.foodUsecase,
      interface: this,
    );
  }

  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    final language =
        MyAppLocalizations.of(context)?.getJsonTranslate().homeModel;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.1,
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          children: [
            // Title
            LabelWidget(
              item: language?.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            // Subtitle
            LabelWidget(
              item: language?.subTitle,
            ),
            // Carousel
            Semantics(
              sortKey: const OrdinalSortKey(0),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                child: BannersWidget(
                  itemModel: language!.banner,
                  banners: _presenter.getBanners(),
                  action: () => getBanners(context),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Search bar
            SearchFoodFoodWidget(search: language.search),
            const SizedBox(height: 20),
            // Category Title
            LabelWidget(
              item: language.categorySubtitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            // Category List
            const FoodCategoryRowWidget(),
            const SizedBox(height: 20),
            // Grid Section
            ForYouSectionWidget(
              forYou: language.forYou,
              seeMore: language.seeMore,
              foods: _presenter.getFoodForYou(),
              action: (label) => goToDetailsPage(context, label),
            )
          ],
        ),
      ),
      bottomNavigationBar: const ExcludeSemantics(
        child: CustomBottomNavigationBar(),
      ),
    );
  }

  @override
  void goToDetailsPage(BuildContext context, String detailFoodName) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => DetailPageView(
          foodName: detailFoodName,
          foodUsecase: FoodUsecase(
            foodGateway: FoodLocalRepository(
              LocalStorage(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void getBanners(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Banner deslizado',
        ),
      ),
    );
  }
}
