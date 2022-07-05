<table>
    <thead>
    <tr>
        <g:each in="${columnProperties}" var="p">
            <g:if test="${p.label != 'Hotels'}">
                <g:sortableColumn property="${p.property}" title="${p.label}"/>
            </g:if>
            <g:else>
                <th>${p.label}</th>
            </g:else>
        </g:each>
    </tr>
    </thead>
    <tbody>
    <g:each in="${collection}" var="country" status="i">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td>${country.name}</td>
            <td>${country.capital}</td>
            <td>
                <ul class="scrollable">
                    <g:each action="index" in="${hotelsMap[country.name]}" var="hotel">
                        <li>${hotel.name}</li>
                    </g:each>
                </ul>
            </td>
            <td class="buttons-column">
                <g:form id="${country.id}" method="DELETE" class="buttons-form">
                    <fieldset class="custom-buttons">
                        <g:link action="edit" class="edit"
                                id="${country.id}">${message(code: 'default.button.edit.label')}</g:link>
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