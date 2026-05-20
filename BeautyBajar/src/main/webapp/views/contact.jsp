<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <jsp:include page="/templates/head.jsp">
        <jsp:param name="title" value="Contact Us — Beauty Bajar"/>
    </jsp:include>

    <body>
        <div class="page">
            <jsp:include page="/templates/header.jsp"/>

            <jsp:include page="/templates/nav.jsp">
                <jsp:param name="back_title" value="Home"/>
                <jsp:param name="back_href" value="${pageContext.request.contextPath}/home"/>
                <jsp:param name="page_title" value="Contact Us"/>
                <jsp:param name="action_title" value=""/>
                <jsp:param name="action_href" value=""/>
            </jsp:include>

            <!-- HERO -->
            <section class="contact-hero">
                <span class="tag">&#10022; Get In Touch</span>
                <h1>Contact <em>Beauty Bajar</em></h1>
                <p>Have a question? We'd love to hear from you. Send us a message and we'll respond within 24 hours.</p>
            </section>

            <!-- MAIN -->
            <section class="contact-main">
                <!-- LEFT: Contact Info -->
                <div class="contact-info">
                    <div class="info-card">
                        <div class="info-icon">&#128205;</div>
                        <div>
                            <div class="info-title">Our Location</div>
                            <div class="info-detail">Pokhara, Gandaki Province<br/>Nepal</div>
                        </div>
                    </div>
                    <div class="info-card">
                        <div class="info-icon">&#128222;</div>
                        <div>
                            <div class="info-title">Phone Number</div>
                            <div class="info-detail">
                                <a href="tel:+97701XXXXXXX">+977-01-XXXXXXX</a><br/>
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
                                <a href="#" class="social-btn"><i class="fab fa-facebook-f"></i></a>
                                <a href="#" class="social-btn"><i class="fab fa-instagram"></i></a>
                                <a href="#" class="social-btn"><i class="fab fa-tiktok"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- RIGHT: Contact Form -->
                <div class="contact-form-col">
                    <h2>Send Us a Message</h2>
                    <p>Fill in the form below and we'll get back to you as soon as possible.</p>

                    <% if (request.getAttribute("success") != null) {%>
                    <div class="msg-success">&#9989; <%= request.getAttribute("success")%></div>
                    <% } %>
                    <% if (request.getAttribute("error") != null) {%>
                    <div class="msg-error">&#9888; <%= request.getAttribute("error")%></div>
                    <% }%>

                    <form action="${pageContext.request.contextPath}/contact" method="post">
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
                            <textarea name="message" placeholder="Write your message here..." required><%= request.getAttribute("message") != null ? request.getAttribute("message") : ""%></textarea>
                        </div>
                        <button type="submit" class="btn-submit">Send Message &#8594;</button>
                    </form>
                </div>
            </section>

            <%@include file="/templates/footer.html" %>
        </div>
    </body>
</html>
