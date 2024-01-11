// Mocks generated by Mockito 5.3.2 from annotations
// in flutter_clean_architecture/test/features/advices/data/repository/advice_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:flutter_clean_architecture/core/platform/network_info.dart' as _i8;
import 'package:flutter_clean_architecture/features/advices/data/data_source/local/advice_local_data_source.dart'
    as _i7;
import 'package:flutter_clean_architecture/features/advices/data/data_source/remote/advice_remote_data_source.dart'
    as _i5;
import 'package:flutter_clean_architecture/features/advices/data/models/article/article_response.dart'
    as _i4;
import 'package:flutter_clean_architecture/features/advices/data/models/category_list/category_list_response.dart'
    as _i2;
import 'package:flutter_clean_architecture/features/advices/data/models/guid_list/guid_list_response.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCategoryListResponse_0 extends _i1.SmartFake
    implements _i2.CategoryListResponse {
  _FakeCategoryListResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGuidResponse_1 extends _i1.SmartFake implements _i3.GuidResponse {
  _FakeGuidResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeArticleResponse_2 extends _i1.SmartFake
    implements _i4.ArticleResponse {
  _FakeArticleResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AdviceRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAdviceRemoteDataSource extends _i1.Mock
    implements _i5.AdviceRemoteDataSource {
  MockAdviceRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.CategoryListResponse> getCategoryList() => (super.noSuchMethod(
        Invocation.method(
          #getCategoryList,
          [],
        ),
        returnValue: _i6.Future<_i2.CategoryListResponse>.value(
            _FakeCategoryListResponse_0(
          this,
          Invocation.method(
            #getCategoryList,
            [],
          ),
        )),
      ) as _i6.Future<_i2.CategoryListResponse>);
  @override
  _i6.Future<_i3.GuidResponse> getGuidList(num? id) => (super.noSuchMethod(
        Invocation.method(
          #getGuidList,
          [id],
        ),
        returnValue: _i6.Future<_i3.GuidResponse>.value(_FakeGuidResponse_1(
          this,
          Invocation.method(
            #getGuidList,
            [id],
          ),
        )),
      ) as _i6.Future<_i3.GuidResponse>);
  @override
  _i6.Future<_i4.ArticleResponse> getArticle(num? id) => (super.noSuchMethod(
        Invocation.method(
          #getArticle,
          [id],
        ),
        returnValue:
            _i6.Future<_i4.ArticleResponse>.value(_FakeArticleResponse_2(
          this,
          Invocation.method(
            #getArticle,
            [id],
          ),
        )),
      ) as _i6.Future<_i4.ArticleResponse>);
}

/// A class which mocks [AdviceLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAdviceLocalDataSource extends _i1.Mock
    implements _i7.AdviceLocalDataSource {
  MockAdviceLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.CategoryListResponse> getCategoryList() => (super.noSuchMethod(
        Invocation.method(
          #getCategoryList,
          [],
        ),
        returnValue: _i6.Future<_i2.CategoryListResponse>.value(
            _FakeCategoryListResponse_0(
          this,
          Invocation.method(
            #getCategoryList,
            [],
          ),
        )),
      ) as _i6.Future<_i2.CategoryListResponse>);
  @override
  _i6.Future<_i3.GuidResponse> getGuidList(num? id) => (super.noSuchMethod(
        Invocation.method(
          #getGuidList,
          [id],
        ),
        returnValue: _i6.Future<_i3.GuidResponse>.value(_FakeGuidResponse_1(
          this,
          Invocation.method(
            #getGuidList,
            [id],
          ),
        )),
      ) as _i6.Future<_i3.GuidResponse>);
  @override
  _i6.Future<_i4.ArticleResponse> getArticle(num? id) => (super.noSuchMethod(
        Invocation.method(
          #getArticle,
          [id],
        ),
        returnValue:
            _i6.Future<_i4.ArticleResponse>.value(_FakeArticleResponse_2(
          this,
          Invocation.method(
            #getArticle,
            [id],
          ),
        )),
      ) as _i6.Future<_i4.ArticleResponse>);
  @override
  _i6.Future<void> setCategoryList(
          _i2.CategoryListResponse? categoryListResponse) =>
      (super.noSuchMethod(
        Invocation.method(
          #setCategoryList,
          [categoryListResponse],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> setGuidList(
    _i3.GuidResponse? guidResponse,
    num? id,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setGuidList,
          [
            guidResponse,
            id,
          ],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> setArticle(
    _i4.ArticleResponse? articleResponse,
    num? id,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setArticle,
          [
            articleResponse,
            id,
          ],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i8.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
}