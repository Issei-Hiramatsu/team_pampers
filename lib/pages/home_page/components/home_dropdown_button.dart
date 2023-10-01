import 'package:flutter/material.dart';

class HomeDropDownButton extends StatelessWidget {
  const HomeDropDownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black,)
      ),
      child: DropdownButton(
        borderRadius: BorderRadius.circular(40.0),
        hint: const Center(child: Text('ランダム')),
        isExpanded: true,
        underline: Container(),
        ///  itemsにスポンサーのカテゴリーを入れる  ///
          items: <String>['ランダム','YUMEMI','CyberAgent'].map((String value) {
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
