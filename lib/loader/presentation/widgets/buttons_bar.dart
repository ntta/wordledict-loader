import 'package:flutter/material.dart';

class ButtonsBar extends StatelessWidget {
  const ButtonsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          iconSize: 35,
          icon: const Icon(Icons.output),
          onPressed: () {},
        ),
        const SizedBox(width: 10),
        IconButton(
          iconSize: 35,
          icon: const Icon(Icons.menu_book),
          onPressed: () {},
        ),
        Expanded(child: Container()),
        IconButton(
          iconSize: 35,
          icon: const Icon(Icons.add_to_photos),
          onPressed: () {},
        ),
        const SizedBox(width: 10),
        IconButton(
          iconSize: 35,
          icon: const Icon(Icons.add_box),
          onPressed: () {},
        ),
      ],
    );
  }
}
