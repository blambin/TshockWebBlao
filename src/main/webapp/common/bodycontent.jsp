<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tsweb" %>
<tsweb:base></tsweb:base>
<!DOCTYPE html  >
<html>
<body>
  <div>
      <c:choose>
          <c:when test="${ param.contentid == 1}">
              <jsp:include page="addserver.jsp"></jsp:include>
          </c:when>
           <c:when test="${ param.contentid == 2}">
              <jsp:include page="serverdetail.jsp"></jsp:include>
          </c:when>
           <c:when test="${ param.contentid == 3}">
              <jsp:include page="serverbasecommand.jsp"></jsp:include>
          </c:when>
          <c:otherwise>
                                         请点击左边添加服务器
          </c:otherwise>
      </c:choose>
  </div>
</body>
</html>