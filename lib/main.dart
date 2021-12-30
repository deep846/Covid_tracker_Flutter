import 'package:covid_tracker/Widgets/info_screen.dart';
import 'package:covid_tracker/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:covid_tracker/brain.dart';
import 'package:intl/intl.dart' as dt;
import 'package:intl/intl.dart';
import 'Widgets/counter.dart';
import 'Widgets/my_header.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid Tracker',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: "Poppins",
        textTheme: TextTheme(
          bodyText2: TextStyle(color: kBodyTextColor),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var death = 0;
  var infected = 0;
  var recovered = 0;
  var date = DateFormat("dd-MM-yy").format(DateTime.now());
  String flag = "https://disease.sh/assets/img/flags/in.png";
  String s = "home";
  var data;
  String countryname = "India";
  @override
  void initState()  {
    super.initState();
    getdata();
  }
  //TODO: Change number as M for million as well as for B for Billion
  void getdata() async{
    AppBrain ab = new AppBrain(countryname);
    var data = await ab.loaddata();
    setState(() {
      death=data['deaths'];
      infected = data['cases'];
      recovered = data['recovered'];
      flag = data['countryInfo']['flag'];
      date = DateFormat.yMMMd().format(DateTime.now());
    });
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{
        getdata();
        setState(() {

        });
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyHeader(
                image: "assets/icons/Drcorona.svg",
                textTop: "All you need",
                textBottom: "is stay at home",
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffF3F3F3),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Color(0xFFE5E5E5),
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only( right: 16.0),
                      child: Image.network(flag, width: 50,),
                    ),
                    Expanded(
                      child: DropdownButton(
                        isExpanded: true,
                        underline: SizedBox(),
                        icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                        value: countryname,
                        //TODO: Change the all not working country name
                        items: [
                          "Afghanistan",
                          "Albania",
                          "Algeria",
                          "American Samoa",
                          "Andorra",
                          "Angola",
                          "Anguilla",
                          "Antarctica",
                          "Antigua and Barbuda",
                          "Argentina",
                          "Armenia",
                          "Aruba",
                          "Australia",
                          "Austria",
                          "Azerbaijan",
                          "Bahamas",
                          "Bahrain",
                          "Bangladesh",
                          "Barbados",
                          "Belarus",
                          "Belgium",
                          "Belize",
                          "Benin",
                          "Bermuda",
                          "Bhutan",
                          "Bolivia",
                          "Bonaire",
                          "Bosnia and Herzegovina",
                          "Botswana",
                          "BouvetIsland",
                          "Brazil",
                          "British Indian Ocean Territory",
                          "Brunei Darussalam",
                          "Bulgaria",
                          "Burkina Faso",
                          "Burundi",
                          "Cabo Verde",
                          "Cambodia",
                          "Cameroon",
                          "Canada",
                          "Cayman Islands (the)",
                          "Central African Republic (the)",
                          "Chad",
                          "Chile",
                          "China",
                          "Christmas Island",
                          "Cocos (Keeling) Islands (the)",
                          "Colombia",
                          "Comoros (the)",
                          "Congo (the Democratic Republic of the)",
                          "Congo (the)",
                          "Cook Islands (the)",
                          "Costa Rica",
                          "Croatia",
                          "Cuba",
                          "Curaçao",
                          "Cyprus",
                          "Czechia",
                          "Côte d'Ivoire",
                          "Denmark",
                          "Djibouti",
                          "Dominica",
                          "Dominican Republic (the)",
                          "Ecuador",
                          "Egypt",
                          "El Salvador",
                          "Equatorial Guinea",
                          "Eritrea",
                          "Estonia",
                          "Eswatini",
                          "Ethiopia",
                          "Falkland Islands (the) [Malvinas]",
                          "Faroe Islands (the)",
                          "Fiji",
                          "Finland",
                          "France",
                          "French Guiana",
                          "French Polynesia",
                          "French Southern Territories (the)",
                          "Gabon",
                          "Gambia (the)",
                          "Georgia",
                          "Germany",
                          "Ghana",
                          "Gibraltar",
                          "Greece",
                          "Greenland",
                          "Grenada",
                          "Guadeloupe",
                          "Guam",
                          "Guatemala",
                          "Guernsey",
                          "Guinea",
                          "Guinea-Bissau",
                          "Guyana",
                          "Haiti",
                          "Heard Island and McDonald Islands",
                          "Holy See (the)",
                          "Honduras",
                          "Hong Kong",
                          "Hungary",
                          "Iceland",
                          "India",
                          "Indonesia",
                          "Iran (Islamic Republic of)",
                          "Iraq",
                          "Ireland",
                          "Isle of Man",
                          "Israel",
                          "Italy",
                          "Jamaica",
                          "Japan",
                          "Jersey",
                          "Jordan",
                          "Kazakhstan",
                          "Kenya",
                          "Kiribati",
                          "Korea (the Democratic People's Republic of)",
                          "Korea (the Republic of)",
                          "Kuwait",
                          "Kyrgyzstan",
                          "Lao People's Democratic Republic (the)",
                          "Latvia",
                          "Lebanon",
                          "Lesotho",
                          "Liberia",
                          "Libya",
                          "Liechtenstein",
                          "Lithuania",
                          "Luxembourg",
                          "Macao",
                          "Madagascar",
                          "Malawi",
                          "Malaysia",
                          "Maldives",
                          "Mali",
                          "Malta",
                          "Marshall Islands (the)",
                          "Martinique",
                          "Mauritania",
                          "Mauritius",
                          "Mayotte",
                          "Mexico",
                          "Micronesia (Federated States of)",
                          "Moldova (the Republic of)",
                          "Monaco",
                          "Mongolia",
                          "Montenegro",
                          "Montserrat",
                          "Morocco",
                          "Mozambique",
                          "Myanmar",
                          "Namibia",
                          "Nauru",
                          "Nepal",
                          "Netherlands (the)",
                          "New Caledonia",
                          "New Zealand",
                          "Nicaragua",
                          "Niger (the)",
                          "Nigeria",
                          "Niue",
                          "Norfolk Island",
                          "Northern Mariana Islands (the)",
                          "Norway",
                          "Oman",
                          "Pakistan",
                          "Palau",
                          "Palestine, State of",
                          "Panama",
                          "Papua New Guinea",
                          "Paraguay",
                          "Peru",
                          "Philippines (the)",
                          "Pitcairn",
                          "Poland",
                          "Portugal",
                          "Puerto Rico",
                          "Qatar",
                          "Republic of North Macedonia",
                          "Romania",
                          "Russian Federation (the)",
                          "Rwanda",
                          "Réunion",
                          "Saint Barthélemy",
                          "Saint Helena, Ascension and Tristan da Cunha",
                          "Saint Kitts and Nevis",
                          "Saint Lucia",
                          "Saint Martin (French part)",
                          "Saint Pierre and Miquelon",
                          "Saint Vincent and the Grenadines",
                          "Samoa",
                          "San Marino",
                          "Sao Tome and Principe",
                          "Saudi Arabia",
                          "Senegal",
                          "Serbia",
                          "Seychelles",
                          "Sierra Leone",
                          "Singapore",
                          "Sint Maarten (Dutch part)",
                          "Slovakia",
                          "Slovenia",
                          "Solomon Islands",
                          "Somalia",
                          "South Africa",
                          "South Georgia and the South Sandwich Islands",
                          "South Sudan",
                          "Spain",
                          "Sri Lanka",
                          "Sudan (the)",
                          "Suriname",
                          "Svalbard and Jan Mayen",
                          "Sweden",
                          "Switzerland",
                          "Syrian Arab Republic",
                          "Taiwan",
                          "Tajikistan",
                          "Tanzania, United Republic of",
                          "Thailand",
                          "Timor-Leste",
                          "Togo",
                          "Tokelau",
                          "Tonga",
                          "Trinidad and Tobago",
                          "Tunisia",
                          "Turkey",
                          "Turkmenistan",
                          "Turks and Caicos Islands (the)",
                          "Tuvalu",
                          "Uganda",
                          "Ukraine",
                          "United Arab Emirates (the)",
                          "United Kingdom of Great Britain and Northern Ireland (the)",
                          "United States Minor Outlying Islands (the)",
                          "United States of America (the)",
                          "Uruguay",
                          "Uzbekistan",
                          "Vanuatu",
                          "Venezuela (Bolivarian Republic of)",
                          "Viet Nam",
                          "Virgin Islands (British)",
                          "Virgin Islands (U.S.)",
                          "Wallis and Futuna",
                          "Western Sahara",
                          "Yemen",
                          "Zambia",
                          "Zimbabwe",
                          "Åland Islands"
                        ]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            countryname = value.toString();
                            getdata();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Case Update\n", style: kTitleTextstyle),
                            TextSpan(
                              text: "Newest Update $date",
                              style: TextStyle(
                                color: kTextLightColor,
                              ),
                            ),
                          ]),
                        ),
                        Spacer(),
                        Text(
                          'See Details',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 30,
                              color: kShadowColor,
                            ),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Counter(
                            color: kInfectedColor,
                            title: 'Infected',
                            num: infected,
                          ),
                          Counter(
                            color: kDeathColor,
                            title: 'Deaths',
                            num: death,
                          ),
                          Counter(
                            color: kRecovercolor,
                            title: 'Recovered',
                            num: recovered,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Spread of virus",
                          style: kTitleTextstyle,
                        ),
                        Text(
                          "See Details",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.all(20),
                      height: 178,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 30,
                              color: kShadowColor,
                            ),
                          ]),
                      //TODO: Add a pi chart here instead of the image on line no 482
                      child: Image.asset(
                        "assets/images/map.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
