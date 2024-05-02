import 'package:contact_diary/Provider/ContactProvider.dart';
import 'package:contact_diary/model/contact_model.dart';
import 'package:contact_diary/screen/addContact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewContact extends StatefulWidget {
  const ViewContact({super.key});

  @override
  State<ViewContact> createState() => _ViewContactState();
}

class _ViewContactState extends State<ViewContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
      ),
      body: Consumer<ContactProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return ListView.builder(
            itemCount: value.contactList.length,
            itemBuilder: (context, index) {
              ContactModel contact = value.contactList[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text("${contact.Contact_name}"[0].toUpperCase()),
                ),
                title: Text(contact.Contact_name ?? "Contact_Name_Not_Found"),
                subtitle: Text(
                    contact.Contact_mobileNo ?? "Contact_MobileNo_Not_Found"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "AddContact",
                          arguments: {
                            'contactList': value.contactList,
                            'contactIndex': index,
                          },
                        );
                      },
                      icon: Icon(
                        Icons.edit,
                        color: CupertinoColors.link,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Provider.of<ContactProvider>(context, listen: false)
                            .deleteContact(index);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
