using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Admin
/// </summary>
public class Admin
{
    public string username;
    public string password;
    public Admin(string username, string password)
    {
        this.username = username;
        this.password = password;

    }
    public static bool CheckLogin(string username, string password)
    {
        bool isCorrect = false;
        if (username == "AdminFerya" && password == "2468Test@@") // admin 1
        {
            isCorrect = true;
        }
        if (username == "123" && password == "1234ufresh@") // admin 1
        {
            isCorrect = true;
        }


        return isCorrect;
    }
}