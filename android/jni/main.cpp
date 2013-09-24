// Copyright (C) 2005 Dave Griffiths
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <sys/time.h>
#include <iostream>
#include <string>
#include <png.h>

#include "scheme/scheme.h"
#include "sqlite/sqlite3.h"
#include "core/db.h"
#include "app.h"

using namespace std;

scheme *sc=NULL;
FILE *log_file=NULL;

void appInit()
{
    sc=scheme_init_new();
    FILE *log_file=fopen("starwisp-log.txt","w");
    if (log_file!=NULL) scheme_set_output_port_file(sc, log_file);
}

void appEval(char *code)
{
   scheme_load_string(sc,code);
   fflush(log_file);
   if (starwisp_data!=NULL) cerr<<starwisp_data<<endl;
}


string LoadFile(string filename)
{
    FILE *file=fopen(filename.c_str(),"r");
	if (file)
	{
		fseek(file,0,SEEK_END);
		long size=ftell(file);
		fseek(file,0,SEEK_SET);

		char *buffer = new char[size+1];
        long s = (long)fread(buffer,1,size,file);
        buffer[s]='\0';
        string r = buffer;
		delete[] buffer;
		fclose(file);
        return r;
    }
    cerr<<"couldn't open "<<filename<<endl;
    return "";
}

int main(int argc, char *argv[])
{

    appInit();

    appEval((char*)LoadFile("../assets/init.scm").c_str());
    appEval("(display \"loaded init\")(newline)");
    appEval((char*)LoadFile("../assets/lib.scm").c_str());
    appEval("(display \"loaded lib\")(newline)");
    appEval((char*)LoadFile("../assets/starwisp.scm").c_str());
    appEval("(display \"loaded starwisp\")(newline)");

/*
    db my_db("test.db");

    my_db.exec("CREATE TABLE COMPANY("  \
               "ID INT PRIMARY KEY     NOT NULL,"   \
               "NAME           TEXT    NOT NULL,"   \
               "AGE            INT     NOT NULL,"   \
               "ADDRESS        CHAR(50),"           \
               "SALARY         REAL );");

    my_db.exec("INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY) "    \
               "VALUES (1, 'Paul', 32, 'California', 20000.00 ); " \
               "INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY) " \
               "VALUES (2, 'Allen', 25, 'Texas', 15000.00 ); "     \
               "INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY)"  \
               "VALUES (3, 'Teddy', 23, 'Norway', 20000.00 );"      \
               "INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY)"   \
               "VALUES (4, 'Mark', 25, 'Rich-Mond ', 65000.00 );");

    list *data = my_db.exec("SELECT * FROM COMPANY");
//    my_db.print_data(data);

    delete data;
*/


	return 0;
}
