// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, camel_case_types, non_constant_identifier_names

class OnBoradingList {
  final String title;
  final String desc;
  final String image;
  OnBoradingList(
      {required this.desc, required this.image, required this.title});
}

List<OnBoradingList> content = [
  OnBoradingList(
    title: "تطبيق مجاني",
    desc:
        "أطباء اسنان تىحت اشراف اخصائيين واستشتريين في جامعة الاجزهر في اليمن",
    image: "images/pro2.png",
  ),
  OnBoradingList(
    title: "احجز لك و لعائلتك",
    desc: "يمكنك حجز موعد لزيارت طبيب الاسنان بكل سهولة من خلال تطبيقنا",
    image: "images/pro2.png",
  ),
  OnBoradingList(
    title: "  ابحث عن أطباء ",
    desc: " يمكنك من خلال تطبيقنا العثور على الافضل الاطباء المفضلين",
    image: "images/pro2.png",
  ),
];

class infoDoctors {
  final String name;
  final String image;
  final String location;
  final String cat;
  final String exper;
  final String sick;
  final String eval;
  infoDoctors({
    required this.name,
    required this.location,
    required this.cat,
    required this.exper,
    required this.sick,
    required this.eval,
    required this.image,
  });
}

List<infoDoctors> info_doctors = [
  infoDoctors(
      location: "اليمن , حضرموت , سيئون",
      name: "أحمد عبدالله",
      cat: "قسم زراعة الاسنان",
      exper: "10",
      sick: "7500",
      eval: "4.0",
      image: "images/doctor1.jpg"),
  infoDoctors(
      location: "اليمن , حضرموت , القطن",
      name: "صالح عبدالرحمن ",
      cat: "قسم زراعة الاسنان",
      exper: "6",
      sick: "230",
      eval: "3.2",
      image: "images/doctor2.jpg"),
  infoDoctors(
      location: "اليمن , حضرموت , مدوده",
      name: "سليمان نايف ",
      cat: "قسم زراعة الاسنان",
      exper: "3",
      sick: "954",
      eval: "2.9",
      image: "images/doctor3.jpg"),
  infoDoctors(
      location: "اليمن , حضرموت , القطن",
      name: "عبدالله أحمد ",
      cat: "قسم التركيبات",
      exper: "2",
      sick: "100",
      eval: "2.0",
      image: "images/doctor4.jpg"),
  infoDoctors(
      location: "اليمن , حضرموت , سيئون",
      name: "عبدالرحمن صالح",
      cat: "قسم التركيبات",
      exper: "3",
      sick: "4233",
      eval: "4.2",
      image: "images/doctor5.jpg"),
  infoDoctors(
      location: "اليمن , حضرموت , مدوده",
      name: "عمر سليمان",
      cat: "قسم التركيبات",
      exper: "8",
      sick: "205",
      eval: "2.1",
      image: "images/doctor1.jpg"),
  infoDoctors(
      location: "اليمن , حضرموت , مدوده",
      name: "نايف سليمان",
      cat: "قسم جراحة الفم و اللثة",
      exper: "5",
      sick: "3015",
      eval: "4.9",
      image: "images/doctor2.jpg"),
  infoDoctors(
      location: "اليمن , حضرموت , القطن",
      name: "محمد أحمد ",
      cat: "قسم جراحة الفم و اللثة",
      exper: "1",
      sick: "300",
      eval: "2.5",
      image: "images/doctor3.jpg"),
  infoDoctors(
      location: "اليمن , حضرموت , سيئون",
      name: "خالد صالح",
      cat: "قسم جراحة الفم و اللثة",
      exper: "1",
      sick: "4233",
      eval: "4.0",
      image: "images/doctor4.jpg"),
];
