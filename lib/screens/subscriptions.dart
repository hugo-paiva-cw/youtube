import 'package:flutter/material.dart';

class Subscriptions extends StatefulWidget {
  const Subscriptions({Key? key}) : super(key: key);

  @override
  State<Subscriptions> createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Inscrições',
        style: TextStyle(
          fontSize: 25
        ),
      ),
    );
  }
}
