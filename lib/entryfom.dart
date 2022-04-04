import 'package:flutter/material.dart';
import 'package:sqllite_flutter_tugas/models/item.dart';

class EntryForm extends StatefulWidget {
  Item? item;

  EntryForm(this.item);

  @override
  _EntryFormState createState() => _EntryFormState(item);
  // State<EntryFom> createState() => _EntryFomState();

}

class _EntryFormState extends State<EntryForm> {
  Item? item;
  _EntryFormState(this.item);

  @override
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  Widget build(BuildContext context) {
    if (item != null) {
      nameController.text = item!.name;
      priceController.text = item!.price.toString();
    }
    return Scaffold(
      appBar: AppBar(
        title: item == null ? Text("Tambah Data") : Text("Ubah"),
        leading: Icon(Icons.keyboard_arrow_left),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 15),
        child: ListView(
          children: [
            // Nama Barang
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Nama Barang",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),

            // Harga Barng
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Harga Barang",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            // Button
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text(
                        'Simpan',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        if (item == null) {
                          // tambah data
                          item = Item(nameController.text,
                              int.parse(priceController.text));
                        } else {
                          // ubah data
                          item!.name = nameController.text;
                          item!.price = int.parse(priceController.text);
                        }
                        //Kembali ke page sebelumnya dan membawa objek item
                        Navigator.pop(context, item);
                      },
                    ),
                  ),
                  Container(width: 5),

                  //Button batal
                  Expanded(
                    child: ElevatedButton(
                      child: Text(
                        "Batal",
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
