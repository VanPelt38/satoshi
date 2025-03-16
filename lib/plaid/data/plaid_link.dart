import 'package:json_annotation/json_annotation.dart';

part 'plaid_link.g.dart';

@JsonSerializable()
class PlaidLink {
  PlaidLink(this.linkToken, this.expiration, this.requestId);

  @JsonKey(name: 'link_token')
  final String? linkToken;
  final String? expiration;
  @JsonKey(name: 'request_id')
  final String? requestId;

  factory PlaidLink.fromJson(Map<String, dynamic> json) =>
      _$PlaidLinkFromJson(json);

  Map<String, dynamic> toJson() => _$PlaidLinkToJson(this);
}
