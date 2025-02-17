import java.text.DecimalFormat;
class Conversions

{
 String temp;
 String result = "";
 
  String convertLength(double userInput, int unitSetting) 
  {  
    int mainUnit;
    double remainder;
    int divider = 1;   
    
    
    switch (unitSetting) // unit selection
    {
      case 0:
      divider = 1;
      break;
      case 1: 
      divider = METRES;
      break;
      case 2:
      divider = KILOMETRES;
      break;
    }
     
    if (userInput>Integer.MAX_VALUE || userInput<0) 
      result = "What a MASSIVE number, you know what else is massive? LOW TAPER FADEEE! (Overflow error)";
    
    else if (userInput<(CYB_TRU_LENGTH_IN_CM/divider)) //input: 0 to Cybertruck (always gronks)
    {
      temp = String.format("%.2f", userInput / GRONK_JUMP_IN_CM*divider); 
      result = temp + " Baby Gronk vertical" + (temp.equals("1") ? "" : "s");
    }
        
    else if (userInput<(OHIO_WIDTH_IN_CM/divider)) //input: Cybertruck to Ohio
    {
      mainUnit = (int)(userInput/(CYB_TRU_LENGTH_IN_CM/divider));
      remainder = ((userInput%(CYB_TRU_LENGTH_IN_CM/divider))/(GRONK_JUMP_IN_CM/divider));
      String formattedRemainder = String.format("%.2f", remainder);
      temp = Integer.toString(mainUnit);
      result = temp + " Cybertruck" + (temp.equals("1") ? " " : "s ") + "and " + formattedRemainder + " Baby Gronk verticals";
      //result = ((temp.equals("0") ? "" : temp + " Cybertruck" +  (temp.equals("1") ? " " : "s ") + "and ")) + formattedRemainder + " Baby Gronk vertical" + (formattedRemainder.equals("1") ? "." : "s." ); // baby gronk(s)
    }
    
     //input: Ohio+
    else
    {
      //Ohios calculated
      mainUnit = (int)(userInput/(OHIO_WIDTH_IN_CM/divider));
      temp = Integer.toString(mainUnit);
      result = temp + " Ohio width" + (temp.equals("1") ? "" : "s");
    
      //On to cybertrucks:
      remainder = ((userInput%(OHIO_WIDTH_IN_CM/divider)) / (CYB_TRU_LENGTH_IN_CM / divider));
      mainUnit = (int)(remainder);
      
      
      if (mainUnit > 0)  //if there are any cybertrucks:
      {
        temp = Integer.toString(mainUnit);
        result += ", " + temp + " Cybertruck" + (temp.equals("1") ? "" : "s");
        println(remainder%(CYB_TRU_LENGTH_IN_CM/divider));
        remainder = (remainder%(CYB_TRU_LENGTH_IN_CM/divider)) / (GRONK_JUMP_IN_CM/divider);
        println(remainder + " gronks");
      }
     
      else  //if there are no cybertrucks, skip to gronks
      {
      remainder = ((userInput%(OHIO_WIDTH_IN_CM/divider)) / (GRONK_JUMP_IN_CM / divider)); 
      String formattedRemainder = String.format("%.2f", remainder);
      result += " and " + formattedRemainder + " Baby Gronk verticals";
      }
    } 
    return result;
  }
  
  String convertWeight(double w, int unitSetting)
  {
    int mainUnit;
    int divider = 1;
    double remainder;
    if (unitSetting == 1) //unit selection   
      divider = KG;    
    else    
      divider = 1;       
    if (w>Integer.MAX_VALUE || w<0) //input: Overflow error    
      result = "What a MASSIVE number, you know what else is massive? LOW TAPER FADEEE! (Overflow error)";  
      
    //0 to Mr. Beast (Primes)
    else if (w<(MR_BEAST_MASS_IN_G/divider))
    {
       String formattedRemainder = String.format("%.2f", w / (PRIME_MASS_IN_G/divider)); //TODO: Check for 1's and omit the plural s if 1
       result = formattedRemainder + " Prime bottles";
    }
    
    //Mr. Beast to Shrek (Mr Beasts and Primes)
    else if (w<(SHREK_MASS_IN_G/divider))
    {
      mainUnit = (int)(w/(MR_BEAST_MASS_IN_G/divider));
      remainder = ((w%(MR_BEAST_MASS_IN_G/divider))/((PRIME_MASS_IN_G/divider)));
      String formattedRemainder = String.format("%.2f", remainder);
      result = mainUnit + " Mr beast(s)";
      if (remainder > 0)
        result += " and "  + formattedRemainder + " Prime bottle(s)";
    }
    //Shrek + (Shreks, Mr. Beasts and Primes)
    else
    {
      //
      mainUnit = (int)(w/(SHREK_MASS_IN_G/divider));  
      result = mainUnit + " Shrek(s)";
      remainder = ((w%((SHREK_MASS_IN_G/divider))/ (MR_BEAST_MASS_IN_G/divider)));
      String formattedRemainder = String.format("%.2f", remainder);
      result = Integer.toString(mainUnit) + " Shrek(s) and "
      + formattedRemainder + " Mr beast(s)";
    }
    
    
    return result;
  }
  
  String convertTime(double t, int unitSetting)
  {
    int mainUnit;
    int divider = 1;
    double remainder;
    switch (unitSetting) // unit selection
    {
      case 0:
      divider = 1;
      break;
      
      case 1: 
      divider = MINUTES;
      break;
      
      case 2:
      divider = DAYS;
      break;
      
      case 3:
      divider = MONTHS;
      break;
      
      case 4:
      divider = YEARS;
      break;
      
    }
    if (t>Integer.MAX_VALUE || t<0) //input: Overflow error    
      result = "What a MASSIVE number, you know what else is massive? LOW TAPER FADEEE! (Overflow error)";    
    
    // 0 to Arcane
    else if (t<(ARCANE_RUNTIME_IN_SECONDS/divider))
    {
      temp = String.format("%.2f", (t*divider)/KSI_SONG_IN_SECONDS); //TODO: Check for 1s and drop the s in that scenario
      result = temp + " Thick of its";
    }
    
    // Arcane to Peter Griffin
    else if (t<(PG_AGE_IN_SECONDS/divider))
    {
      mainUnit = (int) ((t*divider) / (ARCANE_RUNTIME_IN_SECONDS));
      result = mainUnit + " Arcane runtime(s)";
      remainder = ((t*divider) % ARCANE_RUNTIME_IN_SECONDS) / KSI_SONG_IN_SECONDS; 
      String formattedRemainder = String.format("%.2f", remainder);
      result += " and " + formattedRemainder + " Thick of it(s)";
    }
    
    // Peter Griffin+
    else
    {
      // Peter Griffins
      mainUnit = (int) t/(PG_AGE_IN_SECONDS/divider);
      result = mainUnit + " Peter Griffin lifespan(s)";
      
      // Arcanes
      t = t % (PG_AGE_IN_SECONDS/divider);
      mainUnit = (int) (t*divider)/ARCANE_RUNTIME_IN_SECONDS; 
      
      // Thick of its
      remainder = ((t*divider) % ARCANE_RUNTIME_IN_SECONDS) / KSI_SONG_IN_SECONDS;
      String formattedRemainder = String.format("%.2f", remainder);
      
      // checks for any arcanes, skips if 0 (e.g 1 Peter and 1 thick of it)
      if (mainUnit > 0) 
        result += ", " + mainUnit + " Arcane runtime(s) and " + formattedRemainder + " Thick of it(s)";
      // checks for any thick of its (e.g 1 whole Peter lifespan, 0 thick of its)
      else if (remainder > 0)       
        result += " and " + formattedRemainder + " Thick of it(s)";      
    }
    return result;
  }
  
  public String getResult()
  {
    return result;
  }
  
  public void setResult()
  {
    result = ""; 
  }

}
