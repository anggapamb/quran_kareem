import 'package:flutter_core/api/api_response.dart';
import 'package:flutter_core/core.dart';
import 'package:quran_kareem/core/data/model/detailSurat/detail_surat.dart';
import 'package:quran_kareem/core/data/model/surat/surat.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('/surat')
  Future<ApiResponse<List<Surat>>> surat();

  @GET('/surat/{nomor}')
  Future<ApiResponse<DetailSurat>> detailSurat(
    @Path('nomor') int nomor,
  );
}
