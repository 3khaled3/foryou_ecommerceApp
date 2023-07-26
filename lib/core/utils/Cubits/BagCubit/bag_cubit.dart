import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Apicubit/api_cubit.dart';
part 'bag_state.dart';

class BagCubit extends Cubit<BagState> {
  BagCubit() : super(BagInitial());
  List<Map<String, dynamic>> existingItems = [];
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

  // ignore: non_constant_identifier_names
  AddToBag(id) async {
    CollectionReference bagCollection =
        FirebaseFirestore.instance.collection('bag');
    final uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot snapshot = await bagCollection.doc(uid).get();

    if (snapshot.exists) {
      existingItems.clear();
      existingItems.addAll((snapshot.data() as Map<String, dynamic>)['items']
              ?.cast<Map<String, dynamic>>() ??
          []);
      for (var i = 0; i < existingItems.length; i++) {
        if (existingItems[i]["id"] == id) {
          existingItems[i]["qu"] = (existingItems[i]["qu"]) + 1;
        } else {
          if ((i + 1) == existingItems.length) {
            Map<String, dynamic> newItem = {"id": id, "qu": 1};
            existingItems.add(newItem);
            break;
          }
        }
      }

      await bagCollection.doc(uid).set({"items": existingItems});
    } else {
      existingItems.add({"id": id, "qu": 1});
      await bagCollection.doc(uid).set({"items": existingItems});
    }
  }

  bool x = false;
  Stream<List<Map<String, dynamic>>> getBag(context) async* {
    emit(Waitting());
    List<Map<String, dynamic>> bagList = [];
    try {
       await existingItem();
    if (!x) {
      await BlocProvider.of<ApiCubit>(context).fetchcategoriesProducts();
      x = true;
    }

    
    final categoriesProductmap =
        BlocProvider.of<ApiCubit>(context).categoriesProduct;
    final bagid = existingItems;
    List categorieslist = BlocProvider.of<ApiCubit>(context).categories;
    for (var z = 0; z < bagid.length; z++) {
      print("z$z");
      for (var i = 0; i < categorieslist.length; i++) {
        for (var b = 0;
            b < categoriesProductmap["${categorieslist[i]}"].length;
            b++) {
          if (categoriesProductmap["${categorieslist[i]}"][b].id ==
              bagid[z]["id"]) {
            print(b);
            bagList.add({
              "product": categoriesProductmap["${categorieslist[i]}"][b],
              "qu": bagid[z]["qu"]
            });
          }
        }
      }
    }
   
    } catch (e) { emit(Error(e.toString()));
    yield bagList; 
      
    }
   // Yield the bagList instead of returning it
  }
}
