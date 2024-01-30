import 'package:flutter/material.dart';
import 'package:magic_bricks/Constants/Constants.dart';

class PostAd_Screen extends StatefulWidget {
  const PostAd_Screen({super.key});

  @override
  State<PostAd_Screen> createState() => _PostAd_ScreenState();
}

class _PostAd_ScreenState extends State<PostAd_Screen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedCategory = category[0];
  String selectedSubResidentialCategory = residentialCategory[0];
  String selectedSubCommercialCategory = commercialCategory[0];
  bool residential = true;
  bool commercial = false;
  String _city = '';
  String _location = '';
  String _address = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppConstantsColor.materialButtonColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Post Property",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Hi John Doe,",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "You Are Posting Your Property For:",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Column(
                children: category.map((item) {
                  return Column(
                    children: [
                      RadioListTile(
                        title: Text(
                          item,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        value: item,
                        groupValue: selectedCategory,
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value.toString();
                            print(selectedCategory);
                          });
                        },
                      ),
                      Divider(),
                    ],
                  );
                }).toList(),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "What type of property is it?",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        residential = true;
                        commercial = false;
                        print("r");
                      });
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("Residential"),
                      ),
                      decoration: BoxDecoration(
                        color: residential ? Colors.blueAccent : Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        residential = false;
                        commercial = true;
                        print("c");
                      });
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("Commercial"),
                      ),
                      decoration: BoxDecoration(
                        color: commercial ? Colors.blueAccent : Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Column(
                children: residential
                    ? residentialCategory.map((item) {
                  return Column(
                    children: [
                      RadioListTile(
                        title: Text(
                          item,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        value: item,
                        groupValue: selectedSubResidentialCategory,
                        onChanged: (value) {
                          setState(() {
                            selectedSubResidentialCategory =
                                value.toString();
                            print(selectedSubResidentialCategory);
                          });
                        },
                      ),
                      Divider(),
                    ],
                  );
                }).toList()
                    : commercialCategory.map((item) {
                  return Column(
                    children: [
                      RadioListTile(
                        title: Text(
                          item,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        value: item,
                        groupValue: selectedSubCommercialCategory,
                        onChanged: (value) {
                          setState(() {
                            selectedSubCommercialCategory =
                                value.toString();
                            print(selectedSubCommercialCategory);
                          });
                        },
                      ),
                      Divider(),
                    ],
                  );
                }).toList(),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Where is Your property located?",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Enter City'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a city';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _city = value!;
                      },
                    ),
                    TextFormField(
                      decoration:
                      InputDecoration(labelText: 'Enter Locality'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a locality';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _location = value!;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Enter address optional'),
                      onSaved: (value) {
                        _address = value!;
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
