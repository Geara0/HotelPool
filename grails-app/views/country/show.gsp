<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'com.pool.country.label', default: 'Country')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-country" class="skip" tabindex="-1">
    <g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
</a>

<div class="container">
    <div id="show-country" class="content scaffold-show" role="main">
        <h1><g:message code="default.show.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <f:display bean="country" except="hotels"/>

        <g:form resource="${this.country}" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit" resource="${this.country}">
                    <g:message code="default.button.edit.label" default="Edit"/>
                </g:link>
                <input class="delete" type="submit"
                       value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                       onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </fieldset>
        </g:form>

        <div class="result-description">
            ${message(code: 'com.pool.hotel.hotels')}
        </div>
        <f:table collection="${hotels}" properties="['name', 'stars', 'link']" order="['stars']"/>
    </div>
</div>
</body>
</html>
