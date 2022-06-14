import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../state/provider.dart';
import '../menu/menu.dart';
import '../notification/notifications.dart';
import '../pickcity/pick_city.dart';
import 'widgets/topcontainer.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = "ProfilePage";

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  NavigationHistoryObserver navHistory = NavigationHistoryObserver();
  bool currentEditState = false;

  void setterState() {
    setState(() {
      currentEditState = !currentEditState;
    });
  }

  Map<String, String> ProfileInfo = {
    "Garage Name": "Sukanto Garage",
    "Person Name": "",
    "Gender": "Male",
    "Birthday": "23/12/2002",
    "Email": "sukantoyo@tanmay.com",
    "Phone": "7834729223",
    "Garage Registetration Number": "",
    "Garage Address": "",
    "State": "",
    "City": "",
  };

  final _picker = ImagePicker();

  XFile? profileImage;
  void profileImageSelecter() async {
    var dp = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (dp != null) profileImage = dp;
    });
  }

  // I used unique func for each image selection.

  File? image1;
  bool image1marker = false;
  void selectImage1() async {
    var img = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (img != null) {
        image1 = File(img.path);
        image1marker = true;
      }
    });
  }

  File? image2;
  bool image2marker = false;
  void selectImage2() async {
    var img = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (img != null) {
        image2 = File(img.path);
        image2marker = true;
      }
    });
  }

  File? image3;
  bool image3marker = false;
  void selectImage3() async {
    var img = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (img != null) {
        image3 = File(img.path);
        image3marker = true;
      }
    });
  }
  // Image Selection Upto //

  final _formKey = GlobalKey<FormState>();

  void FormSaver() {
    // _formKey.currentState?.validate();
    _formKey.currentState?.save();
    setState(() {
      setterState();
    });
  }

  final _key = GlobalKey<ScaffoldState>();
  Placemark pm = Placemark(locality: "Jalpaiguri");
  var notificationsCount = 12;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var InfoFlow = Provider.of<InfoFlower>(context);

    return Scaffold(
      key: _key,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, size.height * 0.07),
        child: AppBar(
          backgroundColor: Colors.red,
          title: Row(
            children: [
              Text(
                "BEE",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              IconButton(
                onPressed: () {
                  // Navigator.of(context).popUntil(ModalRoute.withName("/"));
                  // Navigator.of(context).popUntil(
                  //     (route) => route.settings.name == "ScreenToPopBackTo");
                  pushNewScreenWithRouteSettings(
                    context,
                    settings:
                        const RouteSettings(name: Notifications.routeName),
                    screen: const Notifications(),
                    withNavBar: true,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (ctx) => Notifications()),
                  // );
                },
                icon: InfoFlow.notificationCount != 0
                    ? const Icon(Icons.notifications_active_outlined)
                    : const Icon(Icons.notifications_none_outlined),
                color: Colors.white,
                iconSize: 20,
                tooltip: "Notifications",
              ),
            ],
          ),
          leading: IconButton(
            onPressed: () {
              _key.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.menu_rounded,
              color: Colors.white,
            ),
          ),
          actions: [
            TextButton.icon(
              onPressed: () {
                pushNewScreenWithRouteSettings(
                  context,
                  settings: const RouteSettings(name: PickCity.routeName),
                  screen: const PickCity(),
                  withNavBar: true,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
                // Navigator.of(context).pushNamed(PickCity.routeName);
              },
              icon: const Icon(
                Icons.maps_home_work,
                size: 12,
                color: Colors.white,
              ),
              label: Text(
                "${pm.locality}",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              style: const ButtonStyle(
                  // fixedSize: MaterialStateProperty.all(Size(32, 2)),
                  ),
            ),
          ],
        ),
      ),
      drawer: Menu(),
      body: (currentEditState)
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                      vertical: size.height * 0.02,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: size.width * 0.1,
                          width: size.height * 0.053,
                          child: Card(
                            child: IconButton(
                              splashColor: Colors.red,
                              icon: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                              ),
                              iconSize: 12,
                              onPressed: setterState,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        const Text(
                          "Fill details",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.05, bottom: 2),
                          child: const Text(
                            "Full Name",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.2),
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 5,
                          ),
                          // padding: const EdgeInsets.symmetric(vertical: 16),
                          height: size.height * 0.065,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: "Tanmay Sarkar",
                              hintStyle: TextStyle(fontSize: 14),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 12,
                              ),
                            ),
                            onSaved: (val) {
                              ProfileInfo["Person Name"] = val!;
                            },
                            initialValue: ProfileInfo['Person Name'],
                          ),
                        ),

                        //
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 18,
                            bottom: 2,
                            top: 8,
                          ),
                          child: Text(
                            "Phone Number",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.2),
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 5,
                          ),
                          // padding: const EdgeInsets.symmetric(vertical: 16),
                          height: size.height * 0.065,
                          child: TextFormField(
                            validator: ((value) {
                              if (value!.length != 10) {
                                return "Only 10 Digits.";
                              }
                              return null;
                            }),
                            onSaved: (val) {
                              if (val != null) {
                                ProfileInfo['Phone'] = val;
                              }
                            },
                            initialValue: ProfileInfo["Phone"],
                            decoration: const InputDecoration(
                              hintText: "",
                              hintStyle: TextStyle(fontSize: 14),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 12,
                              ),
                            ),
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.only(
                            left: 18,
                            bottom: 2,
                            top: 8,
                          ),
                          child: Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.2),
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 5,
                          ),
                          // padding: const EdgeInsets.symmetric(vertical: 16),
                          height: size.height * 0.065,
                          child: TextFormField(
                            onSaved: (val) {
                              if (val != null) {
                                ProfileInfo['Email'] = val;
                              }
                            },
                            validator: (val) {
                              if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val!)) {
                                return "Enter valid email.";
                              }
                              return null;
                            },
                            initialValue: ProfileInfo["Email"],
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: "sarkartanmay393@gmail.com",
                              hintStyle: TextStyle(fontSize: 14),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 12,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 18,
                            bottom: 2,
                            top: 8,
                          ),
                          child: Text(
                            "Garage Name",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.2),
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 5,
                          ),
                          // padding: const EdgeInsets.symmetric(vertical: 16),
                          height: size.height * 0.065,
                          child: TextFormField(
                            onSaved: (val) {
                              if (val != null) {
                                ProfileInfo['Garage Name'] = val;
                              }
                            },
                            validator: (val) {
                              return null;
                            },
                            initialValue: ProfileInfo["Garage Name"],
                            decoration: const InputDecoration(
                              hintText: "",
                              hintStyle: TextStyle(fontSize: 14),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 12,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 18,
                            bottom: 2,
                            top: 8,
                          ),
                          child: Text(
                            "Garage Registetration Number",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.2),
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 5,
                          ),
                          // padding: const EdgeInsets.symmetric(vertical: 16),
                          height: size.height * 0.065,
                          child: TextFormField(
                            onSaved: (newValue) {
                              ProfileInfo['Garage Registetration Number'] =
                                  newValue!;
                            },
                            validator: (val) {
                              return null;
                            },
                            initialValue:
                                ProfileInfo['Garage Registetration Number'],
                            decoration: const InputDecoration(
                              hintText: "",
                              hintStyle: TextStyle(fontSize: 14),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 12,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 18,
                            bottom: 2,
                            top: 8,
                          ),
                          child: Text(
                            "Garage Address",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.2),
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 5,
                          ),
                          // padding: const EdgeInsets.symmetric(vertical: 16),
                          height: size.height * 0.065,
                          child: TextFormField(
                            onSaved: (val) {
                              ProfileInfo["Garage Address"] = val!;
                            },
                            validator: (_) {
                              return null;
                            },
                            initialValue: ProfileInfo['Garage Address'],
                            decoration: const InputDecoration(
                              hintText: "...",
                              hintStyle: TextStyle(fontSize: 14),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 12,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 18,
                            bottom: 2,
                            top: 8,
                          ),
                          child: Text(
                            "State",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.2),
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 5,
                          ),
                          // padding: const EdgeInsets.symmetric(vertical: 16),
                          height: size.height * 0.065,
                          child: TextFormField(
                            onSaved: (val) {
                              ProfileInfo["State"] = val!;
                            },
                            validator: (_) {
                              return null;
                            },
                            initialValue: ProfileInfo['State'],
                            decoration: const InputDecoration(
                              hintText: "West Bengal",
                              hintStyle: TextStyle(fontSize: 14),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 12,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 18,
                            bottom: 2,
                            top: 8,
                          ),
                          child: Text(
                            "City",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.2),
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 5,
                          ),
                          // padding: const EdgeInsets.symmetric(vertical: 16),
                          height: size.height * 0.065,
                          child: TextFormField(
                            onSaved: (val) {
                              ProfileInfo["City"] = val!;
                            },
                            validator: (_) {
                              return null;
                            },
                            initialValue: ProfileInfo['City'],
                            decoration: const InputDecoration(
                              hintText: "",
                              hintStyle: TextStyle(fontSize: 14),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 12,
                              ),
                            ),
                          ),
                        ),
                        // Image Inputs

                        const Padding(
                          padding: EdgeInsets.only(
                            left: 18,
                            bottom: 2,
                            top: 8,
                          ),
                          child: Text(
                            "Add Garage Image",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        // image row
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            top: 5,
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: selectImage1,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 2,
                                    horizontal: 5,
                                  ),
                                  height: 75,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 0.8),
                                  ),
                                  child: image1marker
                                      ? Image.file(
                                          image1!,
                                          fit: BoxFit.cover,
                                        )
                                      : const Icon(Icons.add),
                                ),
                              ),
                              InkWell(
                                onTap: selectImage2,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 2,
                                    horizontal: 5,
                                  ),
                                  height: 75,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 0.8),
                                  ),
                                  child: image2marker
                                      ? Image.file(
                                          image2!,
                                          fit: BoxFit.cover,
                                        )
                                      : const Icon(Icons.add),
                                ),
                              ),
                              InkWell(
                                onTap: selectImage3,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 2,
                                    horizontal: 5,
                                  ),
                                  height: 75,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 0.8),
                                  ),
                                  child: image3marker
                                      ? Image.file(
                                          image1!,
                                          fit: BoxFit.cover,
                                        )
                                      : const Icon(Icons.add),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // extras
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 18,
                            bottom: 2,
                            top: 8,
                          ),
                          child: Text(
                            "Add Documents",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            top: 5,
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 5,
                                ),
                                height: 75,
                                width: 75,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 0.8),
                                ),
                                child: const Icon(Icons.add),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 5,
                                ),
                                height: 75,
                                width: 75,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 0.8),
                                ),
                                child: const Icon(Icons.add),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 5,
                                ),
                                height: 75,
                                width: 75,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 0.8),
                                ),
                                child: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                    onPressed: FormSaver,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      fixedSize: MaterialStateProperty.all(const Size(350, 12)),
                    ),
                    child: const Text(
                      "Update",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            )
          : Column(
              children: [
                TopContainer(
                  profileImageSelecter: profileImageSelecter,
                  profileImage: profileImage,
                ),
                Column(
                  //padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  children: [
                    ListTile(
                      leading: const Icon(Icons.car_crash_outlined),
                      title: const Text(
                        "Garage Name",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                      trailing: InkWell(
                        onTap: setterState,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              ProfileInfo['Garage Name']!,
                            ),
                            const Icon(Icons.navigate_next_outlined)
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.question_mark_rounded),
                      title: const Text(
                        "Gender",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                      trailing: InkWell(
                        onTap: setterState,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              ProfileInfo['Gender']!,
                            ),
                            const Icon(Icons.navigate_next_outlined)
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.date_range_outlined),
                      title: const Text(
                        "Birthdate",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                      trailing: InkWell(
                        onTap: setterState,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              ProfileInfo['Birthday']!,
                            ),
                            const Icon(Icons.navigate_next_outlined)
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.email_outlined),
                      title: const Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                      trailing: InkWell(
                        onTap: setterState,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              ProfileInfo['Email']!,
                            ),
                            const Icon(Icons.navigate_next_outlined)
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.phone_callback_outlined),
                      title: const Text(
                        "Phone Number",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                      trailing: InkWell(
                        onTap: setterState,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              ProfileInfo['Phone']!,
                            ),
                            const Icon(Icons.navigate_next_outlined)
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: TextButton.icon(
                        label: const Text(
                          "Edit",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: setterState,
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: Colors.black,
                        ),
                        style: const ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.padded),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 18,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        width: double.infinity,
                        height: 50,
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.logout_outlined,
                            color: Colors.red,
                          ),
                          label: const Text(
                            "Logout",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
