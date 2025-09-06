<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Portfolio.aspx.cs" Inherits="PortfolioWebsite.Portfolio" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nahian Zarif - CSE Student Portfolio</title>
    <script src="https://kit.fontawesome.com/1db4c2f1e0.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            line-height: 1.6;
            color: #e6e6e6;
            background: linear-gradient(135deg, #0d1117 0%, #161b22 50%, #0d1117 100%);
            overflow-x: hidden;
        }

        /* Navigation Styles */
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            background: rgba(13, 17, 23, 0.95);
            backdrop-filter: blur(10px);
            z-index: 1000;
            padding: 1rem 5%;
            transition: all 0.3s ease;
            box-shadow: 0 2px 20px rgba(56, 139, 253, 0.2);
            border-bottom: 1px solid rgba(56, 139, 253, 0.3);
        }

        .nav-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: 700;
            color: #58a6ff;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            list-style: none;
            gap: 2rem;
        }

        .nav-links a {
            text-decoration: none;
            color: #e6e6e6;
            font-weight: 500;
            transition: color 0.3s ease;
            position: relative;
            padding: 0.5rem 1rem;
            border-radius: 25px;
        }

        .nav-links a:hover {
            color: #58a6ff;
            background: rgba(56, 139, 253, 0.1);
        }

        .nav-links a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: 0;
            left: 50%;
            background: #58a6ff;
            transition: all 0.3s ease;
            transform: translateX(-50%);
        }

        .nav-links a:hover::after {
            width: 80%;
        }

        .btn-primary {
            background: linear-gradient(45deg, #58a6ff, #1f6feb);
            color: #ffffff;
            border: none;
            padding: 12px 25px;
            border-radius: 25px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(56, 139, 253, 0.4);
            background: linear-gradient(45deg, #79c0ff, #58a6ff);
        }

        /* Hero Section */
        .hero {
            min-height: 100vh;
            display: flex;
            align-items: center;
            padding: 0 5%;
            background: linear-gradient(135deg, #0d1117 0%, #161b22 100%);
            position: relative;
            overflow: hidden;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle at 30% 70%, rgba(56, 139, 253, 0.08) 0%, transparent 50%), 
                        radial-gradient(circle at 70% 30%, rgba(22, 172, 193, 0.05) 0%, transparent 50%);
            animation: float 20s linear infinite;
        }

        @keyframes float {
            0% { transform: translate(-50%, -50%) rotate(0deg); }
            100% { transform: translate(-50%, -50%) rotate(360deg); }
        }

        .hero-container {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 3rem;
            align-items: center;
            position: relative;
            z-index: 2;
        }

        .hero-content h3 {
            color: #16acc1;
            font-size: 1.2rem;
            margin-bottom: 0.5rem;
            animation: slideInLeft 1s ease;
        }

        .hero-content h1 {
            color: #ffffff;
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
            animation: slideInLeft 1s ease 0.2s both;
            background: linear-gradient(45deg, #58a6ff, #16acc1);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .hero-content p {
            color: rgba(230, 230, 230, 0.8);
            font-size: 1.1rem;
            margin-bottom: 2rem;
            animation: slideInLeft 1s ease 0.4s both;
            line-height: 1.6;
        }

        .hero-image {
            text-align: center;
            animation: slideInRight 1s ease 0.6s both;
        }

        .hero-image img {
            width: 280px;
            height: 280px;
            object-fit: cover;
            border-radius: 50%;
            box-shadow: 0 20px 40px rgba(0,0,0,0.5), 0 0 30px rgba(56, 139, 253, 0.3);
            transition: transform 0.3s ease;
            border: 4px solid rgba(56, 139, 253, 0.4);
        }

        .hero-image img:hover {
            transform: scale(1.05);
            box-shadow: 0 25px 50px rgba(0,0,0,0.6), 0 0 40px rgba(56, 139, 253, 0.5);
        }

        @keyframes slideInLeft {
            from { opacity: 0; transform: translateX(-50px); }
            to { opacity: 1; transform: translateX(0); }
        }

        @keyframes slideInRight {
            from { opacity: 0; transform: translateX(50px); }
            to { opacity: 1; transform: translateX(0); }
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Section Styles */
        .section {
            padding: 5rem 5%;
            background: #0d1117;
        }

        .section:nth-child(even) {
            background: linear-gradient(135deg, #161b22 0%, #0d1117 100%);
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .section-title {
            text-align: center;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
            color: #58a6ff;
            position: relative;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: linear-gradient(45deg, #58a6ff, #16acc1);
            border-radius: 2px;
        }

        .section-description {
            text-align: center;
            font-size: 1.1rem;
            color: rgba(230, 230, 230, 0.7);
            max-width: 600px;
            margin: 0 auto 3rem;
            line-height: 1.6;
        }

        /* About Section */
        .about-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 3rem;
            margin-top: 3rem;
        }

        .about-info {
            background: linear-gradient(135deg, #161b22 0%, #0d1117 100%);
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            transition: transform 0.3s ease;
            border: 1px solid rgba(56, 139, 253, 0.2);
        }

        .about-info:hover {
            transform: translateY(-5px);
            border: 1px solid rgba(56, 139, 253, 0.4);
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
        }

        .info-item {
            text-align: center;
            padding: 1.5rem;
            background: rgba(56, 139, 253, 0.05);
            border-radius: 10px;
            border: 1px solid rgba(56, 139, 253, 0.1);
        }

        .info-title {
            font-weight: 600;
            color: #58a6ff;
            margin-bottom: 0.5rem;
        }

        /* Skills Section */
        .skills-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .skill-card {
            background: linear-gradient(135deg, #161b22 0%, #0d1117 100%);
            padding: 2rem;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(56, 139, 253, 0.2);
        }

        .skill-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, rgba(56, 139, 253, 0.08), rgba(22, 172, 193, 0.05));
            transition: left 0.3s ease;
        }

        .skill-card:hover::before {
            left: 0;
        }

        .skill-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.4);
            border: 1px solid rgba(56, 139, 253, 0.4);
        }

        .skill-icon {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin: 0 auto 1rem;
            background: linear-gradient(45deg, #58a6ff, #16acc1);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            color: #ffffff;
        }

        .skill-title {
            font-size: 1.3rem;
            font-weight: 600;
            margin-bottom: 1rem;
            color: #ffffff;
        }

        .skill-description {
            color: rgba(230, 230, 230, 0.7);
            line-height: 1.6;
        }

        /* Work/Experience Section */
        .work-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .work-card {
            background: linear-gradient(135deg, #161b22 0%, #0d1117 100%);
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            transition: all 0.3s ease;
            border: 1px solid rgba(56, 139, 253, 0.2);
            position: relative;
            overflow: hidden;
        }

        .work-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(45deg, #58a6ff, #16acc1);
        }

        .work-card:hover {
            transform: translateY(-5px);
            border: 1px solid rgba(56, 139, 253, 0.4);
        }

        .work-title {
            font-size: 1.4rem;
            font-weight: 600;
            color: #58a6ff;
            margin-bottom: 0.5rem;
        }

        .work-company {
            color: #16acc1;
            font-weight: 500;
            margin-bottom: 1rem;
        }

        .work-description {
            color: rgba(230, 230, 230, 0.7);
            line-height: 1.6;
        }

        .education-item {
    position: relative;
    margin-bottom: 3rem;
    width: 45%;
}

/* Odd items on left, even items on right */
.education-item:nth-child(odd) {
    left: 0;
    text-align: right;
}

.education-item:nth-child(even) {
    left: 55%;
    text-align: left;
}

/* Year positioning fixed per item */
.education-year {
    position: absolute;
    top: 50%; /* keep at vertical center of item */
    transform: translate(-50%, -50%);
    background: #58a6ff;
    color: #fff;
    padding: 0.5rem 1rem;
    border-radius: 20px;
    font-weight: 600;
    z-index: 10;
}

/* Adjust left/right for odd/even */
.education-item:nth-child(odd) .education-year {
    right: -50px; /* place outside content box */
}

.education-item:nth-child(even) .education-year {
    left: -50px;
}

        /* Contact Section */
        .contact-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 3rem;
            margin-top: 3rem;
        }

        .contact-info {
            background: linear-gradient(45deg, #161b22, #0d1117);
            padding: 3rem 2rem;
            border-radius: 20px;
            color: #e6e6e6;
            border: 1px solid rgba(56, 139, 253, 0.2);
        }

        .social-links {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }

        .social-links a {
            display: inline-flex;
            width: 50px;
            height: 50px;
            background: rgba(56, 139, 253, 0.1);
            border-radius: 50%;
            align-items: center;
            justify-content: center;
            color: #58a6ff;
            text-decoration: none;
            transition: all 0.3s ease;
            border: 1px solid rgba(56, 139, 253, 0.2);
        }

        .social-links a:hover {
            background: #58a6ff;
            color: #ffffff;
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(56, 139, 253, 0.3);
        }

        .contact-form {
            background: linear-gradient(135deg, #161b22 0%, #0d1117 100%);
            padding: 2rem;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            border: 1px solid rgba(56, 139, 253, 0.2);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #58a6ff;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid rgba(56, 139, 253, 0.2);
            border-radius: 10px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
            font-family: inherit;
            background: rgba(13, 17, 23, 0.7);
            color: #e6e6e6;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #58a6ff;
            box-shadow: 0 0 10px rgba(56, 139, 253, 0.2);
        }

        .form-group textarea {
            resize: vertical;
            min-height: 120px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .hero-container,
            .about-grid,
            .contact-grid {
                grid-template-columns: 1fr;
                gap: 2rem;
            }

            .hero-content h1 {
                font-size: 2.5rem;
            }

            .nav-links {
                display: none;
            }

            .skills-grid,
            .work-grid {
                grid-template-columns: 1fr;
            }

            .education-timeline::before {
                left: 30px;
            }

            .education-item {
                width: auto;
                left: 60px !important;
                text-align: left !important;
            }

            .education-content::before {
                left: -32px !important;
                border-right-color: #161b22 !important;
                border-left-color: transparent !important;
            }

            .education-year {
                left: 30px;
                transform: translateY(-50%);
            }
        }

        /* Loading Animation */
        .loading {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #0d1117 0%, #161b22 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 9999;
            opacity: 1;
            transition: opacity 0.5s ease;
        }

        .loading.hidden {
            opacity: 0;
            pointer-events: none;
        }

        .spinner {
            width: 50px;
            height: 50px;
            border: 5px solid rgba(56, 139, 253, 0.2);
            border-top: 5px solid #58a6ff;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .animate-on-scroll {
            opacity: 0;
            transform: translateY(30px);
            transition: all 0.6s ease;
        }

        .animate-on-scroll.animated {
            opacity: 1;
            transform: translateY(0);
        }

        /* Message Styles */
        .alert {
            padding: 15px;
            margin-top: 15px;
            border-radius: 10px;
            font-weight: 500;
            text-align: center;
        }

        .alert-success {
            background-color: rgba(56, 139, 253, 0.1);
            color: #58a6ff;
            border: 1px solid rgba(56, 139, 253, 0.3);
        }

        .alert-error {
            background-color: rgba(248, 81, 73, 0.1);
            color: #f85149;
            border: 1px solid rgba(248, 81, 73, 0.3);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Loading Screen -->
        <div class="loading" id="loading">
            <div class="spinner"></div>
        </div>

        <!-- Navigation -->
        <nav class="navbar">
            <div class="nav-container">
                <a href="#" class="logo">Nahian <span style="color: #16acc1;">Zarif</span></a>
                <ul class="nav-links">
                    <li><a href="#home">Home</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#skills">Skills</a></li>
                    <li><a href="#education">Education</a></li>
                    <li><a href="#work">Work</a></li>
                    <li><a href="#contact">Contact</a></li>
                </ul>
            </div>
        </nav>

        <!-- Hero Section -->
<section id="home" class="hero">
    <div class="hero-container">
        <div class="hero-content">
            <h3>Hi, I am</h3>
            <h1>Nahian Zarif</h1>
            <p>Computer Science & Engineering Student at KUET with a passion for software development, problem-solving, and creating innovative technological solutions.</p>
            
        </div>
        <div class="hero-image">
            <asp:Image ID="imgProfile" runat="server" ImageUrl="~/images/abcd.jpeg" alt="Profile Picture" />
        </div>
    </div>
</section>


      <!-- About Section -->
<section id="about" class="section animate-on-scroll">
    <div class="container">
        <h3 class="section-title">About Me</h3>
        <p class="section-description">
            I am Nahian Zarif, a dedicated Computer Science & Engineering student currently in my 3rd year at KUET. I have a strong foundation in programming, algorithms, and software development with expertise in modern technologies.
        </p>
        
        <div class="about-grid">
            <div class="about-info">
                <h4 style="margin-bottom: 1.5rem; color: #58a6ff;">Personal Information</h4>
                <div class="info-grid">
                    <div class="info-item">
                        <p class="info-title">Name</p>
                        <p>Nahian Zarif</p>
                    </div>
                    <div class="info-item">
                        <p class="info-title">Email</p>
                        <p>nahianzarif.100@gmail.com</p>
                    </div>
                    <div class="info-item">
                        <p class="info-title">Specialty</p>
                        <p>Full Stack Development & AI</p>
                    </div>
                    <div class="info-item">
                        <p class="info-title">Location</p>
                        <p>Khulna, Bangladesh</p>
                    </div>
                </div>
            </div>
            <div class="about-info">
                <h4 style="margin-bottom: 1.5rem; color: #58a6ff;">Academic Overview</h4>
                <div style="display: flex; flex-direction: column; gap: 1rem;">
                    <p><strong>Year:</strong> 3rd Year</p>
                    <p><strong>CGPA:</strong> 3.75/4.00</p>
                    <p><strong>Projects:</strong> 20+ Completed</p>
                    <p><strong>Status:</strong> Available for Opportunities</p>
                </div>
            </div>
        </div>
    </div>
</section>


        <!-- Skills Section -->
        <section id="skills" class="section animate-on-scroll">
            <div class="container">
                <h3 class="section-title">Technical Skills</h3>
                <p class="section-description">Here are my core technical competencies and expertise areas</p>
                
                <div class="skills-grid">
                    <asp:Repeater ID="rptSkills" runat="server">
                        <ItemTemplate>
                            <div class="skill-card">
                                <div class="skill-icon">
                                    <i class="<%# Eval("Icon") %>"></i>
                                </div>
                                <h4 class="skill-title"><%# Eval("Title") %></h4>
                                <p class="skill-description"><%# Eval("Description") %></p>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </section>

        <!-- Education Section -->
        <section id="education" class="section animate-on-scroll">
            <div class="container">
                <h3 class="section-title">Education</h3>
                <p class="section-description">My academic journey and educational achievements</p>
                
                <div class="education-timeline">
                    <asp:Repeater ID="rptEducation" runat="server">
                        <ItemTemplate>
                            <div class="education-item">
                                <div class="education-year"><%# Eval("Year") %></div><br></br>
                                <div class="education-content">
                                    <h4 class="education-degree"><%# Eval("Title") %></h4>
                                    <h5 class="education-school"><%# Eval("Institution") %></h5>
                                    <p class="education-desc"><%# Eval("Description") %></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </section>

        <!-- Work Experience Section -->
        <section id="work" class="section animate-on-scroll">
            <div class="container">
                <h3 class="section-title">Work Experience</h3>
                <p class="section-description">My professional journey and project experiences</p>
                
                <div class="work-grid">
                    <asp:Repeater ID="rptExperience" runat="server">
                        <ItemTemplate>
                            <div class="work-card">
                                <h4 class="work-title"><%# Eval("Title") %></h4>
                                <h5 class="work-company"><%# Eval("Duration") %></h5>
                                <p class="work-description"><%# Eval("Description") %></p>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                
                
            </div>
        </section>

        <!-- Contact Section -->
        <section id="contact" class="section animate-on-scroll">
            <div class="container">
                <h3 class="section-title">Get In Touch</h3>
                <p class="section-description">Let's connect and discuss opportunities in technology and software development</p>
                
                <div class="contact-grid">
                    <div class="contact-info">
                        <h4 style="font-size: 1.5rem; margin-bottom: 1rem;">Professional Contact</h4>
                        <p style="margin-bottom: 2rem; opacity: 0.9;">I'm always open to discussing new opportunities, collaborations, and projects in software development and technology.</p>
                        
                        <div class="social-links">
                            <a href="#" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                            <a href="#" title="Instagram"><i class="fab fa-instagram"></i></a>
                            <a href="#" title="Twitter"><i class="fab fa-twitter"></i></a>
                            <a href="#" title="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                            <a href="https://github.com/nahianzarif1" title="GitHub"><i class="fab fa-github"></i></a>
                        </div>
                    </div>
                    
                    <div class="contact-form">
                        <div class="form-group">
                            <label>Your Name</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your full name"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Your Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="Enter your email address"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Message</label>
                            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" placeholder="Write your message here..."></asp:TextBox>
                        </div>
                        <asp:Button ID="btnSubmit" runat="server" Text="Send Message" CssClass="btn-primary" OnClick="btnSubmit_Click" style="width: 100%;" />
                        
                        <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>
                    </div>
                </div>
            </div>
        </section>
    </form>

    <script>
        // Loading screen
        window.addEventListener('load', function () {
            setTimeout(function () {
                document.getElementById('loading').classList.add('hidden');
            }, 1000);
        });

        // Smooth scrolling
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });

        // Scroll animations
        const animateOnScroll = () => {
            const elements = document.querySelectorAll('.animate-on-scroll');
            const windowHeight = window.innerHeight;

            elements.forEach(element => {
                const elementTop = element.getBoundingClientRect().top;
                const elementVisible = 150;

                if (elementTop < windowHeight - elementVisible) {
                    element.classList.add('animated');
                }
            });
        };

        window.addEventListener('scroll', animateOnScroll);
        animateOnScroll(); // Run once on load

        // Navbar scroll effect
        window.addEventListener('scroll', function () {
            const navbar = document.querySelector('.navbar');
            if (window.scrollY > 100) {
                navbar.style.background = 'rgba(13, 17, 23, 0.98)';
                navbar.style.boxShadow = '0 2px 30px rgba(56, 139, 253, 0.4)';
            } else {
                navbar.style.background = 'rgba(13, 17, 23, 0.95)';
                navbar.style.boxShadow = '0 2px 20px rgba(56, 139, 253, 0.2)';
            }
        });

        // Enhanced interactive effects
        document.querySelectorAll('.skill-card, .work-card, .about-info').forEach(card => {
            card.addEventListener('mouseenter', function () {
                this.style.transform = 'translateY(-10px) scale(1.02)';
            });

            card.addEventListener('mouseleave', function () {
                this.style.transform = 'translateY(0) scale(1)';
            });
        });

        // Enhanced typing effect for hero title
        function typeWriter(element, text, speed = 100) {
            let i = 0;
            element.innerHTML = '';
            function typing() {
                if (i < text.length) {
                    element.innerHTML += text.charAt(i);
                    i++;
                    setTimeout(typing, speed);
                }
            }
            typing();
        }

        // Initialize typing effect when page loads
        setTimeout(() => {
            const titleElement = document.querySelector('.hero-content h1 span');
            if (titleElement) {
                const originalText = titleElement.textContent;
                typeWriter(titleElement, originalText, 150);
            }
        }, 1500);
    </script>
</body>
</html>