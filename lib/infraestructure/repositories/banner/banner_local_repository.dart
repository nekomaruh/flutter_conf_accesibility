import '../../../domain/banner/banner.dart';
import '../../../domain/banner/banner_gateway.dart';
import '../../services/local_storage.dart';

class BannerRepositoryLocal implements BannerGateway {
  const BannerRepositoryLocal(this.localStorage);
  final LocalStorage localStorage;
  @override
  Future<List<BannerModel>> getBanners() async {
    final List<BannerModel> banners = [];
    final Map<String, dynamic> data =
        await localStorage.getData('assets/json_backend/banner.json');

    for (var element in data['banners']) {
      banners.add(BannerModel.fromJson(element));
    }
    return banners;
  }
}
