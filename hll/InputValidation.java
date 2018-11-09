/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bulls.and.cows;

import java.util.Scanner;
import java.util.*;

/**
 *
 * @author jmars
 */
public class InputValidation 
{
    public static void main(String[] args) 
    {
        String arr[] = {"able", "atom", "arms", "aunt", "bank", "blue", "bowl", "burn", "cake", "cars", "code", "corn", "dash", "desk", "dogs", "duck", "echo", "ends", "evil", "exit",  
            "face", "file", "fort", "fund",  "game", "girl", "goat", "guys", "hack", "hero", "holy", "huge", "icon", "inch", "into", "item", "jade", "jets", "jobs", "jump", 
            "keys", "kind", "king", "knob", "lamb", "lend", "liar", "lost", "maid", "milk", "more", "must", "near", "node", "next", "numb", " obey", "once", "oval", "oxen", "page", 
            "pets", "play", "pork", "quit", "quiz", "quad", "raft", "ride", "risk", "rows", "same", "skip", "soap", "stir", "tail", "tiny", "toad", "true", "ugly", "unit", "unto", "user", "vase", "vent", 
            "vine", "vote", "wage", "weak", "wild", "wrap", "yard", "year", "yeah", "yoga", "zero", "zest", "zone", "zits"}; 
        
        Scanner scan = new Scanner(System.in);
        String str = "";
        Boolean  found = false;
        while(!found)
        {
            str = scan.next();
            for (int k = 0; k < arr.length; k++)
            {
                if (str.equalsIgnoreCase(arr[k]))
                {
                    System.out.println("This is a valid string");
                    found = true;
                }
            }
            if (!found)
            {
                System.out.println("This string is not valid"); // Need to add specifc error messages
                errorMessages(str);
            }
        }
        
    }
    
    public static void errorMessages(String str)
    {
        str.toLowerCase();
        char arr[] = str.toCharArray();
        
        int count = 0; // Count how many errors it prints out, if zero then word is not in dictionary
        
        if(!(str.length() == 4))
        {
            System.out.println("The string must be four letters long");
            count++;
        }
        Boolean valid = true;
        for (int k = 0; k < arr.length; k++)
        {
            if(!(arr[k] >= 'a' && arr[k] <= 'z') || (arr[k] >= 'A' && arr[k] <= 'Z')) //Checks if character is within valid range
            {
                //System.out.println(arr[k]);
                valid = false;
            }
        }
        if(!valid)
        {
            System.out.println("The string must contain alphabetical letters");
            count++;
        }
        // Checks for duplicate letters
        valid = true;
        Arrays.sort(arr);
        for (int k = 0; k < str.length() - 1; k++)
        {
            if (arr[k] == arr[k+1])
                valid = false;
        }
        if(!valid)
        {
            System.out.println("The string cannot contain repeating letters.");
            count++;
        }
        if (count == 0)
            System.out.println("This string is not in our dictionary, must be a valid english word");
    }
}




