import 'package:bloc_consume_api/models/quote_model.dart';
import 'package:bloc_consume_api/network/network_helper.dart';
import 'package:bloc_consume_api/network/network_service.dart';

class QuotesRepository {
  final baseUrl = 'https://api.quotable.io/random';
  Future<QuoteModel> fetchQuote() async {
    final response = await NetworkService.sendRequest(
        requestType: RequestType.get, url: baseUrl);

    return NetworkHelper.filterResponse<QuoteModel>(
      response: response,
      onFailureCallBackWithMessage: (errorType, message) {
        throw Exception('An Error has happened. $errorType - $message');
      },
      callBack: (json) => QuoteModel.fromJson(json),
    );
  }
}
