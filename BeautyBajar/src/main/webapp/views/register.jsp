<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <jsp:include page="/templates/head.jsp">
        <jsp:param name="title" value="Register — Beauty Bajar"/>
    </jsp:include>

    <body>
        <div class="page">
            <jsp:include page="/templates/header.jsp"/>

            <main class="content">
                <div class="form-container" style="max-width:560px;">
                    <div class="form-title">
                        <span style="font-size:24px;">&#128100;</span>
                        <h2>Create Account</h2>
                    </div>
                    <p class="form-subtitle">Join Beauty Bajar and start shopping</p>

                    <div class="form-card">
                        <% if (request.getAttribute("error") != null) { %>
                        <div class="msg-error">&#9888; <%= request.getAttribute("error") %></div>
                        <% } %>
                        <% if (request.getAttribute("success") != null) { %>
                        <div class="msg-success">&#9989; <%= request.getAttribute("success") %></div>
                        <% } %>

                        <form action="${pageContext.request.contextPath}/register" method="post">
                            <div class="form-row">
                                <div class="form-group">
                                    <label>Full Name <span>*</span></label>
                                    <input type="text" name="fullname" placeholder="Your full name"
                                           value="<%= request.getAttribute("fullname") != null ? request.getAttribute("fullname") : "" %>"
                                           required/>
                                </div>
                                <div class="form-group">
                                    <label>Username <span>*</span></label>
                                    <input type="text" name="username" placeholder="Choose a username"
                                           value="<%= request.getAttribute("username") != null ? request.getAttribute("username") : "" %>"
                                           required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Email Address <span>*</span></label>
                                <input type="email" name="email" placeholder="your@email.com"
                                       value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>"
                                       required/>
                            </div>
                            <div class="form-group">
                                <label>Phone Number <span>*</span></label>
                                <input type="text" name="phone" placeholder="98XXXXXXXX"
                                       value="<%= request.getAttribute("phone") != null ? request.getAttribute("phone") : "" %>"
                                       required/>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <input type="text" name="address" placeholder="Your delivery address"
                                       value="<%= request.getAttribute("address") != null ? request.getAttribute("address") : "" %>"/>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <label>Password <span>*</span></label>
                                    <input type="password" name="password" placeholder="Min. 6 characters" required/>
                                </div>
                                <div class="form-group">
                                    <label>Confirm Password <span>*</span></label>
                                    <input type="password" name="confirmPassword" placeholder="Repeat password" required/>
                                </div>
                            </div>
                            <div class="form-actions">
                                <button type="submit" class="btn-submit">Create Account &#8594;</button>
                            </div>
                        </form>

                        <p class="form-link">
                            Already have an account? <a href="${pageContext.request.contextPath}/login">Login here</a>
                        </p>
                    </div>
                </div>
            </main>

            <%@include file="/templates/footer.html" %>
        </div>
    </body>
</html>
