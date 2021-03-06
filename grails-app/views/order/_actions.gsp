<g:if test="${orderInstance?.id }">
	<span id="shipment-action-menu" class="action-menu">
		<button class="action-btn">
			<img src="${resource(dir: 'images/icons/silk', file: 'bullet_arrow_down.png')}" />
		</button>
		
		<g:if test="${orderInstance?.isReceived() }">
			<g:render template="/order/actionsReceived" model="[orderInstance:orderInstance,hideDelete:hideDelete]"/>
		</g:if>
		<g:elseif test="${orderInstance?.isPlaced() }">
			<g:render template="/order/actionsPlaced" model="[orderInstance:orderInstance,hideDelete:hideDelete]"/>
		</g:elseif>
		<g:elseif test="${orderInstance?.isPending() }">
			<g:render template="/order/actionsPending" model="[orderInstance:orderInstance,hideDelete:hideDelete]"/>
		</g:elseif>
		<g:else>
			<div class="actions" style="min-width: 200px;">
				<div class="action-menu-item">
					<warehouse:message code="default.unknownState.label"/>
				</div>
			</div>
		</g:else>
	</span>
</g:if>