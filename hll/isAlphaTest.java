/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.util.Scanner;
import java.util.*;

/**
 *
 * @author jmars
 */
public class isAlphaTest 
{
    public static void main(String[] args)
    {
        String lowercase = "abcdefghijklmnopqrstuvwxyz";
        String uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String wrong = "!@#$%^&*())_+{}:<>?:;,.";
        String wrong2 = "abcdefghijklmnopqrstuvwxyz*";
        String wrong3 = "*abcdefghijklmnopqrstuvwxyz";
        
        char[] input = uppercase.toCharArray();
        
        Boolean check = true;
        for (int k = 0; k < input.length; k++)
        {
            char curr = input[k];
            if ((curr < 'a' || curr > 'z') && (curr < 'A' || curr > 'Z'))
            {
                check = false;
                break;
            }
        }
        
        if (check)
            System.out.println("The string has alphabetical characters only");
        else
            System.out.println("The string does not have only alphabetical characters");
    }
}
