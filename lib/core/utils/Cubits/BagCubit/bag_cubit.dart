import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'bag_state.dart';

class BagCubit extends Cubit<BagState> {
  BagCubit() : super(BagInitial());
  List<Map<String, dynamic>> existingItems = [];
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
}
