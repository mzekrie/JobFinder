// to create 3 screens of onboarding and pass to it the images and description
// the button is removed from here to control visiability of it
class  JobsPeopleModel {
  String? image;
  String? name;
  String? job_title;
  String? work_duration;
  String? duration;

  JobsPeopleModel({this.image, this.name, this.job_title, this.work_duration, this.duration});
}

List<JobsPeopleModel >  dataJobsPeople = [

  JobsPeopleModel(
      image: "assets/images/jp1.png" ,
      name:"Dimas Adi Saputro" ,
      job_title:"Senior UI/UX Designer at Twitter",
      work_duration:"Working Duration",
      duration:"5 Years",
  ),
  JobsPeopleModel(
    image: "assets/images/jp2.png" ,
    name:"Syahrul Ramadhani" ,
    job_title:"Senior UI/UX Designer at Twitter",
    work_duration:"Working Duration",
    duration:"4 Years",
  ),
  JobsPeopleModel(
    image: "assets/images/jp3.png" ,
    name:"Farrel Daniswara" ,
    job_title:"Senior UI/UX Designer at Twitter",
    work_duration:"Working Duration",
    duration:"3 Years",
  ),
  JobsPeopleModel(
    image: "assets/images/jp4.png" ,
    name:"Azzahra Farrelika" ,
    job_title:"Senior UI/UX Designer at Twitter",
    work_duration:"Working Duration",
    duration:"5 Years",
  ),
  JobsPeopleModel(
    image: "assets/images/jp2.png" ,
    name:" Ramadhani Syahrul" ,
    job_title:"UI/UX Designer at Twitter",
    work_duration:"Working Duration",
    duration:"4 Years",
  ),
  JobsPeopleModel(
    image: "assets/images/jp3.png" ,
    name:"Mary Daniswara" ,
    job_title:"Senior UI/UX Designer at Twitter",
    work_duration:"Working Duration",
    duration:"3 Years",
  ),
];