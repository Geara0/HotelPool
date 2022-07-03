<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'com.pool.hotel.label', default: 'Hotel')}"/>
    <title class="default-label"><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-hotel" class="skip" tabindex="-1">
    <g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
</a>

<div class="buttons" role="navigation">
    <ul>
        <li>
            <g:link class="create" action="create">
                <g:message code="default.new.label" args="[entityName]"/>
            </g:link>
        </li>
    </ul>
</div>

<div id="list-hotel" class="content scaffold-list" role="main">
    <div class="result-description"><h1><g:message code="default.list.label" args="[entityName]"/></h1></div>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <f:table template="hotelTable" collection="${hotelList}"/>
</div>
</body>
</html>