class City {
  final String description;
  final String placeId;
  final String mainText;
  final String secondaryText;  
 final dynamic types;  

 


  City({
    required this.description,
    required this.placeId,
    required this.mainText,
    required this.secondaryText,
    required this.types,



  });

  factory City.fromJson(Map<String, dynamic> json) {
    final structuredFormatting = json['structured_formatting'];
    return City(
      description: json['description'],
      placeId: json['place_id'],
      types: json['types'],
      mainText: structuredFormatting['main_text'],
      secondaryText: structuredFormatting['secondary_text'],

      
    ); 
  }


 @override
  String toString() => ''' 
    Description: $description
    Place ID: $placeId
    City: $mainText
    Country: $secondaryText
    Types: $types



    ''';
}

class CityDetails_with_id {
  final String formatted_address;
  CityDetails_with_id({
    required this.formatted_address,


  });
  factory CityDetails_with_id.fromJson(Map<String, dynamic> json) {
  final result = json['result'];
  return CityDetails_with_id(
    formatted_address: result['formatted_address'] ?? '',
  );
}

//adr_address

 @override
  String toString() => ''' 
    Formatted address: $formatted_address
    ''';
}