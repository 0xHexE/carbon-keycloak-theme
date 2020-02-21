<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>Welcome to ${productNameFull}</title>

    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <link rel="shortcut icon" href="welcome-content/favicon.ico" type="image/x-icon">
    <meta http-equiv="refresh" content="0; url=realms/master/account" />

    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
</head>

<body>
<div class="container-fluid">
  <div class="row">
	  <a href="realms/master/account" id="redirect-button">Click here to open account</a>
  </div>
</div>
</body>
</html>
