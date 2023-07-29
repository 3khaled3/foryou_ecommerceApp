import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../features/home/data/product.dart';
import '../Apicubit/api_cubit.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());

  List<dynamic> existingItems = [];
  List<Map<String, dynamic>> favList = [];
  //updataCurrantItem
  existingItem() async {
    CollectionReference favCollection =
        FirebaseFirestore.instance.collection('fav');
    final uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot snapshot = await favCollection.doc(uid).get();

    if (snapshot.exists) {
      existingItems.clear();
      existingItems.addAll((snapshot.data() as Map<String, dynamic>)['items']
              ?.cast<Map<String, dynamic>>() ??
          []);
    }
  }

//add New Item or remove current item
  Future<void> addTofav(id, context) async {
    emit(Waitting());
    CollectionReference favCollection =
        FirebaseFirestore.instance.collection('fav');
    final uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot snapshot = await favCollection.doc(uid).get();
    List<Map<String, dynamic>> existingItems = [];
    if (snapshot.exists) {
      existingItems.addAll((snapshot.data() as Map<String, dynamic>)['items']
              ?.cast<Map<String, dynamic>>()
              .toList() ??
          []);
      bool itemFound = false;
      for (var i = 0; i < existingItems.length; i++) {
        if (existingItems[i]["id"] == id) {
          existingItems[i].clear();
          itemFound = true;
          break;
        }
      }
      if (!itemFound) {
        existingItems.add({"id": id});
      }
      await favCollection.doc(uid).set({"items": existingItems});
    } else {
      existingItems.add({
        "id": id,
      });
      await favCollection.doc(uid).set({"items": existingItems});
    }
    await updatafavList(context);
    emit(Success());
  }

//get Current Item
  getfav(context) async {
    favList.clear();
    await existingItem();
    emit(Waitting());

    try {
      await updatafavList(context);
      emit(Success());
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

//updatafavList
  updatafavList(context) {
    favList.clear();
    final categoriesProductmap =
        BlocProvider.of<ApiCubit>(context).categoriesProduct;
    List categorieslist = BlocProvider.of<ApiCubit>(context).categories;
//productlist get all product
    List<Product> productlist = [];
    for (var i = 0; i < categoriesProductmap.length; i++) {
      {
        for (var x = 0;
            x < categoriesProductmap["${categorieslist[i]}"].length;
            x++) {
          productlist.add(categoriesProductmap["${categorieslist[i]}"][x]);
        }
      }
    }
    for (var x = 0; x < existingItems.length; x++) {
      for (var i = 0; i < productlist.length; i++) {
        if (productlist[i].id == existingItems[x]["id"]) {
          favList.add({
            "product": productlist[i],
          });
        }
      }
    }
  }
}
