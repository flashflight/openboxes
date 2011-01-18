<%@ page import="org.pih.warehouse.inventory.Warehouse" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${message(code: 'warehouse.label', default: 'Warehouse')}" />
        <g:set var="pageTitle" value="${message(code: 'default.list.label' args="[entityName]")}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><g:message code="default.list.label" args="[entityName]" /></content>
    </head>
    <body>        
        <div class="body">
        
        	<div class="nav">
				<g:render template="nav"/>        	
        	</div>
            <g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>                        
                            <g:sortableColumn property="name" title="${message(code: 'warehouse.name.label', default: 'Name')}" />
                            <th><g:message code="warehouse.locationType.label" default="Location Type" /></th>
                            <th><g:message code="warehouse.manager.label" default="Manager" /></th>
                            <th class="center"><g:message code="warehouse.active.label" default="Active?" /></th>
                            <th class="center"><g:message code="warehouse.local.label" default="Managed Locally?" /></th>
                            <th class="center"><g:message code="warehouse.edit.label" default="Edit" /></th>
                            <th class="center"><g:message code="warehouse.delete.label" default="Delete" /></th>
                            
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${warehouseInstanceList}" status="i" var="warehouseInstance">
						<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
							<td>
								<g:link action="edit" id="${warehouseInstance.id}">${fieldValue(bean: warehouseInstance, field: "name")}</g:link>
							</td>
                            <td>${fieldValue(bean: warehouseInstance, field: "locationType.name")}</td>                            
                            <td>${fieldValue(bean: warehouseInstance, field: "manager")}</td>                            
                            <td class="center tenth">${fieldValue(bean: warehouseInstance, field: "active")?'yes':'no'}</td>                            
                            <td class="center tenth">${fieldValue(bean: warehouseInstance, field: "local")?'yes':'no'}</td>                            
							<td class="center tenth"><g:link class="edit" action="edit" id="${warehouseInstance?.id}" >${message(code: 'default.button.edit.label', default: 'Edit')}</g:link></td>
							<td class="center tenth"><g:link class="delete" action="delete" id="${warehouseInstance?.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">${message(code: 'default.button.delete.label', default: 'Delete')}</g:link></td>                            

			

						</tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${warehouseInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
