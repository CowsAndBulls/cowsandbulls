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
public class checkDuplicates 
{
    public static void main(String args[])
    {
        String right = "AbCdefghijklmnopqrstuvwxyz";
        String wrong = "aaaaaabbbbbccccc";
        String wrong2 = "abcedfa";
        String wrong3 = "absjdkfowisfjbfdasdjf";
        String wrong4 = "abcdeff";
        
        char[] input = wrong4.toCharArray();
        
        Boolean check  = true;
        
        outerLoop:
        for (int k = 0; k < input.length; k++)
        {
            char curr = input[k];
            for (int j = k + 1; j < input.length; j++)
            {
                if (input[j] == curr)
                {
                    check = false;
                    break outerLoop;
                }
            }
        }
        
        if (check)
        {
            System.out.println("This string contains no duplicates");
        }
        else
        {
            System.out.println("This string contains duplicates");
        }
        
    }
}
