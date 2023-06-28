import 'package:demo_app/repository/all_starwars.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../graphql_query/__generated__/people.data.gql.dart';
import '../graphql_query/__generated__/people.var.gql.dart';

part 'ferry_event.dart';
part 'ferry_state.dart';

class FerryBloc extends Bloc<FerryEvent, FerryState> {
  final ferryRepo = FerryRepository();
  late Client client;
  FerryBloc() : super(FerryInitialState()) {
    on<InitializeFerryEvent>(((event, emit) async {
      emit(FerryLoadingState());

      client = await ferryRepo.initClient();
      var pokeRequest = FerryRepository().pokeRequest;
      final res = client.request(pokeRequest);
      await emit.forEach(res,
          onData: (OperationResponse<GPeopleData, GPeopleVars> streamData) {
        List<String> responseStringArray = [];

        for (int i = 0; i < streamData.data!.allPeople!.people!.length; i++) {
          responseStringArray
              .add(streamData.data!.allPeople!.people![i]!.name.toString());
        }
        return InitializationsDoneState(
            responseStringArray: responseStringArray);
      });
    }));

    on<RefetchDataEvent>(
      (event, emit) async {
        print("New data being fetched");
        final pokeRequest = ferryRepo.refetchData();
        final res = client.request(pokeRequest);
        await emit.forEach(res,
            onData: (OperationResponse<GPeopleData, GPeopleVars> streamData) {
          List<String> responseStringArray = [];

          for (int i = 0; i < streamData.data!.allPeople!.people!.length; i++) {
            responseStringArray
                .add(streamData.data!.allPeople!.people![i]!.name.toString());
          }
          return InitializationsDoneState(
              responseStringArray: responseStringArray);
        });
      },
    );
  }
}
