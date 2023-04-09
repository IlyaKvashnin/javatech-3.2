<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.nio.file.Files,java.io.File" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Main</title>
</head>
<body>
<p>${dateTime}</p>

<table>
    <thead>
    <tr>
        <th>File</th>
        <th>Size</th>
        <th>Date</th>
    </tr>
    </thead>
    <tbody>
    <form action="./files" method="get">
        <c:forEach var="directory" items ="${directories}">
            <tr>
                <td>
                    <button type="submit" name="path" value="${directory.getAbsolutePath()}">
                        <div>${directory.getName()}/</div>
                    </button>
                </td>
                <td></td>
                <td>
                    <div>${Files.getAttribute(directory.toPath(),"lastModifedTime").toString()}</div>
                </td>
            </tr>
        </c:forEach>
    </form>
    </tbody>
</table>
</body>
</html>