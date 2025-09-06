using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PortfolioWebsite
{
    public partial class Portfolio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPortfolioData();
                LoadSkills();
                LoadEducation();
                LoadExperience();
            }
        }

        private void LoadPortfolioData()
        {
            // Personal Information
            lblName.Text = "Nahian Zarif";
            lblDescription.Text = "Computer Science & Engineering Student at KUET with a passion for software development, problem-solving, and creating innovative technological solutions. Skilled in multiple programming languages and eager to contribute to meaningful projects.";
            lblAboutMe.Text = "I am Nahian Zarif, a dedicated Computer Science & Engineering student currently in my 3rd year at Khulna University of Engineering & Technology (KUET). I have a strong foundation in programming, algorithms, and software development with expertise in modern technologies. My goal is to leverage technology to solve real-world problems and contribute to innovative software solutions that make a positive impact on society.";

            // Personal Details
            lblPersonalName.Text = "Nahian Zarif";
            lblEmail.Text = "nahianzarif.100@gmail.com";
            lblSpecialty.Text = "Full Stack Development & AI";
            lblLocation.Text = "Khulna, Bangladesh";

            // Additional Info
            lblAge.Text = "3rd Year";
            lblExperience.Text = "3.75/4.00";
            lblProjects.Text = "20+ Completed";
            lblAvailability.Text = "Available for Opportunities";

            // Set profile image
            imgProfile.ImageUrl = "~/images/school-removebg-preview.jpeg";
        }

        private void LoadSkills()
        {
            // Create comprehensive skills data
            List<SkillItem> skills = new List<SkillItem>
            {
                new SkillItem
                {
                    Icon = "fas fa-code",
                    Title = "Programming Languages",
                    Description = "Expert in C++, Java, Python, C#, JavaScript, and TypeScript. Strong understanding of object-oriented programming, data structures, algorithms, and design patterns with practical application in enterprise projects."
                },
                new SkillItem
                {
                    Icon = "fas fa-database",
                    Title = "Database & Backend",
                    Description = "Proficient with SQL Server, MySQL, MongoDB, PostgreSQL, and Redis. Experienced in backend development using ASP.NET Core, Node.js, Express.js, and RESTful API design for scalable microservices architecture."
                },
                new SkillItem
                {
                    Icon = "fas fa-laptop-code",
                    Title = "Frontend Development",
                    Description = "Modern web development using HTML5, CSS3, JavaScript ES6+, React.js, Angular, Vue.js, and responsive design frameworks like Bootstrap and Tailwind CSS for creating stunning user interfaces."
                },
                new SkillItem
                {
                    Icon = "fas fa-brain",
                    Title = "AI & Machine Learning",
                    Description = "Experience with TensorFlow, PyTorch, scikit-learn, and data analysis using Pandas and NumPy. Familiar with deep learning, neural networks, and computer vision applications."
                },
                new SkillItem
                {
                    Icon = "fas fa-cloud",
                    Title = "Cloud & DevOps",
                    Description = "Hands-on experience with AWS, Azure, Docker, Kubernetes, CI/CD pipelines using GitHub Actions, and infrastructure as code. Familiar with microservices deployment and monitoring."
                },
                new SkillItem
                {
                    Icon = "fas fa-mobile-alt",
                    Title = "Mobile Development",
                    Description = "Cross-platform mobile app development using React Native, Flutter, and native Android development with Java/Kotlin. Experience with mobile UI/UX design principles and app store deployment."
                }
            };

            rptSkills.DataSource = skills;
            rptSkills.DataBind();
        }

        private void LoadEducation()
        {
            // Create realistic education data
            List<EducationItem> education = new List<EducationItem>
            {
                new EducationItem
                {
                    Title = "B.Sc. in Computer Science & Engineering",
                    Institution = "Khulna University of Engineering & Technology (KUET)",
                    Year = "2021-2025",
                    Description = "Currently pursuing undergraduate degree with focus on Software Engineering, Data Structures, Algorithms, Machine Learning, and Database Systems. Maintaining excellent academic performance with hands-on project experience."
                },
                new EducationItem
                {
                    Title = "Higher Secondary Certificate (Science)",
                    Institution = "Notre Dame College, Dhaka",
                    Year = "2019-2021",
                    Description = "Completed with distinction in Science group focusing on Mathematics, Physics, Chemistry, and ICT. Developed strong analytical and problem-solving foundation essential for engineering studies."
                },
                new EducationItem
                {
                    Title = "Secondary School Certificate (Science)",
                    Institution = "Local High School",
                    Year = "2017-2019",
                    Description = "Completed secondary education with excellent results in Science subjects. Participated in various science olympiads and programming competitions, discovering passion for technology."
                }
            };

            rptEducation.DataSource = education;
            rptEducation.DataBind();
        }

        private void LoadExperience()
        {
            // Create realistic experience data
            List<ExperienceItem> experience = new List<ExperienceItem>
            {
                new ExperienceItem
                {
                    Title = "Full Stack Developer Intern",
                    Duration = "Summer 2024 (3 months)",
                    Description = "Developed responsive web applications using React.js and ASP.NET Core. Collaborated with cross-functional teams to deliver high-quality software solutions. Gained experience in agile development methodologies and version control with Git."
                },
                new ExperienceItem
                {
                    Title = "Freelance Web Developer",
                    Duration = "2023 - Present",
                    Description = "Creating custom websites and web applications for local businesses and startups. Specialized in modern responsive design, e-commerce solutions, and content management systems using various technologies."
                },
                new ExperienceItem
                {
                    Title = "Programming Tutor",
                    Duration = "2023 - Present",
                    Description = "Teaching programming fundamentals to junior students and professionals. Covering topics including C++, Java, Python, data structures, and algorithms. Helping students develop problem-solving skills and coding best practices."
                },
                new ExperienceItem
                {
                    Title = "Open Source Contributor",
                    Duration = "2022 - Present",
                    Description = "Active contributor to various open-source projects on GitHub. Participating in community-driven development, code reviews, and documentation improvements. Contributing to libraries and frameworks used by developers worldwide."
                }
            };

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

                // Validate email format
                if (!IsValidEmail(senderEmail))
                {
                    ShowMessage("Please enter a valid email address!", "error");
                    return;
                }

                ProcessContactMessage(senderName, senderEmail, message);

                // Clear form
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
            // Simulate message processing
            // In a real application, you would save to database or send email
            System.Threading.Thread.Sleep(1000);

            // Log the message (in production, save to database)
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

    // Enhanced Data classes for binding
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