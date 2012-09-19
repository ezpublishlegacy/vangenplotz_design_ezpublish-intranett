<h2>All pages</h2>

{def $pages = fetch( 'content', 'tree', hash( 'parent_node_id', 296,
											  'class_filter_type', 'include',
                                              'class_filter_array', array('folder') ) )}

{foreach $pages as $page}	
<div class="page">	
    <div class="add-notification">
        {def $notification_access=fetch( 'user', 'has_access_to', hash( 'module', 'notification', 'function', 'addtonotification' ) )}            
            {if $notification_access }			
        <form method="post" action={'/content/action'|ezurl}>
            <input type="hidden" name="ContentNodeID" value="{$page.node_id}" />
            <input type="submit" name="ActionAddToNotification" value="Keep me updated" />
        </form>
    </div>
    <div class="page-name">
	    {$page.name|wash}
    </div>    
</div>
{/foreach}