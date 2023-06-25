// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class OptionsModel with EquatableMixin {
  String? a;
  String? b;
  String? c;
  String? d;

  OptionsModel({
    this.a,
    this.b,
    this.c,
    this.d,
  });

  @override
  List<Object?> get props => [a, b, c, d];

  OptionsModel copyWith({
    String? a,
    String? b,
    String? c,
    String? d,
  }) {
    return OptionsModel(
      a: a ?? this.a,
      b: b ?? this.b,
      c: c ?? this.c,
      d: d ?? this.d,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'a': a,
      'b': b,
      'c': c,
      'd': d,
    };
  }

  factory OptionsModel.fromJson(Map<String, dynamic> json) {
    return OptionsModel(
      a: json['a'] as String?,
      b: json['b'] as String?,
      c: json['c'] as String?,
      d: json['d'] as String?,
    );
  }
}
