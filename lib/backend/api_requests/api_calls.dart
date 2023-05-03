import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class DaDataSuggestionCall {
  static Future<ApiCallResponse> call({
    String? query = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'DaDataSuggestion',
      apiUrl:
          'https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Token f56cc3f687783cefeac0624f8b0896741a2834a5',
      },
      params: {
        'query': query,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic suggestionValue(dynamic response) => getJsonField(
        response,
        r'''$.suggestions[:].value''',
        true,
      );
  static dynamic suggestionUnrestrictedValue(dynamic response) => getJsonField(
        response,
        r'''$.suggestions[:].unrestricted_value''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
