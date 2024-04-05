import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/core/presentation/styles/colors_app.dart';

///Retry column widget
class RetryColumnWidget extends ConsumerWidget {
  /// Constructor
  const RetryColumnWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  ///Action when user taps on the icon
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: const Column(
            children: [
              Text(
                'Hubo un error al cargar el contenido.\nIntenta de nuevo.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: ColorsApp.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
