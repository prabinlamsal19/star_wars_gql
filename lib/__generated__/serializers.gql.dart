// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:demo_app/graphql_query/__generated__/people.data.gql.dart'
    show
        GPeopleData,
        GPeopleData_allPeople,
        GPeopleData_allPeople_pageInfo,
        GPeopleData_allPeople_people,
        GPeopleData_allPeople_people_species;
import 'package:demo_app/graphql_query/__generated__/people.req.gql.dart'
    show GPeopleReq;
import 'package:demo_app/graphql_query/__generated__/people.var.gql.dart'
    show GPeopleVars;
import 'package:ferry_exec/ferry_exec.dart';
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GPeopleData,
  GPeopleData_allPeople,
  GPeopleData_allPeople_pageInfo,
  GPeopleData_allPeople_people,
  GPeopleData_allPeople_people_species,
  GPeopleReq,
  GPeopleVars,
])
final Serializers serializers = _serializersBuilder.build();
