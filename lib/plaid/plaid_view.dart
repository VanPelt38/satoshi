import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:satoshi_app/plaid/plaid_view_model.dart';

class PlaidView extends StatefulWidget {
  const PlaidView({super.key});

  @override
  State<PlaidView> createState() => _PlaidViewState();
}

class _PlaidViewState extends State<PlaidView> {
  late final PlaidViewModel? plaidViewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      plaidViewModel = Provider.of<PlaidViewModel>(context, listen: false);
      plaidViewModel?.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Plaid test')),
      body: Column(
        children: [
          TextButton(
            child: Text('get token'),
            onPressed: () => plaidViewModel?.getLinkToken(),
          ),
          TextButton(
            child: Text('open plaid'),
            onPressed: () => plaidViewModel?.openPlaidLink(),
          ),
        ],
      ),
    );
  }
}
