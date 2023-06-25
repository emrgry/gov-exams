// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_unused_constructor_parameters

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:gov_exams/view/question/models/options_model.dart';

class QuestionModel with EquatableMixin {
  String? question;
  String? image;
  OptionsModel? options;
  String? answer;
  String? description;
  int? type;

  QuestionModel({
    this.question,
    this.image,
    this.options,
    this.answer,
    this.description,
    this.type,
  });

  @override
  List<Object?> get props => [
        question,
        image,
        options,
        answer,
        description,
        type,
      ];

  QuestionModel copyWith({
    String? question,
    String? image,
    OptionsModel? options,
    String? answer,
    String? description,
    int? type,
  }) {
    return QuestionModel(
      question: question ?? this.question,
      image: image ?? this.image,
      options: options ?? this.options,
      answer: answer ?? this.answer,
      description: description ?? this.description,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'image': image,
      'options': options,
      'answer': answer,
      'description': description,
      'type': type,
    };
  }

  factory QuestionModel.fromJson(
    DocumentSnapshot<Map<String, dynamic>> json,
    SnapshotOptions? options,
  ) {
    // final json = djson.data()?['q1'];
    return QuestionModel(
      question: json['question'] as String?,
      image: json['image'] as String?,
      options: json['options'] == null
          ? null
          : OptionsModel.fromJson(json['options'] as Map<String, dynamic>),
      answer: json['answer'] as String?,
      description: json['description'] as String?,
      type: json['type'] as int?,
    );
  }
}
