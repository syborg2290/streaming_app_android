class TopStreamer {
  String? name;
  String? thumbnail;
  String? followers;
  String? type1;
  String? type2;
  String? viewers;

  TopStreamer({
    this.name,
    this.thumbnail,
    this.followers,
    this.type1,
    this.type2,
    this.viewers,
  });
}

List<TopStreamer> topStreamer = [
  TopStreamer(
    name: "VALORANT",
    thumbnail: 'assets/images/valo_logo.jpg',
    followers: "10.5M",
    viewers: "320k",
    type1: "Shooter",
    type2: "FPS",
  ),
  TopStreamer(
    name: "FREEFIRE",
    thumbnail: 'assets/images/ff_logo.jpg',
    followers: "10.5M",
    viewers: "89k",
    type1: "Shooter",
    type2: "FPS",
  ),
  TopStreamer(
    name: "BGMI",
    thumbnail: 'assets/images/bgmi_logo.jpg',
    followers: "19.5M",
    viewers: "221k",
    type1: "Shooter",
    type2: "FPS",
  ),
  TopStreamer(
    name: "FORTNITE",
    thumbnail: 'assets/images/fortnite_logo.jpg',
    followers: "10.5M",
    viewers: "121k",
    type1: "Shooter",
    type2: "FPS",
  ),
];
