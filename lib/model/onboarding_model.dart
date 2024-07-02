// to create 3 screens of onboarding and pass to it the images and description
// the button is removed from here to control visiability of it
class  OnboardingModel {
  String? image;
  String? titleDes;
  String? detailDes;

  OnboardingModel ({this.image, this.titleDes, this.detailDes});
  }

  List<OnboardingModel>  dataOnboarding = [

    OnboardingModel(
        image: "assets/images/Background_onboarding1.png" ,
        titleDes:"Find a job, and start building your career from now on" ,
        detailDes:"Explore over 25,924 available job roles and upgrade your operator now."
    ),
    OnboardingModel(
        image: "assets/images/Background_onboarding2.png",
        titleDes:"Hundreds of jobs are waiting for you to join together" ,
        detailDes:"Immediately join us and start applying for the job you are interested in."
    ),
    OnboardingModel(
        image: "assets/images/Background_onboarding3.png" ,
        titleDes: "Get the best choice for the job you've always dreamed of" ,
        detailDes: "The better the skills you have, the greater the good job opportunities for you."
    ),
  ];