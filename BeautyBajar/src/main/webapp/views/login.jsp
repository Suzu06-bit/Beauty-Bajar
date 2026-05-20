<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <jsp:include page="/templates/head.jsp">
        <jsp:param name="title" value="Login — Beauty Bajar"/>
    </jsp:include>

    <body>
        <div class="page">
            <jsp:include page="/templates/header.jsp"/>

            <main class="content">
                <div class="form-container">
                    <div class="form-title">
                        <span style="font-size:24px;"></span>
                        <h2>Welcome Back</h2>
                    </div>
                    <p class="form-subtitle">Login to your Beauty Bajar account</p>

                    <div class="form-card">
                        <% if (request.getAttribute("error") != null) { %>
                        <div class="msg-error">&#9888; <%= request.getAttribute("error") %></div>
                        <% } %>

                        <form action="${pageContext.request.contextPath}/login" method="post">
                            <div class="form-group">
                                <label>Username <span>*</span></label>
                                <input type="text" name="username" placeholder="Enter your username" required/>
                            </div>
                            <div class="form-group">
                                <label>Password <span>*</span></label>
                                <input type="password" name="password" placeholder="Enter your password" required/>
                            </div>
                            <div class="form-actions">
                                <button type="submit" class="btn-submit">Login &#8594;</button>
                            </div>
                        </form>

                        <p class="form-link">
                            Don't have an account? <a href="${pageContext.request.contextPath}/register">Register here</a>
                        </p>
                    </div>
                </div>
            </main>

            <%@include file="/templates/footer.html" %>
        </div>
    </body>
</html>
