<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
    <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark navbar-static-top" role="navigation">
    <asset:image src="grails.svg" alt="Grails Logo"/>
    <div class="nav" role="navigation">
        <ul>
            <li>
                <g:link controller="hotel" action="search">${message(code: 'com.pool.hotel.button.search')}</g:link>
            </li>
            <li>
                <g:link controller="hotel" action="index">${message(code: 'com.pool.hotel.button.index')}</g:link>
            </li>
            <li>
                <g:link controller="country" action="index">${message(code: 'com.pool.country.button.index')}</g:link>
            </li>
        </ul>
    </div>
</nav>

<g:layoutBody/>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>
