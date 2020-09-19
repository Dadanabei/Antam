using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace Pertamina.PKBL.WebApp
{
    public class RoleCheck
    {
        public static bool CheckRoleView(string[] roles,string role)
        {
            return (roles.Where(t => t.Contains(role)).ToList().Count > 0) ? true : false;
        }
    }

    public class SessionCheck
    {

        public static object Check(object response,object session)
        {
            var resp = (HttpResponse)response;

            if (session == null)
            {
                FormsAuthentication.SignOut();
                resp.Redirect("~/Account/Login.aspx");
                //FormsAuthentication.RedirectToLoginPage();
                resp.End();
            }

            return session;
            
        }


        
    }

    public class Helper
    {
        public static string Terbilang(int x)
        {

            string[] bilangan = { "", "satu", "dua", "tiga", "empat", "lima", "enam", "tujuh", "delapan", "sembilan", "sepuluh", "sebelas" };
            string temp = "";

            if (x < 12)
            {
                temp = " " + bilangan[x];
            }
            else if (x < 20)
            {
                temp = Terbilang(x - 10).ToString() + " belas";
            }
            else if (x < 100)
            {
                temp = Terbilang(x / 10) + " puluh" + Terbilang(x % 10);
            }
            else if (x < 200)
            {
                temp = " seratus" + Terbilang(x - 100);
            }
            else if (x < 1000)
            {
                temp = Terbilang(x / 100) + " ratus" + Terbilang(x % 100);
            }
            else if (x < 2000)
            {
                temp = " seribu" + Terbilang(x - 1000);
            }
            else if (x < 1000000)
            {
                temp = Terbilang(x / 1000) + " ribu" + Terbilang(x % 1000);
            }
            else if (x < 1000000000)
            {
                temp = Terbilang(x / 1000000) + " juta" + Terbilang(x % 1000000);
            }
            return temp;
        }
    }
}