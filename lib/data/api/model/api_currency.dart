class ApiCurrency {
  final num curID;
  final String date;
  final String curAbbreviation;
  final num curScale;
  final String curName;
  final num curOfficialRate;

  ApiCurrency.fromApi(Map<String, dynamic> map)
      : curID = map['Cur_ID'],
        date = map['Date'],
        curAbbreviation = map['Cur_Abbreviation'],
        curScale = map['Cur_Scale'],
        curName = map['Cur_Name'],
        curOfficialRate = map['Cur_OfficialRate'];
}
