using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace PortfolioWebsite
{
    public partial class Portfolio : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDBConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                
                LoadSkills();
                LoadEducation();
                LoadExperience();
            }
        }

        private void LoadSkills()
        {
            List<SkillItem> skills = new List<SkillItem>();
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Skills";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    skills.Add(new SkillItem
                    {
                        Title = reader["Title"].ToString(),
                        Description = reader["Description"].ToString(),
                        Icon = reader["Icon"].ToString()
                    });
                }
                con.Close();
            }
            rptSkills.DataSource = skills;
            rptSkills.DataBind();
        }

        private void LoadEducation()
        {
            List<EducationItem> education = new List<EducationItem>();
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Education ORDER BY Id DESC";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    education.Add(new EducationItem
                    {
                        Title = reader["Title"].ToString(),
                        Institution = reader["Institution"].ToString(),
                        Year = reader["Year"].ToString(),
                        Description = reader["Description"].ToString()
                    });
                }
                con.Close();
            }
            rptEducation.DataSource = education;
            rptEducation.DataBind();
        }

        private void LoadExperience()
        {
            List<ExperienceItem> experience = new List<ExperienceItem>();
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Experience ORDER BY Id DESC";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    experience.Add(new ExperienceItem
                    {
                        Title = reader["Title"].ToString(),
                        Duration = reader["Duration"].ToString(),
                        Description = reader["Description"].ToString()
                    });
                }
                con.Close();
            }
            rptExperience.DataSource = experience;
            rptExperience.DataBind();
        }

        protected void btnDownloadCV_Click(object sender, EventArgs e)
        {
            string script = @"
                alert('Please contact me directly to receive my complete CV and portfolio documents.');
                document.getElementById('contact').scrollIntoView({ behavior: 'smooth' });
            ";
            ClientScript.RegisterStartupScript(this.GetType(), "DownloadScript", script, true);
        }

        protected void btnMarryMe_Click(object sender, EventArgs e)
        {
            string script = @"
                if(confirm('Would you like to view my complete professional resume and project portfolio?')) {
                    alert('Please contact me to receive my complete resume and discuss opportunities.');
                    document.getElementById('contact').scrollIntoView({ behavior: 'smooth' });
                }
            ";
            ClientScript.RegisterStartupScript(this.GetType(), "ResumeScript", script, true);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtName.Text) ||
                    string.IsNullOrWhiteSpace(txtEmail.Text) ||
                    string.IsNullOrWhiteSpace(txtMessage.Text))
                {
                    ShowMessage("Please fill in all fields before sending your message!", "error");
                    return;
                }

                string senderName = txtName.Text.Trim();
                string senderEmail = txtEmail.Text.Trim();
                string message = txtMessage.Text.Trim();

                if (!IsValidEmail(senderEmail))
                {
                    ShowMessage("Please enter a valid email address!", "error");
                    return;
                }

                ProcessContactMessage(senderName, senderEmail, message);

                txtName.Text = "";
                txtEmail.Text = "";
                txtMessage.Text = "";

                ShowMessage($"Thank you {senderName}! Your message has been received successfully. I will respond to you soon at {senderEmail}.", "success");
            }
            catch (Exception ex)
            {
                ShowMessage("Something went wrong while sending your message. Please try again!", "error");
                System.Diagnostics.Debug.WriteLine($"Contact form error: {ex.Message}");
            }
        }

        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

        private void ProcessContactMessage(string name, string email, string message)
        {
            System.Threading.Thread.Sleep(1000);
            System.Diagnostics.Debug.WriteLine($"New message from {name} ({email}): {message}");
        }

        private void ShowMessage(string message, string type)
        {
            string alertType = type == "success" ? "Success!" : type == "error" ? "Error!" : "Information";
            string script = $@"
                alert('{alertType}: {message}');
            ";
            ClientScript.RegisterStartupScript(this.GetType(), "MessageScript", script, true);
        }
    }

    public class SkillItem
    {
        public string Icon { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
    }

    public class EducationItem
    {
        public string Title { get; set; }
        public string Institution { get; set; }
        public string Year { get; set; }
        public string Description { get; set; }
    }

    public class ExperienceItem
    {
        public string Title { get; set; }
        public string Duration { get; set; }
        public string Description { get; set; }
    }
}
