import 'package:flutter/material.dart';

class RolledFormRuNameConverterWidget extends StatelessWidget {
  const RolledFormRuNameConverterWidget({super.key, required this.rolledFormEnum});
  final String rolledFormEnum;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (rolledFormEnum == 'STRIP') ...[
          const Text(
            'Полоса',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
        if (rolledFormEnum == 'CIRCLE') ...[
          const Text(
            'Круг',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
        if (rolledFormEnum == 'SQUARE') ...[
          const Text(
            'Квадрат',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
        if (rolledFormEnum == 'WIRE') ...[
          const Text(
            'Проволока',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
        if (rolledFormEnum == 'HEXAGON') ...[
          const Text(
            'Шестигранник',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
        if (rolledFormEnum == 'CHANNEL') ...[
          const Text(
            'Швеллер',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
        if (rolledFormEnum == 'I_BEAM') ...[
          const Text(
            'Двутавр',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
        if (rolledFormEnum == 'CORNER') ...[
          const Text(
            'Уголок',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
        if (rolledFormEnum == 'PIPE') ...[
          const Text(
            'Труба',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
        if (rolledFormEnum == 'SHEET') ...[
          const Text(
            'Лист',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
        if (rolledFormEnum == 'ARMATURE') ...[
          const Text(
            'Арматура',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ],
    );
  }
}

/* 'Полоса',
    'Круг',
    'Квадрат',
    'Проволока',
    'Шестигранник',
    'Швеллер',
    'Двутавр',
    'Уголок',
    'Труба',
    'Лист',
    'Арматура' */

/* 'STRIP',
    'CIRCLE',
    'SQUARE',
    'WIRE',
    'HEXAGON',
    'CHANNEL',
    'I_BEAM',
    'CORNER',
    'PIPE',
    'SHEET',
    'ARMATURE' */

String rolledFormRuNameConverter(String? rolledFormEnum) {
  if (rolledFormEnum == 'STRIP') {
    return 'Полоса';
  } else if (rolledFormEnum == 'CIRCLE') {
    return 'Круг';
  } else if (rolledFormEnum == 'SQUARE') {
    return 'Квадрат';
  } else if (rolledFormEnum == 'WIRE') {
    return 'Проволока';
  } else if (rolledFormEnum == 'HEXAGON') {
    return 'Шестигранник';
  } else if (rolledFormEnum == 'CHANNEL') {
    return 'Швеллер';
  } else if (rolledFormEnum == 'I_BEAM') {
    return 'Двутавр';
  } else if (rolledFormEnum == 'CORNER') {
    return 'Уголок';
  } else if (rolledFormEnum == 'PIPE') {
    return 'Труба';
  } else if (rolledFormEnum == 'SHEET') {
    return 'Лист';
  } else if (rolledFormEnum == 'ARMATURE') {
    return 'Арматура';
  } else {
    return '';
  }
}
