<div class="fieldcontain required">
    <label for="country">${message(code: 'com.pool.country.label')}</label>
    <g:select name="country" from="${com.pool.Country.all}" optionValue="name" optionKey="id" value="${country?.name}"/>
</div>