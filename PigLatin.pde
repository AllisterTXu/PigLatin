public void setup() 
{
	String[] lines = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
	  System.out.print(pigLatin(lines[i]));
    System.out.println(" " + findFirstVowel(lines[i]));
	}
  //if(hasVowels("beast")){
  //  System.out.println("beast has vowels");
  //}
}
public void draw()
{
        //not used
}

public boolean isVowel(String sChar){
 if(sChar.equals("a") || sChar.equals("e") || sChar.equals("i") || sChar.equals("o") || sChar.equals("u")){
    return true;
  }
  else {
    return false;
  }
}

public boolean hasVowels(String sWord){
  for(int i = 0; i < sWord.length(); i++){
    if(isVowel(sWord.substring(i,i+1))){
      return true;
    }
  }
  return false;
}

public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
  if(hasVowels(sWord)){
    if(isVowel(sWord.substring(0,1))){
      return 0;
    }
  	else if(sWord.substring(0,2).equals("qu") || sWord.substring(0,2).equals("st")){
      return 1;
    }
    else if(sWord.substring(0,3).equals("thr")){
      return 2;
    }
    else {
      return -1;
    }
  }
  return 3;
}


//consonant = -1
//vowel = 0
//double letter combination = 1
//triple letter combonation = 2
//no vowels = 3

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	if(findFirstVowel(sWord) == -1)
	{
		return sWord.substring(1) + sWord.substring(0,1) + "ay";
	}
  else if(findFirstVowel(sWord) == 0){
    return sWord + "way";
  }
  else if(findFirstVowel(sWord) == 1){
    return sWord.substring(2) + sWord.substring(0,2) + "ay";
  }
  else if(findFirstVowel(sWord) == 2){
    return sWord.substring(3) + sWord.substring(0,3) + "ay";
  }
  else if(findFirstVowel(sWord) == 3){
    return sWord + "ay";
  }
	else
	{
		return "ERROR!";
	}
}
