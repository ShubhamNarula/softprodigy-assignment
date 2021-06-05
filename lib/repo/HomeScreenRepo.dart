import 'package:soft_prodigy_assignment/api_response/Response.dart';
import 'package:soft_prodigy_assignment/services/ApiService.dart';

class HomeScreenRepo{
  Future<Response> getImage() async {
    final response = await ApiService.hit(url: Uri.parse("http://shibe.online/api/shibes?count=50&urls=true&httpsUrls=true"), body: null);
    return Response.fromJson(response);
  }
}