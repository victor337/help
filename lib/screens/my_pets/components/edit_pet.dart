import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petsaojoao/screens/reg_my_pet/reg_my_pet.dart';

class EditPet extends StatelessWidget {
  final DocumentSnapshot pet;
  EditPet(this.pet);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx) => RegMyPet())
        );
      },
      child: ListTile(
        leading: ClipRRect(
          child: Image.network(pet.data["image"]),
        ),
        title: Text(pet.data["name"]),
      ),
    );
  }
}
