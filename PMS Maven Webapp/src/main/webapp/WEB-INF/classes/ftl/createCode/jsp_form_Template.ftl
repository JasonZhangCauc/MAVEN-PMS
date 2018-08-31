<table class="control-table">
	<#list fieldList as var>
	<tr>
	    <td class="control-label">
              <label><spring:message code='label.${objectNameLower}.${var.reColName}' />：</label>
              <span class="required">* </span>
            </td>
            <td>
                <input id="userAccount"
                	name="${var.reColName}" 
                   	data-rule="required;length[~100];"/>
            </td>
        </tr>
	</#list>
</table>