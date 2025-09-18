// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/data/models/product_model.dart';
import 'package:commerce_mobile/data/repositories/product_repository_impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _repository = ProductRepositoryImpl();

  HomeBloc() : super(const HomeState()) {
    on<HomeFetchAllProducts>((event, emit) async {
      emit(state.copyWith(formzStatus: FormzSubmissionStatus.inProgress));

      Either<String, List<ProductModel>> result;
      result = await _repository.fetchAllProducts();

      if (result.isRight()) {
        final products = result.getOrElse(() => []);
        emit(
          state.copyWith(
            formzStatus: FormzSubmissionStatus.success,
            products: products,
          ),
        );
      } else {
        emit(state.copyWith(formzStatus: FormzSubmissionStatus.failure));
      }
    });

    on<HomeFetchProductByCategory>((event, emit) async {
      emit(state.copyWith(formzStatus: FormzSubmissionStatus.inProgress));

      Either<String, List<ProductModel>> result = await _repository
          .fetchProductsByCategory(event.categoryId);

      if (result.isRight()) {
        final products = result.getOrElse(() => []);
        emit(
          state.copyWith(
            formzStatus: FormzSubmissionStatus.success,
            products: products,
          ),
        );
      } else {
        emit(state.copyWith(formzStatus: FormzSubmissionStatus.failure));
      }
    });

    on<HomeFetchProductById>((event, emit) async {
      emit(state.copyWith(formzStatus: FormzSubmissionStatus.inProgress));

      Either<String, ProductModel> result = await _repository.fetchProductById(
        event.productId,
      );
      if (result.isRight()) {
        final product = result.getOrElse(
          () => throw Exception("Unexpected error"),
        );
        emit(
          state.copyWith(
            formzStatus: FormzSubmissionStatus.success,
            product: product,
          ),
        );
      } else {
        emit(state.copyWith(formzStatus: FormzSubmissionStatus.failure));
      }
    });

    on<HomeResetStatus>((event, emit) {
      emit(state.copyWith(formzStatus: FormzSubmissionStatus.initial));
    });

    on<HomeDispose>((event, emit) => _repository.dispose());
  }
}
