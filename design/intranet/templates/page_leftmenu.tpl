{def $subscriptions=fetch( 'notification', 'subscribed_nodes' )
	$pages = array()
	$groups = array()
    $projects = array()
}

{foreach $subscriptions as $subscription}
	{if $subscription.node.object.content_class.name|eq('Folder')}
    	{set $pages = $pages|append($subscription)}
    {elseif $subscription.node.object.content_class.name|eq('Group')}
		{set $groups = $groups|append($subscription)}
    {/if}
{/foreach}


<div id="left">
	<div id="user">
    {def $current_user=fetch('user','current_user')}
		{if $current_user.is_logged_in}
		    {attribute_view_gui attribute=$current_user.contentobject.data_map.image image_class="profile"}
		{/if}	
        {*include uri='design:user.tpl'*}
    </div>
    <br />
    <br />
    
    <h3>My Pages ({$pages|count()})</h3>
	<ul id="pages-menu">    
	{foreach $pages as $page}
    	<li>
        	<a href={$page.node.url_alias|ezurl}><span class="menu-image">{attribute_view_gui attribute=$page.data_map.image image_class=menuitem}</span>{$page.node.name|wash}</a>
            
            {def $submenuitems = fetch('content','list', hash('parent_node_id', $page.node_id,
												'class_filter_type', 'include',
					                            'class_filter_array', array('folder')))}
		{if $submenuitems|count()|gt(0)}
        <ul class="sub-pages-menu">
        {foreach $submenuitems as $subitem}
            <li>
                <a href={$subitem.url_alias|ezurl}><span class="menu-image">{attribute_view_gui attribute=$subitem.data_map.image image_class=menuitem}</span>{$subitem.name|wash}</a>
            </li>
        {/foreach}
        </ul>
        {/if}
            
        </li>
    {/foreach}
    	<li>
        	<a href={"content/view/full/296"|ezurl}>All pages</a>
        </li>
        <li>
             <form method="post" action={"content/action"|ezurl}>
                        <input type="hidden" name="ClassIdentifier" value="folder" />
                        <input type="hidden" name="NodeID" value="296" />
                        <input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini')}" />
                        <input class="button new_comment" type="submit" name="NewButton" value="New page" />
                        </form>
        </li>
    </ul>
    <br />
    <br />
    
    <h3>My Groups ({$groups|count()})</h3>    
    <ul id="groups-menu">    
    	{foreach $groups as $group}
    	<li>
        	<a href={$group.node.url_alias|ezurl}><span class="menu-image">{attribute_view_gui attribute=$group.data_map.image image_class=menuitem}</span>{$group.node.name|wash}</a>
        </li>
        {/foreach}
        <li>
        	<a href={"content/view/full/297"|ezurl}>All groups</a>
        </li>
        <li>
        	<form method="post" action={"content/action"|ezurl}>
            <input type="hidden" name="ClassIdentifier" value="group" />
            <input type="hidden" name="NodeID" value="297" />
            <input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini')}" />
            <input class="button new_comment" type="submit" name="NewButton" value="Create group" />
            </form>
        </li>
    </ul>
</div>
