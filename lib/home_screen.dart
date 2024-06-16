import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  String userInput ="";
  String answer = "";
  void Calculation(text){
    if(text == "C"){
      userInput = "";
      answer="";
    }else if(text == "<" ) {
      userInput=userInput.substring(0,(userInput.length)-1);
    }else if(text == "=" && text !="") {
      String finaluserinput = userInput.replaceAll('x', '*');
      Parser p = Parser();
      Expression exp = p.parse(finaluserinput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL,cm);
      answer = eval.toStringAsFixed(4);
      if(answer.endsWith('.0000')){
        answer=answer.substring(0,(answer.length)-5);
      }
    }else{
      if(answer!=""){
        userInput =answer;
        answer="";
      }
      userInput = userInput + text;
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:
        Text("Calculator",style:
        TextStyle(fontSize: 35,color: Colors.white,
            fontWeight: FontWeight.bold),)),
        backgroundColor:Colors.red ,
      ),
      body: Container(
        color: Color(0xFFECEBEBFF).withOpacity(0.3),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(userInput,style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold),),
                      Text(answer!=null?answer :"0",style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(child: Row(
                children: [
                  button(text: "C",tColor:Colors.redAccent),
                  SizedBox(width: 10,),
                  button(text: "<",tColor:Colors.redAccent),
                  SizedBox(width: 10,),
                  button(text: "%",tColor:Colors.redAccent),
                  SizedBox(width: 10,),
                  button(text: "/",tColor:Colors.redAccent),
                ],
              ),),
              SizedBox(height: 20,),
              Expanded(
                child: Row(
                  children: [
                    button(text: "7"),
                    SizedBox(width: 10,),
                    button(text: "8"),
                    SizedBox(width: 10,),
                    button(text: "9"),
                    SizedBox(width: 10,),
                    button(text: "x",tColor:Colors.redAccent),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: Row(
                  children: [
                    button(text: "4"),
                    SizedBox(width: 10,),
                    button(text: "5"),
                    SizedBox(width: 10,),
                    button(text: "6"),
                    SizedBox(width: 10,),
                    button(text: "-",tColor:Colors.redAccent),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Expanded(child: Row(
                children: [
                  button(text: "1"),
                  SizedBox(width: 10,),
                  button(text: "2"),
                  SizedBox(width: 10,),
                  button(text: "3"),
                  SizedBox(width: 10,),
                  button(text: "+",tColor:Colors.redAccent),
                ],
              ),),
              SizedBox(height: 20,),
              Expanded(child: Row(
                children: [
                  button(text: "#"),
                  SizedBox(width: 10,),
                  button(text: "0"),
                  SizedBox(width: 10,),
                  button(text: "."),
                  SizedBox(width: 10,),
                  button(text: "=",tColor:Colors.white,bgColor:Colors.redAccent)
                ],
              ),)
            ],
          ),
        ),
      ),
    );
  }
  Widget button({text,tColor=Colors.black,bgColor=Colors.white}){
    return Expanded(child: ElevatedButton(
      onPressed: (){
        Calculation(text);
      },
      child: Center(child: Text(text,style:TextStyle(color: tColor,fontSize: 25,fontWeight: FontWeight.bold),)),
      style:ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shadowColor: Colors.red,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          )
      ),
    ));
  }
}