import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petsaojoao/screens/dashboard/dashboard_drawer.dart';
import 'package:petsaojoao/screens/my_pets/components/edit_pet.dart';

class MyPets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: DashboardDrawer(),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Text(
                  "Meus Pets",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 10, 0, 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey),
                  child: Text(
                    "Selecione um pet para editar",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: FutureBuilder<QuerySnapshot>(
                  future: Firestore.instance
                      .collection("users")
                      .document("gustavo")
                      .collection("pets")
                      .getDocuments(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.data == null ||
                        snapshot.data.documents.length == 0 ||
                        snapshot == null) {
                      return Center(
                        child: Text(
                          "Você ainda não tem Pets",
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    } else {
                      return ListView(
                        children: snapshot.data.documents.map((pet) {
                          return EditPet(pet);
                        }).toList(),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
