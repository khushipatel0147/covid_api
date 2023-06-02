import 'package:covid_api/modal/covidDataModal.dart';
import 'package:covid_api/provider/covidProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CovidProvider>(context, listen: false).data();
  }

  CovidProvider? providerF;
  CovidProvider? providerT;

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<CovidProvider>(context, listen: false);
    providerT = Provider.of<CovidProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.black,
              title: Text(
                "Covid 19 Data",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold),
              ),
              actions: [
                Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 25,
                ),
                SizedBox(
                  width: 15,
                )
              ],
            ),
            body: providerT!.covidDataModal.response!.isEmpty
                ? Center(
                    child: CircularProgressIndicator(color: Colors.black),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) => my(index),
                    itemCount: providerT!.covidDataModal.response?.length,
                  )));
  }

  Widget my(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'data',arguments: index);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.flag,
                    color: Colors.black38,
                    size: 30,
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${providerF!.covidDataModal.response?[index].country}", style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,),),
                      SizedBox(height: 6),
                      Text("${providerF!.covidDataModal.response?[index].cases!.total}", style: TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                        letterSpacing: 1,),),
                    ],
                  ),

                ],
              ),
            ),
          ),
          Divider(color: Colors.black,thickness: 0.5,)

        ],
      ),
    );
  }
}
