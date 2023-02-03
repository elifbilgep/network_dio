// we are going to define different API request methods which will directly call the client's method and will return the RAW data. Row data not models!

import 'package:dio/dio.dart';
import 'package:network_dio/data/network/api/constant/end_points.dart';
import 'package:network_dio/data/network/dio_client.dart';

class UserApi {
  final DioClient dioClient;

  UserApi({required this.dioClient});

  Future<Response> addUserApi(String name, String job) async {
    //post
    try {
      final Response response = await dioClient.post(Endpoints.users, data: {
        //As we have already defined the base URL in the DioClient, we only need to pass the rest of the Endpoint and not the full URL.
        "name": name,
        "job": job,
      });

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getUserApi() async {
    try {
      final Response response = await dioClient.get(Endpoints.users);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> updateUserApi(
    int id,
    String name,
    String job,
  ) async {
    try {
      final Response response = await dioClient.put("${Endpoints.users}/$id", data: {
        "name": name,
        "job": job,
      });
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteUserApi(int id) async {
    try {
      await dioClient.delete(Endpoints.users + '/$id');
    } catch (e) {
      rethrow;
    }
  }
}
