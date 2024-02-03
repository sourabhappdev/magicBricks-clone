import 'package:flutter/material.dart';
import 'package:magic_bricks/Constants/Constants.dart';
import 'package:magic_bricks/Widgets/MainNavigator.dart';

class PostAd_Screen extends StatefulWidget {
  const PostAd_Screen({super.key});

  @override
  State<PostAd_Screen> createState() => _PostAd_ScreenState();
}

class _PostAd_ScreenState extends State<PostAd_Screen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  String selectedCategory = category[0];
  String selectedSubResidentialCategory = residentialCategory[0];
  String selectedSubCommercialCategory = commercialCategory[0];
  String _city = '';
  String _location = '';
  String _locality = '';
  String _address = '';
  String _floorCarpetArea = '';
  String _floorSuperArea = '';
  String _Description = '';
  int numWashRoom = 0;
  int numFloor = 0;
  bool residential = true;
  bool commercial = false;

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
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
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
              const Text(
                "Hi John Doe,",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                "You Are Posting Your Property For:",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                children: category.map((item) {
                  return Column(
                    children: [
                      RadioListTile(
                        title: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        value: item,
                        activeColor: AppConstantsColor.materialButtonColor,
                        groupValue: selectedCategory,
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value.toString();
                            print(selectedCategory);
                          });
                        },
                      ),
                      const Divider(),
                    ],
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "What type of property is it?",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
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
                      });
                    },
                    child: Container(
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Residential",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: residential
                            ? AppConstantsColor.materialButtonColor
                            : Colors.black87,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        residential = false;
                        commercial = true;
                      });
                    },
                    child: Container(
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Commercial",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: commercial
                            ? AppConstantsColor.materialButtonColor
                            : Colors.black87,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
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
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              activeColor:
                                  AppConstantsColor.materialButtonColor,
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
                            const Divider(),
                          ],
                        );
                      }).toList()
                    : commercialCategory.map((item) {
                        return Column(
                          children: [
                            RadioListTile(
                              title: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              activeColor:
                                  AppConstantsColor.materialButtonColor,
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
                            const Divider(),
                          ],
                        );
                      }).toList(),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Where is Your property located?",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: const Icon(Icons.location_city),
                        hintText: 'Enter city name',
                      ),
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
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: const Icon(Icons.location_city),
                        hintText: 'Enter locality',
                      ),
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
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: const Icon(Icons.home),
                        hintText: 'Enter address (optional)',
                      ),
                      onSaved: (value) {
                        _address = value!;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Tell more about your property?",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Form(
                key: _formKey2,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: const Icon(Icons.area_chart),
                        hintText: 'Enter floor carpet area',
                        suffixText: 'in sqft',
                      ),
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
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: const Icon(Icons.area_chart),
                        hintText: 'Enter floor super area',
                        suffixText: 'in sqft',
                      ),
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
                    residential
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              CustomDropDownMenuField(
                                'BHK',
                                Icon(Icons.hotel),
                                numWashRoom,
                                (int? newValue) {
                                  setState(() {
                                    numWashRoom = newValue!;
                                    print(numWashRoom);
                                  });
                                },
                              ),
                            ],
                          )
                        : Container(),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomDropDownMenuField(
                      'Number of Floors',
                      Icon(Icons.stairs),
                      numFloor,
                      (int? newValue) {
                        setState(() {
                          numFloor = newValue!;
                          print(numFloor);
                        });
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomDropDownMenuField(
                      'Number of Washrooms',
                      Icon(Icons.bathtub),
                      numWashRoom,
                      (int? newValue) {
                        setState(() {
                          numWashRoom = newValue!;
                          print(numWashRoom);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: const Icon(Icons.description),
                        hintText: 'Enter Description About Property',
                      ),
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
                  ],
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainNavigator(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  elevation: 5, // Change the button color as needed
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Post Property',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Container CustomDropDownMenuField(
    String fieldName,
    Widget icon,
    int selectedValue,
    void Function(int?) onChanged,
  ) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1, color: Colors.black45),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(width: 10),
          icon,
          const SizedBox(width: 16),
          Text(
            fieldName,
            style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500),
          ),
          const Expanded(child: SizedBox()),
          DropdownButton<int>(
            value: selectedValue,
            onChanged: onChanged,
            items: List.generate(
              11,
              (index) => DropdownMenuItem<int>(
                value: index,
                child: Text('$index'),
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
