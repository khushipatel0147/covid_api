import 'package:covid_api/provider/covidProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  CovidProvider? providerF;
  CovidProvider? providerT;

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<CovidProvider>(context, listen: false);
    providerT = Provider.of<CovidProvider>(context, listen: true);


    int index = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Data",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              letterSpacing: 1,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(
            Icons.download,
            color: Colors.white,
            size: 25,
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
          body: Padding(
            padding: const EdgeInsets.only(right: 15,left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                Text("Country Name:- ${providerF!.covidDataModal.response?[index].country}", style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold),),
                SizedBox(height: 15),
                Divider(endIndent: 15,color: Colors.black,thickness: 2,),
                SizedBox(height: 15),
                Text("Population :- ${providerF!.covidDataModal.response?[index].population}", style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    letterSpacing: 1,),),
                Divider(endIndent: 15,color: Colors.black,),
                SizedBox(height: 15),
                Text("Cases :- ${providerF!.covidDataModal.response?[index].cases}", style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  letterSpacing: 1,),),
                Divider(endIndent: 15,color: Colors.black,),
                SizedBox(height: 15),
                Text("Time :- ${providerF!.covidDataModal.response?[index].time}", style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  letterSpacing: 1,),),
                Divider(endIndent: 15,color: Colors.black,),
                SizedBox(height: 15),
                Text("Day :- ${providerF!.covidDataModal.response?[index].day}", style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  letterSpacing: 1,),),
                Divider(endIndent: 15,color: Colors.black,),
                SizedBox(height: 15),
                Text("Tests :- ${providerF!.covidDataModal.response?[index].tests}", style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  letterSpacing: 1,),),
                Divider(endIndent: 15,color: Colors.black,),
                SizedBox(height: 15),
                Text("Deaths :- ${providerF!.covidDataModal.response?[index].deaths}", style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  letterSpacing: 1,),),
                Divider(endIndent: 15,color: Colors.black,),
                SizedBox(height: 15),
                Text("Continent :- ${providerF!.covidDataModal.response?[index].continent}", style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  letterSpacing: 1,),),
                Divider(endIndent: 15,color: Colors.black,),
                SizedBox(height: 15),
                Text("Results :- ${providerF!.covidDataModal.results}", style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  letterSpacing: 1,),),
                Divider(endIndent: 15,color: Colors.black,),
                SizedBox(height: 15),


              ],
            ),
          ),
    ));
  }
}
