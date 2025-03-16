// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plaid_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaidLink _$PlaidLinkFromJson(Map<String, dynamic> json) => PlaidLink(
  json['link_token'] as String?,
  json['expiration'] as String?,
  json['request_id'] as String?,
);

Map<String, dynamic> _$PlaidLinkToJson(PlaidLink instance) => <String, dynamic>{
  'link_token': instance.linkToken,
  'expiration': instance.expiration,
  'request_id': instance.requestId,
};
