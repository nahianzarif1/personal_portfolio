using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace portfolio.Project
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // --- IMPORTANT: Change these to your own secure credentials ---
            string correctUsername = "admin";
            string correctPassword = "123456";

            string enteredUsername = txtUsername.Text.Trim();
            string enteredPassword = txtPassword.Text;

            // Check if the credentials are correct
            if (enteredUsername == correctUsername && enteredPassword == correctPassword)
            {
                // If correct, store a value in the session to mark user as authenticated
                Session["IsAdminAuthenticated"] = true;

                // Redirect to the admin panel
                Response.Redirect("AdminPanel.aspx");
            }
            else
            {
                // If incorrect, show an error message
                lblError.Text = "Invalid username or password.";
                lblError.Visible = true;
            }
        }
    }
}