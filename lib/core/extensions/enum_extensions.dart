import '../enums/api_enums.dart';

extension FilterParamsExtension on FilterParams {
  String get getParam => switch (this) {
        FilterParams.partial => "partial",
        FilterParams.freeEbooks => "free-ebooks",
        FilterParams.eBooks => "ebooks",
        FilterParams.paidEbooks => "paid-ebooks",
        FilterParams.full => "full",
      };
}

extension OrderByParamsExtension on OrderByParams {
  String get getParam => switch (this) {
        OrderByParams.newest => "newest",
        OrderByParams.relevance => "relevance",
      };
}
