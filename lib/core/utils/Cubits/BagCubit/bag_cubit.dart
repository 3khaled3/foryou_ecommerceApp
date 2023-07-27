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

  // ignore: non_constant_identifier_names
  AddToBag(id, context) async {
    emit(Waittingg());
    bagList.clear();

    existingItems.clear();
    CollectionReference bagCollection =
        FirebaseFirestore.instance.collection('bag');
    final uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot snapshot = await bagCollection.doc(uid).get();
////////////
    if (snapshot.exists) {
      existingItems.addAll((snapshot.data() as Map<String, dynamic>)['items']
              ?.cast<Map<String, dynamic>>() ??
          []);
      for (var i = 0; i < existingItems.length; i++) {
        if (existingItems[i]["id"] == id) {
          existingItems[i]["qu"] = (existingItems[i]["qu"]) + 1;
          break;
        } else if ((i + 1) == existingItems.length) {
          {
            print("${existingItems.length}");
            print("22222222222222222222");
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
    updataBagList(context);
    emit(Success());
  }

  Stream<void> getBag(context) async* {
    bagList.clear();
    await existingItem();
    emit(Waitting());

    try {
      updataBagList(context);
      // yield; // Emit an empty event to signify the completion of the stream
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  void updataBagList(context) {
    bagList.clear();
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
  }

  plus(id) async {
    emit(Waittingg());
    for (var i = 0; i < existingItems.length; i++) {
      if (existingItems[i]["id"] == id) {
        existingItems[i]["qu"] = (existingItems[i]["qu"]) + 1;
        break;
      }
    }
    await  FirebaseFirestore.instance.collection('bag').doc( FirebaseAuth.instance.currentUser!.uid).set({"items": existingItems});
    emit(Success());
  }
}
