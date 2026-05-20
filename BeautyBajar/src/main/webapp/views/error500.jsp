<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="/templates/head.jsp">
        <jsp:param name="title" value="Server Error — Beauty Bajar"/>
    </jsp:include>
    <body>
        <div class="page">
            <jsp:include page="/templates/header.jsp"/>
            <main class="content">
                <div class="error-page">
                    <div class="error-code">500</div>
                    <div class="error-msg">Internal Server Error</div>
                    <p class="error-sub">Something went wrong on our end. Please try again later.</p>
                    <a href="${pageContext.request.contextPath}/home" class="btn-primary">&#8592; Go to Home</a>
                </div>
            </main>
            <%@include file="/templates/footer.html" %>
        </div>
    </body>
</html>
