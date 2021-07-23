class CalcMonth{
  String convertMonth(int num) {
    String date = "";
    switch (num) {
      case 1:
        date = "Jan";
        break;
      case 2:
        date = "Feb";
        break;
      case 3:
        date = "March";
        break;
      case 4:
        date = "April";
        break;
      case 5:
        date = "May";
        break;
      case 6:
        date = "June";
        break;
      case 7:
        date = "July";
        break;
      case 8:
        date = "Aug";
        break;
      case 9:
        date = "Sept";
        break;
      case 10:
        date = "Oct";
        break;
      case 11:
        date = "Nov";
        break;
      case 12:
        date = "Dec";
        break;
    }
    return date;
  }

}