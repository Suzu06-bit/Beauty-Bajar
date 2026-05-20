<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <jsp:include page="/templates/head.jsp">
        <jsp:param name="title" value="About Us — Beauty Bajar"/>
    </jsp:include>

    <body>
        <div class="page">
            <jsp:include page="/templates/header.jsp"/>

            <jsp:include page="/templates/nav.jsp">
                <jsp:param name="back_title" value="Home"/>
                <jsp:param name="back_href" value="${pageContext.request.contextPath}/home"/>
                <jsp:param name="page_title" value="About Us"/>
                <jsp:param name="action_title" value=""/>
                <jsp:param name="action_href" value=""/>
            </jsp:include>

            <!-- HERO -->
            <section class="about-hero">
                <span class="tag">&#10022; Our Story</span>
                <h1>We Believe in <em>Beauty</em><br/>For Everyone</h1>
                <p>Beauty Bajar was founded with one simple mission — bring premium authentic cosmetics
                    to every corner of Nepal at honest prices.</p>
            </section>

            <!-- STORY -->
            <section class="story-section">
                <div class="story-img">
                    <img src="${pageContext.request.contextPath}/images/hero.png" 
                         alt="Beauty Bajar Story"/>
                </div>
                <div class="story-text">
                    <span class="story-tag">How It Started</span>
                    <h2>Born in Nepal,<br/>Built for Nepal</h2>
                    <p>Beauty Bajar started as a small project by five passionate students from Nepal who
                        noticed one big problem — getting authentic, high-quality beauty products was either
                        too expensive or too difficult in Nepal.</p>
                    <p>We set out to build an online platform where every Nepali woman can access
                        international beauty brands with confidence — knowing every product is 100% genuine,
                        delivered fast, and priced fairly.</p>
                    <p>From Pokhara to Kathmandu, from Butwal to Biratnagar — we deliver beauty to all
                        77 districts of Nepal.</p>
                </div>
            </section>

            <!-- STATS -->
            <div class="stats-bar">
                <div class="stat-item">
                    <span class="stat-num">500+</span>
                    <span class="stat-label">Products</span>
                </div>
                <div class="stat-item">
                    <span class="stat-num">10K+</span>
                    <span class="stat-label">Happy Customers</span>
                </div>
                <div class="stat-item">
                    <span class="stat-num">77</span>
                    <span class="stat-label">Districts Covered</span>
                </div>
                <div class="stat-item">
                    <span class="stat-num">100%</span>
                    <span class="stat-label">Authentic Products</span>
                </div>
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
                        <div class="team-role">Project Lead and Frontend Developer</div>
                        <div class="team-task">Database integration, Project planning & coordination,Home page development
                            &amp; UI design</div>
                    </div>
                    <div class="team-card">
                        <div class="team-avatar">SG</div>
                        <div class="team-name">Santoshi Gurung</div>
                        <div class="team-role">Frontend Developer</div>
                        <div class="team-task">Products listing and detail page, Category filtering UI,
                            &amp; Shopping cart page</div>
                    </div>
                    <div class="team-card">
                        <div class="team-avatar">AN</div>
                        <div class="team-name">Asmi Nepali</div>
                        <div class="team-role">Frontend Developer</div>
                        <div class="team-task">About & contact page development,
                            Page layout & styling &amp;  Form design & validation UI</div>
                    </div>
                    <div class="team-card">
                        <div class="team-avatar">NT</div>
                        <div class="team-name">Nishan Tilija Pun</div>
                        <div class="team-role">Backend Developer & Tester</div>
                        <div class="team-task">Wireframe design for all pages,UI prototyping 
                            &amp; User flow & navigation design</div>
                    </div>
                    <div class="team-card">
                        <div class="team-avatar">RR</div>
                        <div class="team-name">Ritesh Ranjit</div>
                        <div class="team-role">UI/UX Designer</div>
                        <div class="team-task">Wireframe design for all pages,Products, users & orders management 
                            &amp; System testing & bug fixing</div>
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
                        <div class="value-icon">
                            <img src="${pageContext.request.contextPath}/images/perks/authentic.jpeg" alt="100% Authentic"/>
                        </div>
                        <div class="value-title">100% Authentic</div>
                        <div class="value-text">Every product sold on Beauty Bajar is sourced directly from
                            official distributors. We guarantee authenticity on every single order.</div>
                    </div>
                    <div class="value-card">
                        <div class="value-icon">
                            <img src="${pageContext.request.contextPath}/images/perks/free-delivery.jpeg" alt="Fast Delivery"/>
                        </div>
                        <div class="value-title">Fast Delivery</div>
                        <div class="value-text">Same-day delivery in Pokhara Valley. Express delivery to all
                            77 districts of Nepal within 3–5 business days.</div>
                    </div>
                    <div class="value-card">
                        <div class="value-icon">
                            <img src="${pageContext.request.contextPath}/images/perks/honest-pricing.jpeg" alt="Honest Pricing"/>
                        </div>
                        <div class="value-title">Honest Pricing</div>
                        <div class="value-text">No hidden charges. No markups. We offer the best prices on
                            premium beauty products with cash on delivery available.</div>
                    </div>
                    <div class="value-card">
                        <div class="value-icon">
                            <img src="${pageContext.request.contextPath}/images/perks/easy-returns.jpeg" alt="Easy Returns"/>
                        </div>
                        <div class="value-title">Easy Returns</div>
                        <div class="value-text">Not satisfied? We offer a 7-day hassle-free return and exchange
                            policy. Your satisfaction is our priority.</div>
                    </div>
                    <div class="value-card">
                        <div class="value-icon">
                            <img src="${pageContext.request.contextPath}/images/perks/eco-conscious.jpeg" alt="Eco Conscious"/>
                        </div>
                        <div class="value-title">Eco Conscious</div>
                        <div class="value-text">We use minimal packaging and partner with brands that care about
                            sustainability and cruelty-free beauty.</div>
                    </div>
                    <div class="value-card">
                        <div class="value-icon">
                            <img src="${pageContext.request.contextPath}/images/perks/community-first.jpeg" alt="Community First"/>
                        </div>
                        <div class="value-title">Community First</div>
                        <div class="value-text">Beauty Bajar is more than a store — it's a community of beauty
                            lovers across Nepal sharing tips, reviews and recommendations.</div>
                    </div>
                </div>
            </section>

            <!-- CTA -->
            <section class="cta-section">
                <h2>Ready to Shop?</h2>
                <p>Explore 500+ authentic beauty products delivered all over Nepal</p>
                <a href="${pageContext.request.contextPath}/products" class="btn-white">Shop Now &#8594;</a>
            </section>

            <%@include file="/templates/footer.html" %>
        </div>
    </body>
</html>
