<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'com.pool.hotel.label', default: 'Hotel')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <g:javascript library="prototype"/>
</head>

<body>
<g:form class="search-box" name="searchForm" action="searchResult" method="GET">
    <g:textField name="hotelField" placeholder="${message(code: 'com.pool.search.hotelField.placeholder')}"/>
    <g:select name="countrySelector" from="${countryList}"/>
    <g:actionSubmit class="submit" name="searchButton" value="${message(code: 'com.pool.search.button.search')}"
                    action="search"/>
</g:form>
<g:if test="${searchResult != null}">
    <f:table collection="${searchResult}" template="searchTable"/>
</g:if>
<g:else>
    <div class="result-description">
        ${message(code: 'com.pool.notfound.label')}
    </div>
</g:else>
</body>
</html>