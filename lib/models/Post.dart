/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the Post type in your schema. */
class Post extends amplify_core.Model {
  static const classType = const _PostModelType();
  final String id;
  final String? _title;
  final PostStatus? _status;
  final String? _fullName;
  final String? _emailAddress;
  final String? _phoneNumber;
  final String? _amount;
  final String? _dateCollected;
  final String? _dateDue;
  final String? _description;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  PostModelIdentifier get modelIdentifier {
      return PostModelIdentifier(
        id: id
      );
  }
  
  String get title {
    try {
      return _title!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  PostStatus get status {
    try {
      return _status!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get fullName {
    return _fullName;
  }
  
  String? get emailAddress {
    return _emailAddress;
  }
  
  String? get phoneNumber {
    return _phoneNumber;
  }
  
  String? get amount {
    return _amount;
  }
  
  String? get dateCollected {
    return _dateCollected;
  }
  
  String? get dateDue {
    return _dateDue;
  }
  
  String? get description {
    return _description;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Post._internal({required this.id, required title, required status, fullName, emailAddress, phoneNumber, amount, dateCollected, dateDue, description, createdAt, updatedAt}): _title = title, _status = status, _fullName = fullName, _emailAddress = emailAddress, _phoneNumber = phoneNumber, _amount = amount, _dateCollected = dateCollected, _dateDue = dateDue, _description = description, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Post({String? id, required String title, required PostStatus status, String? fullName, String? emailAddress, String? phoneNumber, String? amount, String? dateCollected, String? dateDue, String? description}) {
    return Post._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      title: title,
      status: status,
      fullName: fullName,
      emailAddress: emailAddress,
      phoneNumber: phoneNumber,
      amount: amount,
      dateCollected: dateCollected,
      dateDue: dateDue,
      description: description);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Post &&
      id == other.id &&
      _title == other._title &&
      _status == other._status &&
      _fullName == other._fullName &&
      _emailAddress == other._emailAddress &&
      _phoneNumber == other._phoneNumber &&
      _amount == other._amount &&
      _dateCollected == other._dateCollected &&
      _dateDue == other._dateDue &&
      _description == other._description;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Post {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("status=" + (_status != null ? amplify_core.enumToString(_status)! : "null") + ", ");
    buffer.write("fullName=" + "$_fullName" + ", ");
    buffer.write("emailAddress=" + "$_emailAddress" + ", ");
    buffer.write("phoneNumber=" + "$_phoneNumber" + ", ");
    buffer.write("amount=" + "$_amount" + ", ");
    buffer.write("dateCollected=" + "$_dateCollected" + ", ");
    buffer.write("dateDue=" + "$_dateDue" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Post copyWith({String? title, PostStatus? status, String? fullName, String? emailAddress, String? phoneNumber, String? amount, String? dateCollected, String? dateDue, String? description}) {
    return Post._internal(
      id: id,
      title: title ?? this.title,
      status: status ?? this.status,
      fullName: fullName ?? this.fullName,
      emailAddress: emailAddress ?? this.emailAddress,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      amount: amount ?? this.amount,
      dateCollected: dateCollected ?? this.dateCollected,
      dateDue: dateDue ?? this.dateDue,
      description: description ?? this.description);
  }
  
  Post copyWithModelFieldValues({
    ModelFieldValue<String>? title,
    ModelFieldValue<PostStatus>? status,
    ModelFieldValue<String?>? fullName,
    ModelFieldValue<String?>? emailAddress,
    ModelFieldValue<String?>? phoneNumber,
    ModelFieldValue<String?>? amount,
    ModelFieldValue<String?>? dateCollected,
    ModelFieldValue<String?>? dateDue,
    ModelFieldValue<String?>? description
  }) {
    return Post._internal(
      id: id,
      title: title == null ? this.title : title.value,
      status: status == null ? this.status : status.value,
      fullName: fullName == null ? this.fullName : fullName.value,
      emailAddress: emailAddress == null ? this.emailAddress : emailAddress.value,
      phoneNumber: phoneNumber == null ? this.phoneNumber : phoneNumber.value,
      amount: amount == null ? this.amount : amount.value,
      dateCollected: dateCollected == null ? this.dateCollected : dateCollected.value,
      dateDue: dateDue == null ? this.dateDue : dateDue.value,
      description: description == null ? this.description : description.value
    );
  }
  
  Post.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _title = json['title'],
      _status = amplify_core.enumFromString<PostStatus>(json['status'], PostStatus.values),
      _fullName = json['fullName'],
      _emailAddress = json['emailAddress'],
      _phoneNumber = json['phoneNumber'],
      _amount = json['amount'],
      _dateCollected = json['dateCollected'],
      _dateDue = json['dateDue'],
      _description = json['description'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'title': _title, 'status': amplify_core.enumToString(_status), 'fullName': _fullName, 'emailAddress': _emailAddress, 'phoneNumber': _phoneNumber, 'amount': _amount, 'dateCollected': _dateCollected, 'dateDue': _dateDue, 'description': _description, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'title': _title,
    'status': _status,
    'fullName': _fullName,
    'emailAddress': _emailAddress,
    'phoneNumber': _phoneNumber,
    'amount': _amount,
    'dateCollected': _dateCollected,
    'dateDue': _dateDue,
    'description': _description,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<PostModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<PostModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final TITLE = amplify_core.QueryField(fieldName: "title");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static final FULLNAME = amplify_core.QueryField(fieldName: "fullName");
  static final EMAILADDRESS = amplify_core.QueryField(fieldName: "emailAddress");
  static final PHONENUMBER = amplify_core.QueryField(fieldName: "phoneNumber");
  static final AMOUNT = amplify_core.QueryField(fieldName: "amount");
  static final DATECOLLECTED = amplify_core.QueryField(fieldName: "dateCollected");
  static final DATEDUE = amplify_core.QueryField(fieldName: "dateDue");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Post";
    modelSchemaDefinition.pluralName = "Posts";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Post.TITLE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Post.STATUS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Post.FULLNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Post.EMAILADDRESS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Post.PHONENUMBER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Post.AMOUNT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Post.DATECOLLECTED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Post.DATEDUE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Post.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _PostModelType extends amplify_core.ModelType<Post> {
  const _PostModelType();
  
  @override
  Post fromJson(Map<String, dynamic> jsonData) {
    return Post.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Post';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Post] in your schema.
 */
class PostModelIdentifier implements amplify_core.ModelIdentifier<Post> {
  final String id;

  /** Create an instance of PostModelIdentifier using [id] the primary key. */
  const PostModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'PostModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is PostModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}