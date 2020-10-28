import 'package:dio/dio.dart';
import 'package:vitabu/src/data/network/dio/dio_client.dart';
import 'package:vitabu/src/models/diagnostic/diagnostic.dart';
import 'package:vitabu/src/models/emprunt/emprunt_body.dart';
import 'package:vitabu/src/models/mouvement/mouvement.dart';

import '../endpoint.dart';

class ApiProvider {
  final DioClient _dioClient;

  ApiProvider(this._dioClient);

  Future<Mouvement> getCodeEmprunt(String code) async {
    try {
      final result = await _dioClient.get(
        "${EndPoint.getCode}/$code",
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {
            "Accept": "application/json",
          },
        ),
      );
      return Mouvement.fromJson(result);
    } catch (e) {
      print("ERROR getCodeEmprunt : ${e.toString()}");
      throw e;
    }
  }

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
