{* Article - Line view *}

<div class="content-view-line">
    <div class="class-article float-break">
    
    {section show=$node.data_map.image.has_content}
        <div class="attribute-image">
            {attribute_view_gui image_class=post href=$node.url_alias|ezurl attribute=$node.data_map.image}
        </div>
    {/section}

    <h2><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash}</a></h2>

    {section show=$node.data_map.intro.content.is_empty|not}
    <div class="attribute-short">
        {attribute_view_gui attribute=$node.data_map.intro}
    </div>
    {/section}

    </div>
    
{def $comments=fetch('content','list', hash('parent_node_id', $node.node_id,
											'class_type_array', 'include',
                                            'class_filter_array', array('comment')
										
))}

	{foreach $comments as $comment}
	<div class="comments">   		
        <div class="comment">
            <a class="author" href={$comment.object.owner.main_node.url_alias|ezurl}>{$comment.data_map.author.content}</a><br />
            <div class="comment-title">{$comment.name}</div>
            <div class="comment-message">{$comment.data_map.message.content}</div>
            <div class="comment-published">{$comment.object.published|l10n(datetime)}</div>
  		</div>        
    </div>
    {/foreach}
    <div class="new-comment">        
    	<form method="post" action={"content/action"|ezurl} name="comment-form" class="comment-form">
        <input type="hidden" name="ClassIdentifier" value="comment" />
        <input type="hidden" name="NodeID" value="{$node.object.main_node.node_id}" />
        <input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini')}" />
        <input type="hidden" name="RedirectURIAfterPublish" value="/content/view/full/{$node.parent_node_id}" />
        <input class="button new_comment" type="submit" name="NewButton" value="New comment" />        
        </form>
        </div>
{undef $comments}
</div>

