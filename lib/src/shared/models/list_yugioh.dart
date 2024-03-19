class YuGiOh {
  YuGiOh({
    required this.id,
    required this.name,
    required this.type,
    required this.frameType,
    required this.desc,
    required this.race,
    this.archetype,
    required this.ygoprodeckUrl,
    this.atk,
    this.def,
    this.level,
    this.attribute,
    this.pendDesc,
    this.monsterDesc,
    this.scale,
    this.linkval,
    this.banlistInfo,
    this.cardImages,
    this.cardPrices,
  });

  int id;
  String name;
  String type;
  String frameType;
  String desc;
  String race;
  String? archetype;
  String ygoprodeckUrl;
  int? atk;
  int? def;
  int? level;
  String? attribute;
  String? pendDesc;
  String? monsterDesc;
  int? scale;
  int? linkval;
  BanlistInfo? banlistInfo;
  List<CardImages>? cardImages;
  List<CardPrices>? cardPrices;

  factory YuGiOh.fromJson(Map<String, dynamic> json) => YuGiOh(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        type: json["type"] ?? '',
        frameType: json["frameType"] ?? '',
        desc: json["desc"],
        race: json["race"],
        archetype: json["archetype"],
        ygoprodeckUrl: json["ygoprodeck_url"],
        atk: json["atk"],
        def: json["def"],
        level: json["level"],
        attribute: json["attribute"],
        pendDesc: json["pend_desc"],
        monsterDesc: json["monster_desc"],
        scale: json["scale"],
        linkval: json["linkval"],
        banlistInfo: json["banlist_info"] == null
            ? null
            : BanlistInfo.fromJson(json["banlist_info"]),
        cardImages: json["card_images"] == null
            ? null
            : List<CardImages>.from(
                json["card_images"].map(
                  (x) => CardImages.fromJson(x),
                ),
              ),
        cardPrices: json["card_prices"] == null
            ? null
            : List<CardPrices>.from(
                json["card_prices"].map(
                  (x) => CardPrices.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "frameType": frameType,
        "desc": desc,
        "race": race,
        "archetype": archetype,
        "ygoprodeck_url": ygoprodeckUrl,
        "atk": atk,
        "def": def,
        "level": level,
        "attribute": attribute,
        "pend_desc": pendDesc,
        "monster_desc": monsterDesc,
        "scale": scale,
        "linkval": linkval,
        "banlist_info": banlistInfo?.toJson(),
        "card_images":
            List<CardImages>.from(cardImages!.map((x) => x.toJson())),
      };
}

class BanlistInfo {
  String? banGoat;
  String? banTcg;
  String? banOcg;

  BanlistInfo({
    this.banGoat,
    this.banTcg,
    this.banOcg,
  });

  factory BanlistInfo.fromJson(Map<String, dynamic> json) => BanlistInfo(
        banGoat: json["ban_goat"] ?? '',
        banTcg: json["ban_tcg"] ?? '',
        banOcg: json["ban_ocg"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "ban_goat": banGoat,
        "ban_tcg": banTcg,
        "ban_ocg": banOcg,
      };
}

class CardImages {
  int? id;
  String? imageUrl;
  String? imageUrlSmall;
  String? imageUrlCropped;

  CardImages({
    this.id,
    this.imageUrl,
    this.imageUrlSmall,
    this.imageUrlCropped,
  });

  factory CardImages.fromJson(Map<String, dynamic> json) => CardImages(
        id: json["id"] ?? 0,
        imageUrl: json["image_url"] ?? '',
        imageUrlSmall: json["image_url_small"] ?? '',
        imageUrlCropped: json["image_url_cropped"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_url": imageUrl,
        "image_url_small": imageUrlSmall,
        "image_url_cropped": imageUrlCropped,
      };
}

class CardPrices {
  CardPrices({
    this.cardmarketPrice,
    this.tcgplayerPrice,
    this.ebayPrice,
    this.amazonPrice,
    this.coolstuffincPrice,
  });

  String? cardmarketPrice;
  String? tcgplayerPrice;
  String? ebayPrice;
  String? amazonPrice;
  String? coolstuffincPrice;

  factory CardPrices.fromJson(Map<String, dynamic> json) => CardPrices(
        cardmarketPrice: json["cardmarket_price"] ?? '',
        tcgplayerPrice: json["tcgplayer_price"] ?? '',
        ebayPrice: json["ebay_price"] ?? '',
        amazonPrice: json["amazon_price"] ?? '',
        coolstuffincPrice: json["coolstuffinc_price"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "cardmarket_price": cardmarketPrice,
        "tcgplayer_price": tcgplayerPrice,
        "ebay_price": ebayPrice,
        "amazon_price": amazonPrice,
        "coolstuffinc_price": coolstuffincPrice,
      };
}
