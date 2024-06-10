 import 'package:essay_projects/network_services/api_client.dart';
import 'package:essay_projects/network_services/api_endpoints.dart';
import 'package:essay_projects/network_services/api_result.dart';
import 'package:essay_projects/network_services/api_result_service.dart';

class AuthRepo {
   
 Future<ApiResult> loginResult(payload) async {
    ApiResult apiResult = await DioClient().post(
      ApisEndPoints.login,
      data: payload,
    );
    return apiResult;
  }
   

  Future<RepoResult> logIn({payload}) async {
    try {
      final response = await commonApiCall(loginResult(payload));
      if (response is ApiSuccess) {
        return RepoResult.success(
            data: response.data, message: response.message);
      } else {
        return RepoResult.failure(error: (response as ApiFailure).error);
      }
    } catch (e) {
      return RepoResult.failure(error: e.toString());
    }
  }
 }
