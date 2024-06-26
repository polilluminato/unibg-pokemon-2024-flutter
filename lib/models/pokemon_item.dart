class PokemonItem {
  String name;
  String url;
  int? id;
  String? imagePng;
  String? imageSvg;

  PokemonItem({
    required this.name,
    required this.url,
    this.id,
    this.imagePng,
    this.imageSvg,
  });

  factory PokemonItem.fromJson(Map<String, dynamic> data) {
    String url = data['url'] as String;
    String mameFromApi = data['name'] as String;
    //I nomi mi arrivano tutti in lowercase, in questo modo metto la prima
    //  lettera maiuscola: bulbasaur -> Bulbasaur
    String name =
        mameFromApi[0].toUpperCase() + mameFromApi.substring(1).toLowerCase();
    //Link fatto come https://pokeapi.co/api/v2/pokemon/151/ vado a prenderne id alla fine
    RegExp regExp = RegExp(r'(\d+)\/$');
    Match match = regExp.firstMatch(url)!;
    String numberString = match.group(1)!;
    int id = int.parse(numberString);

    String imagePng =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";
    String imageSvg =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/$id.svg";

    return PokemonItem(
        name: name, url: url, id: id, imagePng: imagePng, imageSvg: imageSvg);
  }
}
