import "dart:convert";

import "package:flutter_clean_architecture/constants/constants.dart";
import "package:flutter_clean_architecture/features/advices/data/data_source/local/advice_local_data_source_impl.dart";
import "package:flutter_clean_architecture/features/advices/data/models/guid_list/guid_list_response.dart";
import "package:flutter_test/flutter_test.dart";
import "package:hive/hive.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";

import "../../../../fixtures/fixture_reader.dart";
import "advice_local_data_source_impl_test.mocks.dart";

@GenerateMocks(<Type>[Box<dynamic>])
void main() {
  late AdviceLocalDataSourceImpl adviceLocalDataSourceImpl;
  late Box<dynamic> box;
  late GuidResponse guidList;

  setUpAll(() {
    box = MockBox<dynamic>();
    adviceLocalDataSourceImpl = AdviceLocalDataSourceImpl(box);
    guidList = GuidResponse.fromJson(
      jsonDecode(
        fixture("get_guid_list_fixture", "advices"),
      ),
    );
  });

  group("get guid response", () {
    test("guid response successfully", () async {
      const int id = 3;
      final databaseRequestFunction = box.get(DatabaseKeys.guidList + id.toString(), defaultValue: null);
      when(databaseRequestFunction)
          .thenAnswer(
        (Invocation realInvocation) async => guidList,
      );

      final result = await adviceLocalDataSourceImpl.getGuidList(id);

      expect(result, guidList);

      verify(databaseRequestFunction);

      verifyNoMoreInteractions(box);
    });
  });
}
