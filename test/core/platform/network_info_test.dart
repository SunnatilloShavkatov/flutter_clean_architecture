import 'package:flutter_clean_architecture/core/connectivity/internet_connection_checker.dart';
import 'package:flutter_clean_architecture/core/platform/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  late InternetConnectionChecker internetConnectionCheckerPlus;
  late NetworkInfo networkInfo;

  setUp(() {
    internetConnectionCheckerPlus = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(internetConnectionCheckerPlus);
  });

  test(
    'check net connection',
    () async {
      when(internetConnectionCheckerPlus.hasConnection)
          .thenAnswer((realInvocation) async => true);
      final result = await networkInfo.isConnected;
      verify(internetConnectionCheckerPlus.hasConnection);
      verifyNoMoreInteractions(internetConnectionCheckerPlus);
      expect(result, true);
    },
  );
}
