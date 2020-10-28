import 'package:dio/dio.dart';
import 'package:vitabu/src/data/network/dio/dio_client.dart';
import 'package:vitabu/src/models/diagnostic/diagnostic.dart';
import 'package:vitabu/src/models/emprunt/emprunt_body.dart';
import 'package:vitabu/src/models/mouvement/mouvement.dart';

import 'api_provider.dart';

class ApiRepository {
  final ApiProvider _apiProvider = ApiProvider(DioClient(Dio()));

  Future<Mouvement> getCodeEmprunt(String code) =>
      _apiProvider.getCodeEmprunt(code);

  Future<Diagnostic> postEmprunt(EmpruntBody body) =>
      _apiProvider.postEmprunt(body);
}
