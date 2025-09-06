using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace PortfolioWebsite
{
    public partial class AdminPanel : Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDBConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e) { }

        // Save Personal Info
        protected void btnSavePersonal_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"IF EXISTS (SELECT 1 FROM PersonalInfo WHERE Id=1)
                                 UPDATE PersonalInfo SET
                                     Name=@Name, Description=@Desc, AboutMe=@About, Email=@Email,
                                     Specialty=@Spec, Location=@Loc, Age=@Age, Experience=@Exp,
                                     Projects=@Proj, Availability=@Avail, ProfileImage=@Img
                                 WHERE Id=1
                                 ELSE
                                 INSERT INTO PersonalInfo
                                     (Name, Description, AboutMe, Email, Specialty, Location, Age, Experience, Projects, Availability, ProfileImage)
                                     VALUES (@Name, @Desc, @About, @Email, @Spec, @Loc, @Age, @Exp, @Proj, @Avail, @Img)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Desc", txtDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@About", txtAboutMe.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Spec", txtSpecialty.Text.Trim());
                    cmd.Parameters.AddWithValue("@Loc", txtLocation.Text.Trim());
                    cmd.Parameters.AddWithValue("@Age", txtAge.Text.Trim());
                    cmd.Parameters.AddWithValue("@Exp", txtExperience.Text.Trim());
                    cmd.Parameters.AddWithValue("@Proj", txtProjects.Text.Trim());
                    cmd.Parameters.AddWithValue("@Avail", txtAvailability.Text.Trim());
                    cmd.Parameters.AddWithValue("@Img", txtProfileImage.Text.Trim());

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            lblMessage.Text = "Personal Info saved successfully!";
        }

        // Add Skill
        protected void btnAddSkill_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Skills (Title, Description, Icon) VALUES (@Title, @Desc, @Icon)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Title", txtSkillTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@Desc", txtSkillDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@Icon", txtSkillIcon.Text.Trim());
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            lblMessage.Text = "Skill added successfully!";
            txtSkillTitle.Text = txtSkillDescription.Text = txtSkillIcon.Text = "";
        }

        // Add Education
        protected void btnAddEducation_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Education (Title, Institution, Year, Description) VALUES (@Title, @Inst, @Year, @Desc)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Title", txtEduTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@Inst", txtEduInstitution.Text.Trim());
                    cmd.Parameters.AddWithValue("@Year", txtEduYear.Text.Trim());
                    cmd.Parameters.AddWithValue("@Desc", txtEduDesc.Text.Trim());
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            lblMessage.Text = "Education added successfully!";
            txtEduTitle.Text = txtEduInstitution.Text = txtEduYear.Text = txtEduDesc.Text = "";
        }

        protected void btnAddExperience_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtExpTitle.Text))
            {
                lblMessage.Text = "Title is empty!";
                return;
            }

            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "INSERT INTO Experience (Title, Duration, Description) VALUES (@Title, @Dur, @Desc)";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Title", txtExpTitle.Text.Trim());
                        cmd.Parameters.AddWithValue("@Dur", txtExpDuration.Text.Trim());
                        cmd.Parameters.AddWithValue("@Desc", txtExpDesc.Text.Trim());
                        con.Open();
                        int rows = cmd.ExecuteNonQuery();
                        con.Close();

                        lblMessage.Text = rows > 0 ? "Experience added successfully!" : "Failed to add experience.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

    }
}
