import 'package:flutter/material.dart';
import 'package:flutter_conf_accesibility/ui/pages/home_page/home_page_view.dart';

import 'config/localizations.dart';
import 'domain/banner/usecase/banner_usecase.dart';
import 'domain/food/usecase/food_usecase.dart';
import 'infraestructure/repositories/banner/banner_local_repository.dart';
import 'infraestructure/repositories/food/food_local_repository.dart';
import 'infraestructure/services/local_storage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      maxScale: 5,
      child: MaterialApp(
        localizationsDelegates: const [
          MyAppLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        title: 'Taller Accesabilidad',
        home: HomePage(
          foodUsecase: FoodUsecase(
            foodGateway: FoodLocalRepository(LocalStorage()),
          ),
          bannerUsecase: BannerUsecase(
              bannerGateway: BannerRepositoryLocal(LocalStorage())),
        ),
      ),
    );
  }
}
