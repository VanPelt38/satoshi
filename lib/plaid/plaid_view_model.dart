import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:plaid_flutter/plaid_flutter.dart' as plaid;
import 'package:satoshi_app/plaid/data/plaid_link.dart';

class PlaidViewModel extends ChangeNotifier {
  PlaidLink? plaidLink;

  StreamSubscription<plaid.LinkEvent>? _streamEvent;
  StreamSubscription<plaid.LinkExit>? _streamExit;
  StreamSubscription<plaid.LinkSuccess>? _streamSuccess;
  plaid.LinkObject? _successObject;

  Future<void> init() async {
    _streamEvent = plaid.PlaidLink.onEvent.listen(_onEvent);
    _streamExit = plaid.PlaidLink.onExit.listen(_onExit);
    _streamSuccess = plaid.PlaidLink.onSuccess.listen(_onSuccess);
  }

  @override
  void dispose() {
    _streamEvent?.cancel();
    _streamExit?.cancel();
    _streamSuccess?.cancel();
    super.dispose();
  }

  void _onEvent(plaid.LinkEvent event) {
    final name = event.name;
    final metadata = event.metadata.description();
    print("onEvent: $name, metadata: $metadata");
  }

  void _onSuccess(plaid.LinkSuccess event) {
    final token = event.publicToken;
    final metadata = event.metadata.description();
    print("onSuccess: $token, metadata: $metadata");
    _successObject = event;
    print('successObject: $_successObject');
    notifyListeners();
  }

  void _onExit(plaid.LinkExit event) {
    final metadata = event.metadata.description();
    final error = event.error?.description();
    print("onExit metadata: $metadata, error: $error");
  }

  Future<void> getLinkToken() async {
    debugPrint('getLinkToken');
    final body = jsonEncode({
      "client_id": dotenv.env['PLAID_CLIENT_ID'],
      "secret": dotenv.env['PLAID_SECRET_SANDBOX'],
      "client_name": "Satoshi Finance App",
      "country_codes": ["GB"],
      "language": "en",
      "user": {"client_user_id": "user-id", "phone_number": "+1 415 5550123"},
      "products": ["auth"],
    });
    final http.Response response = await http.post(
      Uri.parse('https://sandbox.plaid.com/link/token/create'),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    debugPrint(
      'getLinkToken response - ${response.statusCode} - ${response.body}',
    );
    plaidLink = PlaidLink.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
    debugPrint('plaidLink: ${plaidLink?.toJson()}');
  }

  Future<void> openPlaidLink() async {
    plaid.LinkTokenConfiguration configuration = plaid.LinkTokenConfiguration(
      token: plaidLink?.linkToken ?? '',
    );
    plaid.PlaidLink.create(configuration: configuration);

    plaid.PlaidLink.open();
  }
}
