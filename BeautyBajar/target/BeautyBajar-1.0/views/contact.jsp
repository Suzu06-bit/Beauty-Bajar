<%@ include file="navbar.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us — Beauty Bajar</title>
    </head>
    <body>
        section class="contact-hero">
        <span class="tag">&#10022; Get In Touch</span>
        <h1>Contact <em>Beauty Bajar</em></h1>
        <p>Have a question? We'd love to hear from you. Send us a message and we'll respond within 24 hours.</p>
    </section>

    <!-- MAIN -->
    <section class="contact-main">

        <!-- LEFT: Contact Info -->
        <div>
            <div class="info-card">
                <div class="info-icon">&#128205;</div>
                <div>
                    <div class="info-title">Our Location</div>
                    <div class="info-detail">Kathmandu, Bagmati Province<br/>Nepal</div>
                </div>
            </div>
            <div class="info-card">
                <div class="info-icon">&#128222;</div>
                <div>
                    <div class="info-title">Phone Number</div>
                    <div class="info-detail">
                        <a href="tel:+97701XXXXXXXX">+977-01-XXXXXXX</a><br/>
                        Mon–Sat, 10am–6pm
                    </div>
                </div>
            </div>
            <div class="info-card">
                <div class="info-icon">&#128140;</div>
                <div>
                    <div class="info-title">Email Address</div>
                    <div class="info-detail">
                        <a href="mailto:info@beautybajar.com">info@beautybajar.com</a><br/>
                        We reply within 24 hours
                    </div>
                </div>
            </div>
            <div class="info-card">
                <div class="info-icon">&#128241;</div>
                <div>
                    <div class="info-title">Follow Us</div>
                    <div class="info-detail">Stay updated on new arrivals</div>
                    <div class="social-row">
                        <a href="#" class="social-btn">&#128247;</a>
                        <a href="#" class="social-btn">&#128248;</a>
                        <a href="#" class="social-btn">&#127760;</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- RIGHT: Contact Form -->
        <div class="form-card">
            <h2>Send Us a Message</h2>
            <p>Fill in the form below and we'll get back to you as soon as possible.</p>

            <%-- Show success message --%>
            <% String success = (String) request.getAttribute("success");
        if (success != null) {%>
            <div class="msg-success">&#9989; <%= success%></div>
            <% } %>

            <%-- Show error message --%>
            <% String error = (String) request.getAttribute("error");
        if (error != null) {%>
            <div class="msg-error">&#9888; <%= error%></div>
            <% }%>

            <form action="${pageContext.request.contextPath}/contact" method="post" novalidate>

                <div class="form-row">
                    <div class="form-group">
                        <label>Full Name <span>*</span></label>
                        <input type="text" name="name" placeholder="Your full name"
                               value="<%= request.getAttribute("name") != null ? request.getAttribute("name") : ""%>"
                               required/>
                    </div>
                    <div class="form-group">
                        <label>Email Address <span>*</span></label>
                        <input type="email" name="email" placeholder="your@email.com"
                               value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : ""%>"
                               required/>
                    </div>
                </div>

                <div class="form-group">
                    <label>Subject <span>*</span></label>
                    <select name="subject">
                        <option value="">-- Select a subject --</option>
                        <option value="Order Inquiry"   <%= "Order Inquiry".equals(request.getAttribute("subject")) ? "selected" : ""%>>Order Inquiry</option>
                        <option value="Product Question"<%= "Product Question".equals(request.getAttribute("subject")) ? "selected" : ""%>>Product Question</option>
                        <option value="Return/Exchange" <%= "Return/Exchange".equals(request.getAttribute("subject")) ? "selected" : ""%>>Return / Exchange</option>
                        <option value="Delivery Issue"  <%= "Delivery Issue".equals(request.getAttribute("subject")) ? "selected" : ""%>>Delivery Issue</option>
                        <option value="General Enquiry" <%= "General Enquiry".equals(request.getAttribute("subject")) ? "selected" : ""%>>General Enquiry</option>
                        <option value="Other"           <%= "Other".equals(request.getAttribute("subject")) ? "selected" : ""%>>Other</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Message <span>*</span></label>
                    <textarea name="message" placeholder="Write your message here (minimum 10 characters)..." required><%= request.getAttribute("message") != null ? request.getAttribute("message") : ""%></textarea>
                </div>

                <button type="submit" class="btn-submit">Send Message &#8594;</button>

            </form>
        </div>
    </section>

    <!-- MAP -->
    <section class="map-section">
        <div class="map-box">
            <div class="map-icon">&#128205;</div>
            <p>Kathmandu, Nepal — We deliver to all 77 districts</p>
        </div>
    </section>

    <footer>
        <p>&copy; 2025 Beauty Bajar &nbsp;|&nbsp; Made with &#10084; in Nepal &nbsp;|&nbsp;
            <a href="${pageContext.request.contextPath}/about">About Us</a></p>
    </footer>

</body>
</html>

