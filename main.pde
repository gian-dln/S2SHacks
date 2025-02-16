import java.util.ArrayList;
Conversions conv = new Conversions();
ArrayList<Integer> inputArray;

int measureSetting;
int unitSetting;

void setup()
{
  inputArray = new ArrayList<Integer>();
  
  size(600, 500);
  noStroke();
  //default settings
  measureSetting = 0;
  unitSetting = 0;
}

void draw()
{
  //System.out.println(inputArray);
  fill(0);
  
  //Setting up calculator
  background(255);
  stroke(0);
  fill(100);
  rect(200, 0, 400, 500);
  fill(150);
  rect(210, 10, 380, 100);
  rect(250, 115, 300, 20);
  
  //Number buttons
  fill(75);
  rect(240, 150, BUTTONSIZE, BUTTONSIZE);
  rect(350, 150, BUTTONSIZE, BUTTONSIZE);
  rect(460, 150, BUTTONSIZE, BUTTONSIZE);
  rect(240, 260, BUTTONSIZE, BUTTONSIZE);
  rect(350, 260, BUTTONSIZE, BUTTONSIZE);
  rect(460, 260, BUTTONSIZE, BUTTONSIZE);
  rect(240, 370, BUTTONSIZE, BUTTONSIZE);
  rect(350, 370, BUTTONSIZE, BUTTONSIZE);
  rect(460, 370, BUTTONSIZE, 45);
  rect(460, 425, BUTTONSIZE, 45);
  
  fill(225);
  textSize(75);
  text("1", 270, 225); 
  text("2", 380, 225); 
  text("3", 490, 225); 
  text("4", 270, 335); 
  text("5", 380, 335); 
  text("6", 490, 335); 
  text("7", 270, 445); 
  text("8", 380, 445); 
  textSize(35);
  text("9", 500, 405); 
  text("0", 500, 460); 
  
  
  //Enter and Clear
  fill(84, 145, 84);
  rect(0, 350, 200, 75);
  fill(168, 56, 44);
  rect(0, 425, 200, 75);
  
  fill(255);
  textSize(50);
  text("Enter", 45, 405); 
  textSize(50);
  text("Clear", 45, 480); 
 
 
  //length button
  fill(90, 104, 163);
  rect(0, 0, 200, 75);
  //weight button
  fill(108, 123, 189);
  rect(0, 75, 200, 75);
  //time button
  fill(121, 137, 212);
  rect(0, 150, 200, 75);
  
  fill(255);
  textSize(45);
  text("Length", 35, 55);
  text("Weight", 35, 130);
  text("Time", 55, 205);
 
  
  //Input text
  textSize(100);
  fill(0);
  for (int index=0; index<inputArray.size(); index++)
  {
    text(inputArray.get(index), 580-(inputArray.size() * 50) + (index*50), 100);
  }  
  
  
  //Smaller display screen
  
  if(measureSetting == 0)    //for length
  {
    //buttons
    fill(68, 83, 148);
    rect(0, 225, 65, 70);
    rect(65, 225, 65, 70);
    rect(130, 225, 70, 70);
    
    fill(255);
    textSize(11);
    text("Centimeters", 6, 265);
    textSize(17);
    text("Meters", 75, 265);
    textSize(12);
    text("Kilometers", 140, 265);
    
    fill(0);
    textSize(15);
    if(unitSetting == 0)     //for cm
    {
       text("Please enter your input in centimeters", 280, 130); 
    }
    else if(unitSetting == 1)
    {
       text("Please enter your input in meters", 300, 130); 
    }
    else if(unitSetting == 2)
    {
      text("Please enter your input in kilometers", 280, 130); 
    }
  }
  else if(measureSetting == 1)
  {
    fill(68, 83, 148);
    rect(0, 225, 100, 70);
    rect(100, 225, 100, 70);
    
    fill(255);
    textSize(20);
    text("Grams", 25, 265);
    textSize(18);
    text("Kilograms", 115, 265);
    
    fill(0);
    textSize(15);
    if(unitSetting ==  0)
    {
      text("Please enter your input in grams", 300, 130); 
    }
    else if(unitSetting == 1)
    {
      text("Please enter your input in kilograms", 285, 130); 
    }
  }
  else if(measureSetting == 2)
  {
    fill(68, 83, 148);
    rect(0, 225, 65, 60);
    rect(65, 225, 65, 60);
    rect(130, 225, 70, 60);
    rect(0, 285, 100, 65);
    rect(100, 285, 100, 65);
    
    fill(255);
    textSize(14);
    text("Seconds", 6, 260);
    text("Minutes", 75, 260);
    textSize(17);
    text("Days", 145, 260);
    textSize(20);
    text("Months", 20, 325);
    text("Years", 125, 325);
    
    fill(0);
    textSize(15);
    if(unitSetting == 0)
    {
      text("Please enter your input in seconds", 290, 130); 
    }
    else if(unitSetting == 1)
    {
      text("Please enter your input in minutes", 290, 130); 
    }
    else if(unitSetting == 2)
    {
      text("Please enter your input in days", 300, 130); 
    }
    else if(unitSetting == 3)
    {
      text("Please enter your input in months", 300, 130); 
    }
    else if(unitSetting == 4)
    {
      text("Please enter your input in years", 300, 130); 
    }
  }
  
  
}

void mousePressed()
{
  if(mouseX>=0 && mouseX <=200 && mouseY >= 425 && mouseY <= 500)
  {
    inputArray.clear();
  }
  else if(mouseX>=0 && mouseX <=200 && mouseY >= 350 && mouseY <= 500)
  {
    println("Enter");
    println(measureSetting);
    println(unitSetting);
    
    int inputResult = 0;
    for (int digit : inputArray)
    {
      inputResult = inputResult*10 + digit;
    }
    
    if(measureSetting == 0) //length calculation
    {
        println(conv.convertLength(inputResult,unitSetting));
    }
    
    else if(measureSetting == 1) //weight calculation
    {
        println(conv.convertWeight(inputResult,unitSetting));
    }
    
    else
    {
      println(conv.convertTime(inputResult,unitSetting));
    }
  }
  
  else if(mouseX>=0 && mouseX <= 200 && mouseY >= 0 && mouseY< 75)
  {
    measureSetting = 0;
    inputArray.clear();
    System.out.println("Length");
    
  }
  else if(mouseX>=0 && mouseX <= 200 && mouseY >= 75 && mouseY< 150)
  {
    measureSetting = 1;
    inputArray.clear();
    System.out.println("Weight");
    
  }
  else if(mouseX>=0 && mouseX <= 200 && mouseY >= 150 && mouseY<= 225)
  {
    measureSetting = 2;
    inputArray.clear();
    System.out.println("Time");
    
  }
  
  if(measureSetting == 0)
  {
    if(mouseX >=0 && mouseX <65 && mouseY>=225 && mouseY <= 295)
    {
      unitSetting = 0;
      inputArray.clear();
      System.out.println("Centimeters");
    }
    else if(mouseX >=65 && mouseX <130 && mouseY>=225 && mouseY <= 295)
    {
      unitSetting = 1;
      inputArray.clear();
      System.out.println("Meters");
    }
    else if(mouseX >=130 && mouseX <=200 && mouseY>=225 && mouseY <= 295)
    {
      unitSetting = 2;
      inputArray.clear();
      System.out.println("Kilometers");
    } 
  }
  else if(measureSetting == 1)
  {
    if(mouseX >=0 && mouseX <100 && mouseY>=225 && mouseY <= 295)
    {
      unitSetting = 0;
      inputArray.clear();
      System.out.println("Grams");
    }
    else if(mouseX >=100 && mouseX <200 && mouseY>=225 && mouseY <= 295)
    {
      unitSetting = 1;
      inputArray.clear();
      System.out.println("Kilograms");
    }
  }
  else if(measureSetting == 2)
  {
    if(mouseX >=0 && mouseX <65 && mouseY>=225 && mouseY < 285)
    {
      unitSetting = 0;
      inputArray.clear();
      System.out.println("Seconds");
    }
    else if(mouseX >=65 && mouseX <130 && mouseY>=225 && mouseY < 285)
    {
      unitSetting = 1;
      inputArray.clear();
      System.out.println("Minutes");
    }
    else if(mouseX >=130 && mouseX <=200 && mouseY>=225 && mouseY < 285)
    {
      unitSetting = 2;
      inputArray.clear();
      System.out.println("Days");
    }
    else if(mouseX >=0 && mouseX <100 && mouseY>=285 && mouseY <= 350)
    {
      unitSetting = 3;
      inputArray.clear();
      System.out.println("Months");
    }
    else if(mouseX >=100 && mouseX <200 && mouseY>=285 && mouseY <= 350)
    {
      unitSetting = 4;
      inputArray.clear();
      System.out.println("Years");
    }
  }
  
  if(inputArray.size()<7) {
    if(mouseX>=240 && mouseX<=340 && mouseY>=150 && mouseY<=250)
    {
      inputArray.add(1);
    }
    else if(mouseX>=350 && mouseX <=450 && mouseY>=150 && mouseY <=250)
    {
      inputArray.add(2);
    }
    else if(mouseX>=460 && mouseX <=560 && mouseY>=150 && mouseY <=250)
    {
      inputArray.add(3);
    }
    else if(mouseX>=240 && mouseX<=340 && mouseY>=260 && mouseY<=360)
    {
      inputArray.add(4);
    }
    else if(mouseX>=350 && mouseX <=450 && mouseY>=260 && mouseY <=360)
    {
      inputArray.add(5);
    }
    else if(mouseX>=460 && mouseX <=560 && mouseY>=260 && mouseY <=360)
    {
      inputArray.add(6);
    }
    else if(mouseX>=240 && mouseX<=340 && mouseY>=370 && mouseY<=470)
    {
      inputArray.add(7);
    }
    else if(mouseX>=350 && mouseX<=450 && mouseY>=370 && mouseY<=470)
    {
      inputArray.add(8);
    }
    else if(mouseX>=460 && mouseX<=560 && mouseY>=370 && mouseY<=415)
    {
      inputArray.add(9);
    }
    else if(mouseX>=460 && mouseX<=560 && mouseY>=425 && mouseY<=465)
    {
      inputArray.add(0);
    }
  }  
}
