//
//  main.c
//  #13 Count_Number_Lines_Program
//
//  Created by Aditya Narayan on 9/4/14.
//  Copyright (c) 2014 NM. All rights reserved.
//

#include <stdio.h>

void count_lines(char file_path[]);

int main(int argc, const char * argv[])
{
    
    count_lines("/Users/adityanarayan/Desktop/TerryBu/Assignments Completed/Input_Folder/cprogram_to_read.c");
    return 0;
}

void count_lines(char file_path[]) {
    int c, nl;
    nl = 0;
    FILE *file;
    file = fopen(file_path, "r");
    if (file) {
        while ((c = getc(file))!= EOF) {
            if (c == '\n')
                ++nl;
        }
        fclose(file);
    }
    else {
        printf("can't find file\n");
    }
    printf("%d\n", nl);
    
}

