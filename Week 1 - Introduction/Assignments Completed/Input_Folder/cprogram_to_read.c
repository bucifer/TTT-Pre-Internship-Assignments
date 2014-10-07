//
//  main.c
//  #12 Read_File_Store_Contents
//
//  Created by Aditya Narayan on 9/4/14.
//  Copyright (c) 2014 NM. All rights reserved.
//
/* 8th comment line
/* 9th comment line 

#include <stdio.h>

void read_into_string(char result_string[], char file_path[]);

int main(int argc, const char * argv[])
{
    char this_is_the_result_string[100];
    read_into_string(this_is_the_result_string, "/Users/adityanarayan/Desktop/TerryBu/test.txt");
    
    return 0;
}

void read_into_string(char result_string[], char file_path[]) {
    char c;
    int i = 0;
    FILE *file;
    file = fopen(file_path, "r");
    if (file) {
        while ((c=fgetc(file))!= EOF) {
            result_string[i] = c;
            i++;
        }
        fclose(file);
    }
    else {
        printf("can't find file\n");
    }
    
    printf("%s\n", result_string);

}