import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../features/home/data/product_model.dart';

part 'api_state.dart';

class ApiCubit extends Cubit<ApiState> {
  ApiCubit() : super(ApiInitial());
  List<ProductModel> products = [];
  Future<void> fetch() async {
    print("555555555555555555555555555555555555");
    try {
      emit(Waitting());

      final dio = Dio();
      final Response response = await dio.get('https://dummyjson.com/products');

      if (response.statusCode == 200) {
        Map<String, dynamic> res = response.data;
        List<dynamic> productsData = res["products"];

        // Convert the List of Maps to List of ProductModel instances
        products = productsData.map((productData) {
          return ProductModel.fromJson(productData);
        }).toList();
        print("success");

        emit(Success());
      } else {
        print("Failed to fetch data");
        emit(Error('Failed to fetch data'));
      }
    } catch (e) {
      print(e.toString());
      emit(Error(e.toString()));
    }
  }
}
