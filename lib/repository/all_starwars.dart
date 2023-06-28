import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../graphql_query/__generated__/people.req.gql.dart';
export '../graphql_query/__generated__/people.req.gql.dart';

int initialFirstValue = 18;
int currentFirstValue = initialFirstValue;

class FerryRepository {
  Future<Client> initClient() async {
    await Hive.initFlutter();
    final box = await Hive.openBox("graphql");
    final store = HiveStore(box);
    final cache = Cache(store: store);
    final link =
        HttpLink('https://swapi-graphql.netlify.app/.netlify/functions/index');
    final client = Client(
      link: link,
      cache: cache,
    );

    return client;
  }

  final pokeRequest = GPeopleReq((b) => b
    ..requestId = 'peopleRequest'
    ..vars.first = currentFirstValue);

  GPeopleReq refetchData() {
    currentFirstValue += 18;
    final pokeNewReq =
        pokeRequest.rebuild((b) => b..vars.first = currentFirstValue);
    return pokeNewReq;
  }
}
