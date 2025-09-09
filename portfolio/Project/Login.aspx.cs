using System;
using System.Web;
using System.Web.UI;

namespace portfolio.Project
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Already authenticated? Redirect to admin panel
                if (Session["IsAdminAuthenticated"] != null && (bool)Session["IsAdminAuthenticated"])
                {
                    Response.Redirect("AdminPanel.aspx");
                }

                // Try restore session from cookie
                if (Session["IsAdminAuthenticated"] == null && Request.Cookies["UserInfo"] != null)
                {
                    string savedUsername = Request.Cookies["UserInfo"]["username"];
                    string savedPassword = Request.Cookies["UserInfo"]["password"];

                    if (savedUsername == "admin" && savedPassword == "123456")
                    {
                        Session["IsAdminAuthenticated"] = true;
                        Session["Username"] = savedUsername;
                        Response.Redirect("AdminPanel.aspx");
                    }
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string correctUsername = "admin";
            string correctPassword = "123456";

            string enteredUsername = txtUsername.Text.Trim();
            string enteredPassword = txtPassword.Text;

            if (enteredUsername == correctUsername && enteredPassword == correctPassword)
            {
                Session["IsAdminAuthenticated"] = true;
                Session["Username"] = enteredUsername;

                if (chkRememberMe.Checked)
                {
                    HttpCookie userCookie = new HttpCookie("UserInfo");
                    userCookie["username"] = enteredUsername;
                    userCookie["password"] = enteredPassword; // Demo only
                    userCookie.Expires = DateTime.Now.AddDays(7);
                    Response.Cookies.Add(userCookie);
                }

                Response.Redirect("AdminPanel.aspx");
            }
            else
            {
                lblError.Text = "Invalid username or password.";
                lblError.Visible = true;
            }
        }

        protected void btnGoHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Portfolio.aspx"); // Replace with your actual homepage
        }
    }
}
