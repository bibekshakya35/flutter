class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;

  ChatModel({
    this.name,
    this.message,
    this.time,
    this.avatarUrl
  });
}

List<ChatModel> dummyData = [
  new ChatModel(
      name: "Abishek Shakya",
      message: "Khai maile ta sodinaa",
      time: "15:30",
      avatarUrl:
          "assets/abishek.jpg"),
  new ChatModel(
      name: "Bàà Shü",
      message: "Daju kada",
      time: "17:30",
      avatarUrl:
          "assets/basu.jpg"),
  new ChatModel(
      name: "Lizesh Shakya",
      message: "Talai ma hanchu hola ho",
      time: "5:00",
      avatarUrl:
          "assets/lizesh.jpg"),
  new ChatModel(
      name: "Sujan Hyoju",
      message: "Jugaad garirachu",
      time: "10:30",
      avatarUrl:
          "assets/sujan.jpg"),
  new ChatModel(
      name: "Rinkiya k PAPA",
      message: "good",
      time: "12:30",
      avatarUrl:
          "assets/rinki.jpg"),
  new ChatModel(
      name: "Niraj Shakya",
      message: "Ramro lagena",
      time: "15:30",
      avatarUrl:
          "assets/niraj.jpg"),
];
