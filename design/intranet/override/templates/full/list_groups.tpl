<h2>All groups</h2>

{def $groups = fetch( 'content', 'tree', hash( 'parent_node_id', 297,
											  'class_filter_type', 'include',
                                              'class_filter_array', array('group') ) )}

{foreach $groups as $group}	
<div class="page">	
    <div class="add-notification">
        {def $notification_access=fetch( 'user', 'has_access_to', hash( 'module', 'notification', 'function', 'addtonotification' ) )}            
            {if $notification_access }			
        <form method="post" action={'/content/action'|ezurl}>
            <input type="hidden" name="ContentNodeID" value="{$group.node_id}" />
            <input type="submit" name="ActionAddToNotification" value="Keep me updated" />
        </form>
    </div>
    <div class="page-name">
	    {$group.name|wash}
    </div>    
</div>
{/foreach}