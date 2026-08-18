#!/usr/bin/env dart

import 'dart:io';

void main() {
  print('Enter the class name:');
  String className = stdin.readLineSync()!.trim();

  print('Enter properties (format: type name), '
        'one per line. Type "f" to finish:'
  );
  List<Map<String, String>> properties = [];

  while (true) {
    String? line = stdin.readLineSync();
    if (line == null || line.trim().toLowerCase() == 'f') break;

    var parts = line.trim().split(' ');
    if (parts.length != 2) {
      print('Invalid format. Use: type name');
      continue;
    }

    var type = removeSpecial(parts[0]);
    var name = removeSpecial(parts[1]);

    properties.add({'type': type, 'name': name});
  }

  generateModel(className, properties);
}

String removeSpecial(String value) {
  return value.replaceAll(RegExp(r'[\p{P}\p{S}]+', unicode: true), '');
}

void generateModel(String className, List<Map<String, String>> properties) {
  // Fields
  String fields = properties.map((p) => '  ${p['type']} ${p['name']};').join(
      '\n');

  // Constructor
  String constructor = '  $className({\n' +
      properties.map((p) => '    required this.${p['name']},').join('\n') +
      '\n  });';

  // From JSON
  String fromJson = '''
  factory $className.fromJson(Map<String, dynamic> json) {
    return $className(
${properties.map((
      p) => "      ${p['name']}: json['${p['name']}'] ?? ${getEmptyValue(
      p['type'])},").join('\n')}
    );
  }
''';

  // To JSON
  String toJson = '''
  Map<String, dynamic> toJson() {
    return {
${properties.map((p) => "      '${p['name']}': ${p['name']},").join('\n')}
    };
  }
''';

  // From Empty
  String fromEmpty = '''
  factory $className.fromEmpty() {
    return $className(
${properties.map((p) => "      ${p['name']}: ${getEmptyValue(p['type'])},")
      .join('\n')}
    );
  }
''';

  // From Mock
  String fromMock = '''
  factory $className.fromMock() {
    return $className(
${properties.map((p) => "      ${p['name']}: ${getMockValue(
      p['type'], p['name']!)},").join('\n')}
    );
  }
''';

  // CopyWith
  String copyWith = '''
  $className copyWith({
${properties.map((p) => "    ${p['type']}? ${p['name']},").join('\n')}
  }) {
    return $className(
${properties.map((
      p) => "      ${p['name']}: ${p['name']} ?? this.${p['name']},").join(
      '\n')}
    );
  }
''';

  String result = '''
class $className {
$fields

$constructor

$fromJson

$toJson

$fromEmpty

$fromMock

$copyWith
}
''';

  print('\nGenerated Code:\n');
  print(result);
}

String getEmptyValue(String? type) {
  switch (type) {
    case 'String':
      return "''";
    case 'int':
    case 'double':
      return '0';
    case 'bool':
      return 'false';
    default:
      return '${type}.fromEmpty()'; // For nested models
  }
}

String getMockValue(String? type, String name) {
  if (type == 'String') {
    return "'mock_${name.toLowerCase()}'";
  } else if (type == 'int' || type == 'double') {
    return '123';
  } else if (type == 'bool') {
    return 'true';
  } else {
    return '${type}.fromMock()'; // For nested models
  }
}

