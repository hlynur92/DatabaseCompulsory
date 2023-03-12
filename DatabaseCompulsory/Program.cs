// See https://aka.ms/new-console-template for more information
using Microsoft.Data.SqlClient;
using System.Data;

string connectionString =
    @"Data Source=DESKTOP-D35GBO7; initial catalog = Company; trusted_connection = true; Trust Server Certificate=true";

/*
 
 */

using (SqlConnection conn = new SqlConnection(connectionString))
{
    conn.Open();
    
    if(true) //CREATE DEPARTMENT
    {
        Console.WriteLine("############################## -- CREATE DEPARTMENT -- ###########################");
        SqlCommand SP_CreateDepartment = new SqlCommand("CreateDepartment", conn) { CommandType = CommandType.StoredProcedure };
        SP_CreateDepartment.Parameters.Add(new SqlParameter("@DName", "Science"));
        SP_CreateDepartment.Parameters.Add(new SqlParameter("@MgrSSN", "333445555"));
        SP_CreateDepartment.Parameters.Add(new SqlParameter("@DNumber", SqlDbType.Int) { Direction = ParameterDirection.Output });
        try
        {
            SP_CreateDepartment.ExecuteNonQuery();
            int New_DNumber = (int)SP_CreateDepartment.Parameters["@DNumber"].Value;
            Console.WriteLine("CreateDepartment returned the following DNumber: " + New_DNumber);
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);  
        }
        finally {
            Console.WriteLine("###################################################################################");
            Console.WriteLine("");
        }
    }

    if (true) //UPDATE DEPARTMENT NAME
    {
        Console.WriteLine("############################## -- UPDATE DEPARTMENT NAME -- ###########################");
        SqlCommand SP_UpdateDepartmentName = new SqlCommand("UpdateDepartmentName", conn) { CommandType = CommandType.StoredProcedure };
        SP_UpdateDepartmentName.Parameters.Add(new SqlParameter("@DNumber", "3"));
        SP_UpdateDepartmentName.Parameters.Add(new SqlParameter("@DName", "Accounting"));
        SP_UpdateDepartmentName.ExecuteNonQuery();
        Console.WriteLine("UpdateDepartmentName Done");
        Console.WriteLine("###################################################################################");
        Console.WriteLine("");
    }

    if (true) //UPDATE DEPARTMENT MANAGER
    {
        Console.WriteLine("############################## -- UPDATE DEPARTMENT MANAGER -- ###########################");
        SqlCommand SP_UpdateDepartmentManager = new SqlCommand("UpdateDepartmentManager", conn) { CommandType = CommandType.StoredProcedure };
        SP_UpdateDepartmentManager.Parameters.Add(new SqlParameter("@DNumber", "3"));
        SP_UpdateDepartmentManager.Parameters.Add(new SqlParameter("@MgrSSN", "453453453"));
        SP_UpdateDepartmentManager.ExecuteNonQuery();
        Console.WriteLine("UpdateDepartmentManager Done");
        Console.WriteLine("###################################################################################");
        Console.WriteLine("");
    }

    if (true) //DELETE DEPARTMENT
    {
        Console.WriteLine("############################## -- DELETE DEPARTMENT -- ###########################");
        SqlCommand SP_DeleteDepartment = new SqlCommand("DeleteDepartment", conn) { CommandType = CommandType.StoredProcedure };
        SP_DeleteDepartment.Parameters.Add(new SqlParameter("@DNumber", "3"));
        SP_DeleteDepartment.ExecuteNonQuery();
        Console.WriteLine("DeleteDepartment Done");
        Console.WriteLine("###################################################################################");
        Console.WriteLine("");
    }

    if (true) //GET ALL DEPARTMENTS
    {
        Console.WriteLine("############################## -- GET ALL DEPARTMENTS -- ###########################");
        SqlCommand SP_GetAllDepartments = new SqlCommand("GetAllDepartments", conn) { CommandType = CommandType.StoredProcedure };
        using (SqlDataReader rdr = SP_GetAllDepartments.ExecuteReader())
        {
            // iterate through results, printing each to console
            Console.WriteLine("DName \t\t DNumber \t MgrSSN \t\t MgrStartDate \t\t\t EmpCount");
            while (rdr.Read())
            {
                Console.WriteLine(rdr["DName"] + " \t " + rdr["DNumber"] + " \t\t " + rdr["MgrSSN"] + " \t\t " + rdr["MgrStartDate"] + " \t\t " + rdr["EmpCount"]);
            }
        }
        Console.WriteLine("###################################################################################");
        Console.WriteLine("");
    }

    if (true)
    {
        Console.WriteLine("############################## -- GET DEPARTMENT -- ###########################");
        SqlCommand SP_GetDepartment = new SqlCommand("GetDepartment", conn) { CommandType = CommandType.StoredProcedure };
        SP_GetDepartment.Parameters.Add(new SqlParameter("@DNumber", "2"));
        using (SqlDataReader rdr = SP_GetDepartment.ExecuteReader())
        {
            // iterate through results, printing each to console
            Console.WriteLine("DName \t\t DNumber \t\t MgrSSN \t\t MgrStartDate \t\t EmpCount");
            while (rdr.Read())
            {
                Console.WriteLine(rdr["DName"] + " \t\t " + rdr["DNumber"] + " \t\t " + rdr["MgrSSN"] + " \t\t " + rdr["MgrStartDate"] + " \t\t " + rdr["EmpCount"]);
            }
        }
        Console.WriteLine("###################################################################################");
        Console.WriteLine("");
    }





}
