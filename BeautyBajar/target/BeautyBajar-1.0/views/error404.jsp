<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="/templates/head.jsp">
        <jsp:param name="title" value="Page Not Found — Beauty Bajar"/>
    </jsp:include>
    <body>
        <div class="page">
            <jsp:include page="/templates/header.jsp"/>
            <main class="content">
                <div class="error-page">
                    <div class="error-code">404</div>
                    <div class="error-msg">Page Not Found</div>
                    <p class="error-sub">The page you are looking for does not exist.</p>
                    <a href="${pageContext.request.contextPath}/home" class="btn-primary">&#8592; Go to Home</a>
                </div>
            </main>
            <%@include file="/templates/footer.html" %>
        </div>
    </body>
</html>
