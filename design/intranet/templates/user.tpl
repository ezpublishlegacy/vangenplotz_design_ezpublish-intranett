{def $user=fetch( 'user', 'current_user' )}

<form action={concat("user/edit/",$user.contentobject_id)|ezurl} method="post" name="Edit">
<div class="user-profile">
    User:     {$user.contentobject.name} <br />
    E-mail:   {$user.email} <br />
    Username: {$user.login} <br />
    Group(s): {$user.groups|implode(', ')} <br />


{if fetch( 'user', 'has_access_to', hash( 'module', 'content',
                                          'function', 'edit' ) )}
<p><a href={"content/draft"|ezurl}>{"My drafts"|i18n("design/ezwebin/user/edit")}</a></p>
{/if}
{if fetch( 'user', 'has_access_to', hash( 'module', 'content',
                                          'function', 'pendinglist' ) )}
<p><a href={"/content/pendinglist"|ezurl}>{"My pending items"|i18n("design/ezwebin/user/edit")}</a></p>
{/if}
{if fetch( 'user', 'has_access_to', hash( 'module', 'notification',
                                          'function', 'use' ) )}
<p><a href={"notification/settings"|ezurl}>{"My notification settings"|i18n("design/ezwebin/user/edit")}</a></p>
{/if}
{if fetch( 'user', 'has_access_to', hash( 'module', 'shop',
                                          'function', 'buy' ) )}
<p><a href={"/shop/wishlist"|ezurl}>{"My wish list"|i18n("design/ezwebin/user/edit")}</a></p>
{/if}

<div class="buttonblock">
<input class="button" type="submit" name="EditButton" value="{'Edit profile'|i18n('design/ezwebin/user/edit')}" />
<input class="button" type="submit" name="ChangePasswordButton" value="{'Change password'|i18n('design/ezwebin/user/edit')}" />
</div>

</div>

</form>