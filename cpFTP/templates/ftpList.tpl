{include file="documentHeader"}
<head>
	<title>{lang}cp.index.title{/lang} - {PAGE_TITLE}</title>

	{include file='headInclude' sandbox=false}
</head>
<body{if $templateName|isset} id="tpl{$templateName|ucfirst}"{/if}>
{include file='header' sandbox=false}

<div id="main">

	<ul class="breadCrumbs">
		<li><a href="index.php{@SID_ARG_1ST}"><img alt="" src="{icon}wcpS.png{/icon}"> <span>{lang}cp.header.menu.start{/lang}</span></a> &raquo;</li>
	</ul>	
	
	<div class="mainHeadline">
		<img src="{icon}ftpL.png{/icon}" alt="" />
		<div class="headlineContainer">
			<h2>{lang}cp.ftp.list{/lang}</h2>
		</div>
	</div>

	<div class="contentHeader">
		{pages print=true assign=pagesLinks link="index.php?page=FTPList&pageNo=%d&sortField=$sortField&sortOrder=$sortOrder"|concat:SID_ARG_2ND_NOT_ENCODED}
		{if $this->user->ftpaccounts > $this->user->ftpaccountsUsed && $this->user->getPermission('cp.ftp.canAddFTPAccount')}
		<div class="largeButtons">
			<ul>
				<li><a href="index.php?form=FTPAdd{@SID_ARG_2ND}">
				<img title="{lang}cp.ftp.addAccount{/lang}" alt=""
					src="{icon}ftpAddM.png{/icon}" /> <span>{lang}cp.ftp.addAccount{/lang}</span> </a></li>
			</ul>
		</div>
		{/if}
	</div>
	
	{if $ftpAccounts|count}
	<div class="subTabMenu">
		<div class="containerHead"><h3>{lang}cp.ftp.list{/lang}</h3></div>
	</div>
	<div class="border tabMenuContent">
		<table class="tableList">
			<thead>
				<tr class="tableHead">
					<th class="columnFtpUserID"><div>{lang}cp.ftp.ftpUserID{/lang}</div></th>
					<th class="columnUsername{if $sortField == 'username'} active{/if}"><div><a href="index.php?page=FTPList&amp;pageNo={@$pageNo}&amp;sortField=username&amp;sortOrder={if $sortField == 'username' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{@SID_ARG_2ND}">{lang}cp.ftp.username{/lang}{if $sortField == 'username'} <img src="{icon}sort{@$sortOrder}S.png{/icon}" alt="" />{/if}</a></div></th>
					<th class="columnPath{if $sortField == 'path'} active{/if}"><div><a href="index.php?page=FTPList&amp;pageNo={@$pageNo}&amp;sortField=path&amp;sortOrder={if $sortField == 'path' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{@SID_ARG_2ND}">{lang}cp.ftp.path{/lang}{if $sortField == 'path'} <img src="{icon}sort{@$sortOrder}S.png{/icon}" alt="" />{/if}</a></div></th>
					<th class="columnLoginCount{if $sortField == 'loginCount'} active{/if}"><div><a href="index.php?page=FTPList&amp;pageNo={@$pageNo}&amp;sortField=loginCount&amp;sortOrder={if $sortField == 'loginCount' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{@SID_ARG_2ND}">{lang}cp.ftp.loginCount{/lang}{if $sortField == 'loginCount'} <img src="{icon}sort{@$sortOrder}S.png{/icon}" alt="" />{/if}</a></div></th>
					<th class="columnLastLogin{if $sortField == 'lastLogin'} active{/if}"><div><a href="index.php?page=FTPList&amp;pageNo={@$pageNo}&amp;sortField=lastLogin&amp;sortOrder={if $sortField == 'lastLogin' && $sortOrder == 'ASC'}DESC{else}ASC{/if}{@SID_ARG_2ND}">{lang}cp.ftp.lastLogin{/lang}{if $sortField == 'lastLogin'} <img src="{icon}sort{@$sortOrder}S.png{/icon}" alt="" />{/if}</a></div></th>

					{if $additionalColumnHeads|isset}{@$additionalColumnHeads}{/if}
				</tr>
			</thead>
			<tbody>
			{foreach from=$ftpAccounts item=ftpAccount}
				<tr class="{cycle values="container-1,container-2"}">
					<td class="columnFtpUserID columnID">{if $ftpAccount->undeleteable != 1 && $this->user->getPermission('cp.ftp.canDeleteFTPAccounts')}<a href="index.php?action=FTPDelete&amp;ftpUserID={@$ftpAccount->ftpUserID}{@SID_ARG_2ND}" onclick="return confirm(LANG_DELETE_CONFIRM);"><img src="{icon}deleteS.png{/icon}" alt="" title="{lang}cp.ftp.deleteAccount{/lang}" /></a>{else}<img src="{icon}deleteDisabledS.png{/icon}" alt="" title="{lang}cp.ftp.deleteAccount{/lang}" />{/if} {if $ftpAccount->loginEnabled == 'N'}<a href="index.php?action=FTPEnable&amp;ftpUserID={@$ftpAccount->ftpUserID}{@SID_ARG_2ND}"><img src="{icon}disabledS.png{/icon}" alt="" title="{lang}cp.ftp.disableAccount{/lang}" /></a>{else}<a href="index.php?action=FTPDisable&amp;ftpUserID={@$ftpAccount->ftpUserID}{@SID_ARG_2ND}"><img src="{icon}enabledS.png{/icon}" alt="" title="{lang}cp.ftp.enableAccount{/lang}" /></a>{/if}</td>
					<td class="columnUsername columnText"><a href="index.php?form=FTPEdit&amp;ftpUserID={@$ftpAccount->ftpUserID}{@SID_ARG_2ND}">{$ftpAccount->username}</a></td>
					<td class="columnHomedir columnText">{$ftpAccount->relativehomedir}</td>
					<td class="columnLoginCount columnText">{@$ftpAccount->loginCount}</td>
					<td class="columnLastLogin columnText">{@$ftpAccount->lastLogin|time}</td>

					{if $additionalColumns.$ftpAccount->ftpUserID|isset}{@$additionalColumns.$ftpAccount->ftpUserID}{/if}
				</tr>
			{/foreach}
			</tbody>
		</table>
	</div>

	<div class="contentFooter">
		{@$pagesLinks}
	</div>
	{/if}
</div>

{include file='footer' sandbox=false}

</body>
</html>