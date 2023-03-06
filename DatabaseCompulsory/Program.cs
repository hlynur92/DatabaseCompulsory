// See https://aka.ms/new-console-template for more information
using Microsoft.Data.SqlClient;

string connectionString =
    @"Data Source=DESKTOP-3BNJJUV\MSSQLSERVER01;Initial Catalog=Company;User id=DESKTOP-3BNJJUV\Hlynur;Password=;Trust Server Certificate=true"; 

/*
 
 */

var connection = new SqlConnection(connectionString);
connection.Open();

//Do Stuff

connection.Close();
