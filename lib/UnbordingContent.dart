class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Find Help Nearby',
      image: 'assets/sc.png',
      discription: "Lorem Ipsum is simply dummy text of the\n printing and typesetting industry.\nLorem Ipsum has. "
  ),
  UnbordingContent(
      title: 'Get Help Fast',
      image: 'assets/sc1.png',
      discription: "Lorem Ipsum is simply dummy text of the\n printing and typesetting industry.\nLorem Ipsum has. "

  ),
  UnbordingContent(
      title: 'Request Services...',
      image: 'assets/sc2.png',
      discription: "Lorem Ipsum is simply dummy text of the\n printing and typesetting industry.\nLorem Ipsum has. "

  ),
];