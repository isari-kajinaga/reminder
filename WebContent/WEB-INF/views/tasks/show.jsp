<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${task != null}">
                <h2>id : ${task.id} のタスク詳細ページ</h2>

                 <table>
                    <tbody>
                        <tr>
                            <th>タスクの内容</th>
                            <td><c:out value="${task.content}" /></td>
                        </tr>
                        <tr>
                            <th>期限</th>
                            <fmt:parseDate value="${task.deadline}" pattern="yyyy-MM-dd" var="day" type="date" />
                            <fmt:parseDate value="${task.deadline_time}"  var="time" type="time"  timeStyle="short" />
                            <td>
                                <fmt:formatDate value='${day}' pattern='yyyy-MM-dd' />
                                <fmt:formatDate value='${time}'  type='time' timeStyle='short'  />
                            </td>
                        </tr>
                        <tr>
                            <th>作成日時</th>
                            <td><fmt:formatDate value="${task.created_at}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                        <tr>
                            <th>更新日時</th>
                            <td><fmt:formatDate value="${task.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                    </tbody>
                </table>

                <p><a href="${pageContext.request.contextPath}/index">一覧に戻る</a></p>
                <p><a href="${pageContext.request.contextPath}/edit?id=${task.id}">このタスクの内容を編集する</a></p>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした</h2>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>
