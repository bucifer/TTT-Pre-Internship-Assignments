//
//  main.c
//  #14 Count_Lines_Comments
//
//  Created by Aditya Narayan on 9/4/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#include <stdio.h>

void count_lines_comments(char file_path[]);

int main(int argc, const char * argv[])
{
    count_lines_comments("/Users/adityanarayan/Desktop/TerryBu/Assignments Completed/Input_Folder/cprogram_to_read.c");
    return 0;
}

void count_lines_comments(char file_path[]) {
    int a, b, numb_comments;
    numb_comments = 0;
    FILE *file;
    file = fopen(file_path, "r");
    if (file) {
        while ((a = getc(file))!= EOF) {
            if (b == '/' && a == '/')
                numb_comments++;
            b = a;

        }
        fclose(file);
    }
    else {
        printf("can't find file\n");
    }
    printf("number of comment lines: %d\n", numb_comments);
    
}

