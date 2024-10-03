class Avenger {
  final String name;
  final String connections;
  final String powerstats;
  final String image;

  Avenger({
    required this.name,
    required this.connections,
    required this.powerstats,
    required this.image,
  });
  factory Avenger.fromJson(Map<String, dynamic> json){
    return Avenger(
        name: json['name'],
        connections: json['connections'],
        powerstats: json['powerstats'],
        image: json['image'],
    );
  }
}

class AvengerListResponse {
  final List<Avenger> avengers;

  AvengerListResponse({required this.avengers});

  factory AvengerListResponse.fromJson(Map<String, dynamic> json){
    var list = json['connections'] as List;
    List<Avenger> avengerList = list.map((i) => Avenger.fromJson(i)).toList();
    return AvengerListResponse(avengers: avengerList);
  }
}