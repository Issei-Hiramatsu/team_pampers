import 'package:flutter/material.dart';

class HomeDropDownButton extends StatelessWidget {
  const HomeDropDownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        border: Border.all(color: Colors.black,)
      ),
      child: DropdownButton(
        hint: const Center(child: Text('ランダム')),
        isExpanded: true,
        underline: Container(),
        ///  itemsにスポンサーのカテゴリーを入れる  ///
          items: <String>['ランダム','みみみ','うううう'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        onChanged: (String? value) { },
      ),
    );
  }
}
