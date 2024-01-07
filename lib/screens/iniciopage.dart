import 'package:flutter/material.dart';
import 'package:tech_ecommerce/screens/searchscreen.dart';
import 'package:tech_ecommerce/widgets/drawer.dart';
import 'package:tech_ecommerce/widgets/tabbarmenu.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    String searchText = "";
    return Scaffold(
      body: Container(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 63.0, 0.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 20,
                            ),
                            child: IconButton(
                                onPressed: () {
                                  print('Presionando');
                                  AppDrawer.of(context)?.toggle();
                                },
                                icon: const Icon(Icons.menu, size: 30)),
                          ),
                          SizedBox(
                              width: 267.0,
                              child: TextField(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SearchScreen()),
                                  );
                                },
                                onSubmitted: (value) {},
                                controller: searchController,
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                  suffixIcon: searchText.isNotEmpty
                                      ? IconButton(
                                          icon: const Icon(Icons.clear),
                                          onPressed: () {},
                                        )
                                      : null,
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30.0),
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.only(right: 40, top: 55.0, left: 50),
                      child: Text(
                        'Order online collect in store',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 34.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    //Caroussel()
                    const Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: SelectionScreen(),
                    )
                  ],
                ),
              ))),
    );
  }
}
