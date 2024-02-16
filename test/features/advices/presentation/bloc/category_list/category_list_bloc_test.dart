import "dart:convert";

import "package:bloc/bloc.dart";
import "package:bloc_test/bloc_test.dart";
import "package:flutter_clean_architecture/constants/constants.dart";
import "package:flutter_clean_architecture/core/either/either.dart";
import "package:flutter_clean_architecture/core/error/failure.dart";
import "package:flutter_clean_architecture/features/advices/data/models/category_list/category_list_response.dart";
import "package:flutter_clean_architecture/features/advices/domain/entities/category_list_entity.dart";
import "package:flutter_clean_architecture/features/advices/domain/usecases/get_category_list.dart";
import "package:flutter_clean_architecture/features/advices/presentation/bloc/category_list/category_list_bloc.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";

import "../../../../../fixtures/fixture_reader.dart";
import "category_list_bloc_test.mocks.dart";

@GenerateMocks(<Type>[GetCategoryList])
void main() {
  late final GetCategoryList getCategoryList;
  late final Bloc categoryBloc;
  late final CategoryListEntity categoryListEntity;
  late final CategoryListEntity emptyCategoryListEntity;
  late final CategoryListEntity differentEntity;

  setUpAll(() {
    getCategoryList = MockGetCategoryList();
    categoryBloc = CategoryListBloc(
      getCategoryList: getCategoryList,
    );
    categoryListEntity = CategoryListResponse.fromJson(
            jsonDecode(fixture("get_category_list_fixture_1", "advices")),)
        .toEntity();
    emptyCategoryListEntity = const CategoryListEntity(<>[]);
    differentEntity = CategoryListResponse.fromJson(
        jsonDecode(fixture("get_category_list_fixture_2", "advices")),)
        .toEntity();
  });

  group(
    "test category list",
    () {
      blocTest(
        "successfully from cache and net also successful but different",
        build: () {
          when(getCategoryList.call(const Params(isCache: true))).thenAnswer(
                (Invocation realInvocation) async => Right(categoryListEntity),
          );
          when(getCategoryList.call(const Params(isCache: false))).thenAnswer(
                (Invocation realInvocation) async => Right(differentEntity),
          );
          return categoryBloc;
        },
        act: (Bloc bloc) {
          bloc.add(
            const CategoryListTopButtonTapped(showSavedAdvices: false),
          );
        },
        expect: () => <>[
          const CategoryListAdvices(status: CategoryStatus.loading),
          CategoryListAdvices(
            status: CategoryStatus.successfull,
            categoryListEntity: categoryListEntity,
          ),
          CategoryListAdvices(
            status: CategoryStatus.successfull,
            categoryListEntity: differentEntity,
          ),
        ],
      );

      blocTest(
        "successfully from cache and net also successful",
        build: () {
          when(getCategoryList.call(const Params(isCache: true))).thenAnswer(
            (Invocation realInvocation) async => Right(categoryListEntity),
          );
          when(getCategoryList.call(const Params(isCache: false))).thenAnswer(
            (Invocation realInvocation) async => Right(categoryListEntity),
          );
          return categoryBloc;
        },
        act: (Bloc bloc) {
          bloc.add(
            const CategoryListTopButtonTapped(showSavedAdvices: false),
          );
        },
        expect: () => <>[
          const CategoryListAdvices(status: CategoryStatus.loading),
          CategoryListAdvices(
            status: CategoryStatus.successfull,
            categoryListEntity: categoryListEntity,
          ),
        ],
      );

      blocTest(
        "successfully from cache and net error",
        build: () {
          when(getCategoryList.call(const Params(isCache: true))).thenAnswer(
            (Invocation realInvocation) async => Right(categoryListEntity),
          );
          when(getCategoryList.call(const Params(isCache: false))).thenAnswer(
            (Invocation realInvocation) async => const Left(ServerFailure(
                message: Validations.somethingWentWrong,
              ),),
          );
          return categoryBloc;
        },
        act: (Bloc bloc) {
          bloc.add(
            const CategoryListTopButtonTapped(showSavedAdvices: false),
          );
        },
        expect: () => <>[
          const CategoryListAdvices(status: CategoryStatus.loading),
          CategoryListAdvices(
            status: CategoryStatus.successfull,
            categoryListEntity: categoryListEntity,
          ),
          CategoryListAdvices(
            status: CategoryStatus.error,
            categoryListEntity: categoryListEntity,
            errorMessage: Validations.somethingWentWrong,
          ),
        ],
      );

      blocTest(
        "error from cache then net successfull",
        build: () {
          when(getCategoryList.call(const Params(isCache: true))).thenAnswer(
            (Invocation realInvocation) async => const Left(
              CacheFailure(
                message: Validations.somethingWentWrong,
              ),
            ),
          );
          when(getCategoryList.call(const Params(isCache: false))).thenAnswer(
            (Invocation realInvocation) async => Right(
              categoryListEntity,
            ),
          );
          return categoryBloc;
        },
        act: (Bloc bloc) {
          bloc.add(
            const CategoryListTopButtonTapped(showSavedAdvices: false),
          );
        },
        expect: () => <CategoryListState>[
          const CategoryListAdvices(status: CategoryStatus.loading),
          CategoryListAdvices(
            status: CategoryStatus.successfull,
            categoryListEntity: categoryListEntity,
          ),
        ],
      );

      blocTest(
        "error from cache then net also error",
        build: () {
          when(getCategoryList.call(const Params(isCache: true))).thenAnswer(
            (Invocation realInvocation) async => const Left(
              CacheFailure(
                message: Validations.somethingWentWrong,
              ),
            ),
          );
          when(getCategoryList.call(const Params(isCache: false))).thenAnswer(
            (Invocation realInvocation) async => const Left(
              ServerFailure(
                message: Validations.somethingWentWrong,
              ),
            ),
          );
          return categoryBloc;
        },
        act: (Bloc bloc) {
          bloc.add(
            const CategoryListTopButtonTapped(showSavedAdvices: false),
          );
        },
        expect: () => <>[
          const CategoryListAdvices(status: CategoryStatus.loading),
          const CategoryListAdvices(
            status: CategoryStatus.error,
            errorMessage: Validations.somethingWentWrong,
          ),
        ],
      );

      blocTest(
        "empty case",
        build: () {
          when(getCategoryList.call(const Params(isCache: true))).thenAnswer(
            (Invocation realInvocation) async => const Left(
              CacheFailure(
                message: Validations.somethingWentWrong,
              ),
            ),
          );
          when(getCategoryList.call(const Params(isCache: false))).thenAnswer(
            (Invocation realInvocation) async => Right(
              emptyCategoryListEntity,
            ),
          );
          return categoryBloc;
        },
        act: (Bloc bloc) {
          bloc.add(
            const CategoryListTopButtonTapped(showSavedAdvices: false),
          );
        },
        expect: () => <>[
          const CategoryListAdvices(status: CategoryStatus.loading),
          CategoryListAdvices(
            status: CategoryStatus.empty,
            categoryListEntity: emptyCategoryListEntity,
          ),
        ],
      );
    },
  );
}
