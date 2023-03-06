// See https://aka.ms/new-console-template for more information
using Microsoft.Data.SqlClient;

string connectionString =
    @"Data Source=DESKTOP-3BNJJUV\MSSQLSERVER01;" + //Server Name
    "Initial Catalog=Company;" + //Database
    @"User id=DESKTOP-3BNJJUV\Hlynur;" + //Username
    "Password="; //Password

/*
 
 */

var connection = new SqlConnection(connectionString);
connection.Open();

//Do Stuff

connection.Close();
