class  MessageModel {
  String? image;
  String? count;
  String? titleDes;
  String? detailDes;
  String? time;

  MessageModel ({this.image, this.titleDes, this.count, this.detailDes, this.time});
}
List<MessageModel>  dataMessage = [

  MessageModel(
      image: "assets/images/message_twitter.png" ,
      count:"1",
      time:"19:10",
      titleDes:"Twitter" ,
      detailDes:"Here is the link: http://zoom.com/abcdeefg"

  ),
  MessageModel(
      image: "assets/images/message_gojek.png" ,
      count:"0",
      time:"19:20",
      titleDes:"Gojek Indonesia" ,
      detailDes:"Click here to view no message"
  ),
  MessageModel(
      image: "assets/images/message_shoope.png" ,
      count:"3",
      time:"19:30",
      titleDes:"Shoope" ,
      detailDes:"Thank You David!."
  ),
  MessageModel(
      image: "assets/images/message_dana.png" ,
      count:"4",
      time:"Yesterday",
      titleDes:"Dana" ,
      detailDes:"Thank you for your attention!."
  ),
  MessageModel(
      image: "assets/images/message_slack.png" ,
      count:"1",
      time:"Yesterday",
      titleDes:"Slack" ,
      detailDes:"Thank you for your attention!."
  ),
  MessageModel(
      image: "assets/images/message_facebook.png" ,
      count:"1",
      time:"19 April",
      titleDes:"Facebook" ,
      detailDes:"Thank you for your attention!."
  ),
];