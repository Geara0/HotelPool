    <table>
        <thead>
        <tr>
            <g:each in="${columnProperties}" var="p">
                <g:sortableColumn property="${p.property}" title="${p.label}"/>
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
                <td>
                    <g:form id="${hotel.id}" method="DELETE" class="buttons-form">
                        <fieldset class="custom-buttons">
                            <g:link action="edit" class="edit"
                                    id="${hotel.id}">${message(code: 'default.button.edit.label')}</g:link>
                            <g:actionSubmit value="${message(code: 'default.button.delete.label')}" class="delete"
                                            action="delete"
                                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message')}')"/>
                        </fieldset>
                    </g:form>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>