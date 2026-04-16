
<%@ include file="navbar.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us — Beauty Bajar</title>
    </head>
    <body>

        <!-- HERO -->
        <section class="about-hero">
            <span class="tag">&#10022; Our Story</span>
            <h1>We Believe in <em>Beauty</em><br/>For Everyone</h1>
            <p>Beauty Bajar was founded with one simple mission — bring premium authentic cosmetics to every corner of Nepal at honest prices.</p>
        </section>

        <!-- STORY -->
        <section class="story-section">
            <div class="story-img">&#128144;</div>
            <div class="story-text">
                <span class="story-tag">How It Started</span>
                <h2>Born in Nepal,<br/>Built for Nepal</h2>
                <p>Beauty Bajar started as a small project by five passionate students from Nepal who noticed one big problem — getting authentic, high-quality beauty products was either too expensive or too difficult in Nepal.</p>
                <p>We set out to build an online platform where every Nepali woman (and man!) can access international beauty brands with confidence — knowing every product is 100% genuine, delivered fast, and priced fairly.</p>
                <p>From Kathmandu to Pokhara, from Butwal to Biratnagar — we deliver beauty to all 77 districts of Nepal.</p>
            </div>
        </section>

        <!-- STATS -->
        <div class="stats-bar">
            <div class="stat-item"><span class="stat-num">500+</span><span class="stat-label">Products</span></div>
            <div class="stat-item"><span class="stat-num">10K+</span><span class="stat-label">Happy Customers</span></div>
            <div class="stat-item"><span class="stat-num">77</span><span class="stat-label">Districts Covered</span></div>
            <div class="stat-item"><span class="stat-num">100%</span><span class="stat-label">Authentic Products</span></div>
        </div>

        <!-- TEAM -->
        <section class="team-section">
            <div class="section-header">
                <span class="section-tag">Meet the Team</span>
                <h2 class="section-title">The People Behind Beauty Bajar</h2>
            </div>
            <div class="team-grid">
                <div class="team-card">
                    <div class="team-avatar">SP</div>
                    <div class="team-name">Sujita Pandey</div>
                    <div class="team-role">Project Lead</div>
                    <div class="team-task">Database Design &amp; MVC Architecture</div>
                </div>
                <div class="team-card">
                    <div class="team-avatar">SG</div>
                    <div class="team-name">Santoshi Gurung</div>
                    <div class="team-role">Frontend Dev</div>
                    <div class="team-task">User Portal &amp; Shopping Experience</div>
                </div>
                <div class="team-card">
                    <div class="team-avatar">AN</div>
                    <div class="team-name">Asmi Nepali</div>
                    <div class="team-role">Admin Dev</div>
                    <div class="team-task">Admin Dashboard &amp; Product Management</div>
                </div>
                <div class="team-card">
                    <div class="team-avatar">NT</div>
                    <div class="team-name">Nishan Tilija Pun</div>
                    <div class="team-role">Security</div>
                    <div class="team-task">Authentication &amp; Testing</div>
                </div>
                <div class="team-card">
                    <div class="team-avatar">RR</div>
                    <div class="team-name">Ritesh Ranjit</div>
                    <div class="team-role">Backend Dev</div>
                    <div class="team-task">Java Classes &amp; Documentation</div>
                </div>
            </div>
        </section>

        <!-- VALUES -->
        <section class="values-section">
            <div class="section-header">
                <span class="section-tag">What We Stand For</span>
                <h2 class="section-title">Our Core Values</h2>
            </div>
            <div class="values-grid">
                <div class="value-card">
                    <div class="value-icon">&#128142;</div>
                    <div class="value-title">100% Authentic</div>
                    <div class="value-text">Every product sold on Beauty Bajar is sourced directly from official distributors. We guarantee authenticity on every single order.</div>
                </div>
                <div class="value-card">
                    <div class="value-icon">&#128666;</div>
                    <div class="value-title">Fast Delivery</div>
                    <div class="value-text">Same-day delivery in Kathmandu Valley. Express delivery to all 77 districts of Nepal within 3–5 business days.</div>
                </div>
                <div class="value-card">
                    <div class="value-icon">&#128179;</div>
                    <div class="value-title">Honest Pricing</div>
                    <div class="value-text">No hidden charges. No markups. We offer the best prices on premium beauty products with cash on delivery available.</div>
                </div>
                <div class="value-card">
                    <div class="value-icon">&#128504;</div>
                    <div class="value-title">Easy Returns</div>
                    <div class="value-text">Not satisfied? We offer a 7-day hassle-free return and exchange policy. Your satisfaction is our priority.</div>
                </div>
                <div class="value-card">
                    <div class="value-icon">&#127807;</div>
                    <div class="value-title">Eco Conscious</div>
                    <div class="value-text">We use minimal packaging and partner with brands that care about sustainability and cruelty-free beauty.</div>
                </div>
                <div class="value-card">
                    <div class="value-icon">&#128101;</div>
                    <div class="value-title">Community First</div>
                    <div class="value-text">Beauty Bajar is more than a store — it's a community of beauty lovers across Nepal sharing tips, reviews and recommendations.</div>
                </div>
            </div>
        </section>

        <!-- CTA -->
        <section class="cta-section">
            <h2>Ready to Shop?</h2>
            <p>Explore 500+ authentic beauty products delivered all over Nepal</p>
            <a href="${pageContext.request.contextPath}/products" class="btn-white">Shop Now &#8594;</a>
        </section>

        <footer>
            <p>&copy; 2025 Beauty Bajar &nbsp;|&nbsp; Made with &#10084; in Nepal &nbsp;|&nbsp;
                <a href="${pageContext.request.contextPath}/contact">Contact Us</a></p>
        </footer>

    </body>
</html>

