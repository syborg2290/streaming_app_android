class TopStreamModel {
  String? userName;
  String? userAvatar;
  String? gameName;
  String? thumbnail;
  String? liveWatchingCount;

  TopStreamModel({
    this.gameName,
    this.thumbnail,
    this.userAvatar,
    this.userName,
    this.liveWatchingCount,
  });
}

List<TopStreamModel> trendingStreams = [
  TopStreamModel(
    gameName: "BGMI",
    thumbnail: 'assets/images/bgmi.jpeg',
    userAvatar: 'assets/images/user1.jpeg',
    userName: 'LightYear Gaming',
    liveWatchingCount: "55k",
  ),
  TopStreamModel(
    gameName: "Valorant",
    thumbnail: 'assets/images/valo.jpg',
    userAvatar: 'assets/images/user2.jpg',
    userName: 'John Gaming',
    liveWatchingCount: "32.5k",
  ),
  TopStreamModel(
    gameName: "Free Fire",
    thumbnail: 'assets/images/ff.jpg',
    userAvatar: 'assets/images/user3.jpg',
    userName: 'Doe Gaming',
    liveWatchingCount: "10k",
  ),
];
