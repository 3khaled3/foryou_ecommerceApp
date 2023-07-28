import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/home/data/product.dart';
import '../Apicubit/api_cubit.dart';
part 'bag_state.dart';

class BagCubit extends Cubit<BagState> {
  BagCubit() : super(BagInitial());
  List<Map<String, dynamic>> existingItems = [];
  List<Map<String, dynamic>> bagList = [];
  existingItem() async {
    CollectionReference bagCollection =
        FirebaseFirestore.instance.collection('bag');
    final uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot snapshot = await bagCollection.doc(uid).get();

    if (snapshot.exists) {
      existingItems.clear();
      existingItems.addAll((snapshot.data() as Map<String, dynamic>)['items']
              ?.cast<Map<String, dynamic>>() ??
          []);
    }
  }

  Future<void> addToBag(id, context) async {
    emit(Waittingg());
    CollectionReference bagCollection =
        FirebaseFirestore.instance.collection('bag');
    final uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot snapshot = await bagCollection.doc(uid).get();
    List<Map<String, dynamic>> existingItems = [];
    if (snapshot.exists) {
      existingItems.addAll((snapshot.data() as Map<String, dynamic>)['items']
              ?.cast<Map<String, dynamic>>()
              .toList() ??
          []);

      bool itemFound = false;

      for (var i = 0; i < existingItems.length; i++) {
        if (existingItems[i]["id"] == id) {
          // Item found, update quantity
          existingItems[i]["qu"] = (existingItems[i]["qu"] ?? 1) + 1;
          itemFound = true; // Set the flag to true
          break;
        }
      }
      // If item with the specified ID was not found, add the new item to the bag
      if (!itemFound) {
        existingItems.add({"id": id, "qu": 1});
      }

      await bagCollection.doc(uid).set({"items": existingItems});
    } else {
      // Document not found, add a new item to the bag
      existingItems.add({"id": id, "qu": 1});
      await bagCollection.doc(uid).set({"items": existingItems});
    }

    await updataBagList(context);

    emit(Success());
  }

  getBag(context) async {
    bagList.clear();
    await existingItem();
    emit(Waitting());

    try {
      await updataBagList(context);
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  updataBagList(context) {
    bagList.clear();
    final categoriesProductmap =
        BlocProvider.of<ApiCubit>(context).categoriesProduct;
    List categorieslist = BlocProvider.of<ApiCubit>(context).categories;

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
          bagList
              .add({"product": productlist[i], "qu": existingItems[x]["qu"]});
        }
      }
    }
  }

  plus(id) async {
    emit(Waittingg());
    for (var i = 0; i < existingItems.length; i++) {
      if (existingItems[i]["id"] == id) {
        existingItems[i]["qu"] = (existingItems[i]["qu"]) + 1;
        break;
      }
    }
    await FirebaseFirestore.instance
        .collection('bag')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({"items": existingItems});
    emit(Success());
  }
  minus(id) async {
    emit(Waittingg());
    for (var i = 0; i < existingItems.length; i++) {
      if (existingItems[i]["id"] == id) {
        if ( existingItems[i]["qu"]==1) {
          existingItems[i].clear();
          break;
        }else {
          existingItems[i]["qu"] = (existingItems[i]["qu"]) - 1;
           break;
        }

      }
    }
    await FirebaseFirestore.instance
        .collection('bag')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({"items": existingItems});
    emit(Success());
  }
  del(id) async {
    emit(Waittingg());
    for (var i = 0; i < existingItems.length; i++) {
      if (existingItems[i]["id"] == id) {
        
          existingItems[i].clear();
          break;
      }
    }
    await FirebaseFirestore.instance
        .collection('bag')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({"items": existingItems});
    emit(Success());
  }
}
