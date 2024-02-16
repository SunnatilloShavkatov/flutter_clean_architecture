import "package:flutter_clean_architecture/core/connectivity/network_info.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";

import "network_info_test.mocks.dart";

@GenerateMocks(<Type>[InternetConnectionChecker])
void main() {
  late InternetConnectionChecker internetConnectionCheckerPlus;
  late NetworkInfo networkInfo;

  setUp(() {
    internetConnectionCheckerPlus = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(internetConnectionCheckerPlus);
  });

  test(
    "check net connection",
    () async {
      when(internetConnectionCheckerPlus.hasConnection)
          .thenAnswer((Invocation realInvocation) async => true);
      final bool result = await networkInfo.isConnected;
      verify(internetConnectionCheckerPlus.hasConnection);
      verifyNoMoreInteractions(internetConnectionCheckerPlus);
      expect(result, true);
    },
  );
}
