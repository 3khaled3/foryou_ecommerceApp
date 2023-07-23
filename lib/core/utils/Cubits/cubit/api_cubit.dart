import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../features/home/data/product.dart';

part 'api_state.dart';

class ApiCubit extends Cubit<ApiState> {
  ApiCubit() : super(ApiInitial());
  List<Product> products = [];
  List<String> categories = [];
  Map<String, String> categoriesimage = {};
  Future<void> fetchProducts() async {
    emit(Waitting());
    final dio = Dio();
    final Response response = await dio.get('https://dummyjson.com/products');

    if (response.statusCode == 200) {
      // final List<dynamic> data = response.data['products'];
      //      data.map((json) => Product.fromJson(json)).toList();
      List<dynamic> productsJson = response.data['products'];
      List<Product> product =
          productsJson.map((json) => Product.fromJson(json)).toList();
      products.clear();
      for (var element in product) {
        products.add(element);
      }
      emit(Success());
      // return products;
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  Future<void> _fetchcategories() async {
    emit(Waitting());
    final dio = Dio();

    final Response responsecategories =
        await dio.get('https://dummyjson.com/products/categories');

    if (responsecategories.statusCode == 200) {
      categories.clear();
      List<dynamic> categoriesJson = responsecategories.data;
      for (var element in categoriesJson) {
        categories.add(element);
      }

      print(categoriesJson);
      emit(Success());
      // return products;
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  Future<void> fetchcategoriesImage() async {
    emit(Waitting());
    final dio = Dio();
    await _fetchcategories();
    categoriesimage.clear();
    print(categories.length);
    for (var i = 0; i < categories.length; i++) {
      String request = categories[0];
      final Response response =
          await dio.get('https://dummyjson.com/products/category/$request');

      if (response.statusCode == 200) {
        List<dynamic> productsJson = response.data['products'];
        
        List<Product> product =
            productsJson.map((json) => Product.fromJson(json)).toList();
            print("   $i ----------------------  ${categories[i]} ${product[0].images[0]}"); 
        categoriesimage.addAll({categories[i]: product[0].images[0]});

        // return products;
      } else {
        throw Exception('Failed to fetch products');
      }
    }
    print(categoriesimage);
    emit(Success());
  }
}
