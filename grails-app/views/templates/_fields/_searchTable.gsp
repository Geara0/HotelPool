<div class="result-description"><g:message code="com.pool.search.resultNumber" args="[resultCount]"/></div>
<table>
    <thead>
    <tr>
        <g:each in="${columnProperties}" var="p">
        %{--            <g:sortableColumn property="${p.property}" title="${p.label}"/>--}%
            <th>${p.label}</th>
        </g:each>
    </tr>
    </thead>
    <tbody>
    <g:each in="${collection}" var="hotel" status="i">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td>${hotel.name}</td>
            <td>${hotel.country}</td>
            <td>
                <g:each in="${(1..hotel.stars)}">
                    <asset:image src="star-filled.png" alt="filled star"/>
                </g:each>
                <g:if test="${hotel.stars != 5}">
                    <g:each in="${(1..(5 - hotel.stars))}">
                        <asset:image src="star-empty.png" alt="empty star"/>
                    </g:each>
                </g:if>
            </td>
            <td>
                <a href="${hotel.link}" target="_blank">
                    ${hotel.link != null ? message(code: 'com.pool.redirect') : ""}
                </a>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>

<g:if test="${resultCount > 10}">
    <div class="pagination">
        <g:paginate controller="hotel" action="search" total="${resultCount}"/>
    </div>
</g:if>