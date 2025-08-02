import 'package:flutter/material.dart' ;

class CenteredCircularProgressIndicator extends StatefulWidget {
  const CenteredCircularProgressIndicator({super.key});

  @override
  State<CenteredCircularProgressIndicator> createState() => _CenteredCircularProgressIndicatorState();
}

class _CenteredCircularProgressIndicatorState extends State<CenteredCircularProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
