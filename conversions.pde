import java.text.DecimalFormat;

class Conversions

{
 
  String convertLength(double l, int unitSetting) 
  {  
    int mainUnit;
    double remainder;
    int divider = 1;
    String result;    
     
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
     
    if (l>Integer.MAX_VALUE || l<0) //input: Overflow error
    // note: i dont think oiverflow will happen but i had it here
    // before i reworked the methods so why not
    {
      result = "What a MASSIVE number, you know what else is massive? LOW TAPER FADEEE! (Overflow error)";
    }
    else if (l<(GRONK_JUMP_IN_CM/divider)) //input: 0 to Gronk
    {
      mainUnit = 0; 
      remainder = l;
      String formattedRemainder = String.format("%.2f", remainder); // format to decimal
      result = Integer.toString(mainUnit) + " Baby Gronk vertical(s) and "
      + formattedRemainder + " cm";
    }
    //input: 0 to 0.5*Cybertruck
    else if (l<0.5*(CYB_TRU_LENGTH_IN_CM/divider))
    {
      mainUnit = (int)(l/(GRONK_JUMP_IN_CM/divider));
      remainder = ((l%(GRONK_JUMP_IN_CM/divider)));
      String formattedRemainder = String.format("%.2f", remainder);
      result = Integer.toString(mainUnit) + " Baby Gronk vertical(s) and "
      + formattedRemainder + " cm";
    }
    
    //input: 0.5*Cybertruck to 0.5*Ohio
    else if (l>0.5*(CYB_TRU_LENGTH_IN_CM/divider)
    && l<0.5*(OHIO_WIDTH_IN_CM/divider))
    {
      mainUnit = (int)(l/(CYB_TRU_LENGTH_IN_CM/divider));
      remainder = ((l%(CYB_TRU_LENGTH_IN_CM/divider))/(GRONK_JUMP_IN_CM/divider));
      String formattedRemainder = String.format("%.2f", remainder);
      result = Integer.toString(mainUnit) + " Cyber truck(s) and "
      + formattedRemainder + " Baby Gronk vertical(s)";
    }
    
     //input: 0.5*Ohio+
    else
    {
      mainUnit = (int)(l/(OHIO_WIDTH_IN_CM/divider));                  
      remainder = ((l%OHIO_WIDTH_IN_CM)/(CYB_TRU_LENGTH_IN_CM/divider));
      String formattedRemainder = String.format("%.2f", remainder);
      
      result = Integer.toString(mainUnit) + " Ohio width(s) and "
      + formattedRemainder + " Cyber truck(s)";
    }
    
    return result;
  }
  
  String convertWeight(double w, int unitSetting)
  {
    int mainUnit;
    int divider = 1;
    double remainder;
    String result;
    if (unitSetting == 1) //unit selection
    {
      divider = KG;
    }
    else
    {
      divider = 1;
    }
    
    if (w>Integer.MAX_VALUE || w<0) //input: Overflow error
    {
      result = "What a MASSIVE number, you know what else is massive? LOW TAPER FADEEE! (Overflow error)";
    }
    else if (w<0.5*(PRIME_MASS_IN_G/divider))
    {
      mainUnit = 0;
      remainder = w*divider;
       String formattedRemainder = String.format("%.2f", remainder);
       result = Integer.toString(mainUnit) + " Prime bottle(s) and " 
       + formattedRemainder + " g";
    }
    else if (w<0.5*(MR_BEAST_MASS_IN_G/divider))
    {
      mainUnit = (int)(w/(PRIME_MASS_IN_G/divider));
      remainder = ((w%(PRIME_MASS_IN_G/divider)));
      if (unitSetting == 1)
      {
        remainder *= divider;
      }
      String formattedRemainder = String.format("%.2f", remainder);
        result = Integer.toString(mainUnit) + " Prime bottle(s) and " 
        + formattedRemainder + " g";
    }
    else if (w>0.5*(MR_BEAST_MASS_IN_G/divider)
    && w<0.5*(SHREK_MASS_IN_G/divider))
    {
      mainUnit = (int)(w/(MR_BEAST_MASS_IN_G/divider));
      remainder = ((w%(MR_BEAST_MASS_IN_G/divider))/((PRIME_MASS_IN_G/divider)));
      String formattedRemainder = String.format("%.2f", remainder);
        result = Integer.toString(mainUnit) + " Mr beast(s) and " 
        + formattedRemainder + " Prime bottle(s)";
    }
    else
    {
      mainUnit = (int)(w/(SHREK_MASS_IN_G/divider));                                      
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
    String result;
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
    {
      result = "What a MASSIVE number, you know what else is massive? LOW TAPER FADEEE! (Overflow error)";
    }
    
    // assume input is in seconds
    else if (t<0.5*(KSI_SONG_IN_SECONDS/divider))
    {
      mainUnit = 0;
      remainder = t;
      if (unitSetting == 1) // minutes to seconds
      {
        remainder *= divider;
      }
      String formattedRemainder = String.format("%.2f", remainder);
      result = mainUnit + " Thick of it(s) and " + formattedRemainder + " sec";
    }
    
    else if (t < 0.5 * (ARCANE_RUNTIME_IN_SECONDS/divider))
    {
        mainUnit = (int) (t/(KSI_SONG_IN_SECONDS/divider));
        remainder = (t%(KSI_SONG_IN_SECONDS/divider));
        if (unitSetting == 1) //minutes to seconds
      {
        remainder *= divider;
      }
        String formattedRemainder = String.format("%.2f", remainder);
        result = mainUnit + " Thick of it(s) and " + formattedRemainder + " sec";
    }
    
    else if (t>0.5*(ARCANE_RUNTIME_IN_SECONDS/divider)
    && t<0.5*(PG_AGE_IN_SECONDS/divider))
    {
      mainUnit = (int) (t / (ARCANE_RUNTIME_IN_SECONDS / divider));
      remainder = (t %(ARCANE_RUNTIME_IN_SECONDS / divider)/(KSI_SONG_IN_SECONDS/divider));
      String formattedRemainder = String.format("%.2f", remainder);
      result = mainUnit + " Arcane runtime(s) and " + formattedRemainder + " Thick of it(s)";
    }
    else
    {
      mainUnit = (int) (t/(PG_AGE_IN_SECONDS/divider));
      remainder = ((t % (PG_AGE_IN_SECONDS/divider)));
      String formattedRemainder = String.format("%.2f", remainder);
      result = mainUnit + " Peter Griffin lifespan(s) and " + formattedRemainder + " years";
    }

    return result;
    
  }

}
