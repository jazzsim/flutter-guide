class AllCharacterModel {
  final List<CharacterModel> listOfCharacterModels;

  AllCharacterModel({required this.listOfCharacterModels});
}

class CharacterModel {
    final int? id;
    final String? firstName;
    final String? lastName;
    final String? fullName;
    final String? title;
    final String? family;
    final String? image;
    final String? imageUrl;

    CharacterModel({
        this.id,
        this.firstName,
        this.lastName,
        this.fullName,
        this.title,
        this.family,
        this.image,
        this.imageUrl,
    });

    factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        title: json["title"],
        family: json["family"],
        image: json["image"],
        imageUrl: json["imageUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "fullName": fullName,
        "title": title,
        "family": family,
        "image": image,
        "imageUrl": imageUrl,
    };
}
