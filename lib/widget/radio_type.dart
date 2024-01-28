import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/provider/radio_provider.dart';

class RadioType extends ConsumerWidget {
  const RadioType({
    super.key,
    required this.categColor,
    required this.titleRadio,
    required this.valueInput,
    required this.onChangevalue,
  });

  final String titleRadio;
  final Color categColor;
  final int valueInput;
  final VoidCallback onChangevalue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radio =ref.watch(radioType);
    return Material(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: categColor),
        child: RadioListTile(
          activeColor: categColor,
            contentPadding: EdgeInsets.zero,
            title: Transform.translate(
                offset: const Offset(-22, 0),
                child: Text(
                  titleRadio,
                  style:
                      TextStyle(color: categColor, fontWeight: FontWeight.w700,fontSize: 15),
                )),
            value: valueInput,
            groupValue: radio,
            onChanged: (value) => onChangevalue()),
      ),
    );
  }
  
}
