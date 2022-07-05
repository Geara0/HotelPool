<div class="fieldcontain required-indicator">
    <label for="country">Country</label>
    <g:select name="country" from="${com.pool.Country.all}" optionValue="name" optionKey="id" value="${country?.name}"/>
</div>