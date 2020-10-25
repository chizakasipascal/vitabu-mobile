import 'package:dio/dio.dart';
import 'package:vitabu/src/data/network/dio/dio_client.dart';
import 'package:vitabu/src/models/diagnostic/diagnostic.dart';
import 'package:vitabu/src/models/emprunt/emprunt_body.dart';

import '../endpoint.dart';

class ApiProvider {
  final DioClient _dioClient;

  ApiProvider(this._dioClient);

  Future<Diagnostic> postEmprunt(EmpruntBody body) async {
    try {
      final result = await _dioClient.post(
        EndPoint.emprunt,
        data: body.toMap(),
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {
            "Accept": "application/json",
          },
        ),
      );
      return Diagnostic.fromJson(result);
    } catch (e) {
      print("ERROR postEmprunt : ${e.toString()}");
      throw e;
    }
  }
}
