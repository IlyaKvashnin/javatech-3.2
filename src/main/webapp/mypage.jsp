<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.nio.file.Files,java.io.File" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Main</title>
</head>
<body>

<p>${dateTime}</p>
<h1>${path}</h1>
<hr>

<table>
    <thead>
    <tr>
        <th>File</th>
        <th>Size</th>
        <th>Date</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach var="directory" items ="${directories}">
        <tr>
            <td>
                <div>
                    <img src='<c:url value="${pageContext.request.contextPath}/images/folder.png"></c:url>' style="height:20px;width:20px"/>
                    <a href="files?path=${directory.getAbsolutePath().replace('/','%2F')}">${directory.getName()}</a>
                </div>
            </td>
            <td>
                <div>

                </div>
            </td>
            <td>
                <div>${Files.getAttribute(directory.toPath(),"lastModifiedTime").toString()}</div>
            </td>
        </tr>
    </c:forEach>

    <c:forEach var="file" items="${files}">
        <tr>
            <td>
                <div>
                    <img src='<c:url value="${pageContext.request.contextPath}/images/file.png"></c:url>' style="height:20px;width:20px"/>
                    ${file.getPath()}
                </div>
            </td>
            <td>
                <div>${Files.size(file.toPath())}</div>
            </td>
            <td>
                <div>${Files.getAttribute(file.toPath(), "lastModifiedTime").toString()}</div>
            </td>
        </tr>
    </c:forEach>

    </tbody>
</table>
</body>
</html>