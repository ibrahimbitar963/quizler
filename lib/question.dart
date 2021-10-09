class Question{
late String questionText;
late bool questionAnswer;

Question({String? questionText,bool? questionAnswer }){
  this.questionAnswer= questionAnswer!;
  this.questionText=questionText!;
}

}