class  AlertNotificatonModel {
  String? image;
  String? date;
  String? titleDes;
  String? detailDes;
  String? time;

  AlertNotificatonModel ({this.image, this.titleDes, this.date, this.detailDes, this.time});
}
List<AlertNotificatonModel>  newDataMessage = [
  AlertNotificatonModel(
      image: "assets/images/message_dana.png" ,
      date:"New",
      time:"10:00 AM",
      titleDes:"Dana" ,
      detailDes:"Posted new design jobs"
  ),
  AlertNotificatonModel(
      image: "assets/images/message_twitter.png" ,
      date:"New",
      time:"08:00 PM",
      titleDes:"Twitter" ,
      detailDes:"Posted new design jobs"

  ),
  AlertNotificatonModel(
      image: "assets/images/message_gojek.png" ,
      date:"New",
      time:"01:00 PM",
      titleDes:"Gojek Indonesia" ,
      detailDes:"Posted new design jobs"
  ),
  AlertNotificatonModel(
      image: "assets/images/message_shoope.png" ,
      date:"New",
      time:"11:00 AM",
      titleDes:"Shoope" ,
      detailDes:"Posted new design jobs"
  ),

  AlertNotificatonModel(
      image: "assets/images/message_slack.png" ,
      date:"New",
      time:"08:00 AM",
      titleDes:"Slack" ,
      detailDes:"Thank you for your attention!."
  ),

];
List<AlertNotificatonModel>  yesterdayDataMessage = [

  AlertNotificatonModel(
      image: "assets/images/a_email.png" ,
      date:"Yesterday",
      time:"10:00 AM",
      titleDes:"Email setup successful" ,
      detailDes:"Your email setup was successful with the following details: Your new email is rafifdianganz@gmail.com.."
  ),
  AlertNotificatonModel(
      image: "assets/images/a_jobsearch.png" ,
      date:"Yesterday",
      time:"08:00 AM",
      titleDes:"Welcome to Jobsque" ,
      detailDes:"Hello Rafif Dian Axelingga, thank you for registering Jobsque. Enjoy the various features that...."
  ),
];