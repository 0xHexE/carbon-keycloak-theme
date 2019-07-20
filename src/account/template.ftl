<#macro mainLayout active bodyClass>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="robots" content="noindex, nofollow">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>${ realm.displayName } Accounts</title>
        <link rel="icon" href="${url.resourcesPath}/img/favicon.ico">
        <#if properties.styles?has_content>
            <#list properties.styles?split(' ') as style>
                <link href="${url.resourcesPath}/${style}" rel="stylesheet"/>
            </#list>
        </#if>
        <#if properties.scripts?has_content>
            <#list properties.scripts?split(' ') as script>
                <script type="text/javascript" src="${url.resourcesPath}/${script}"></script>
            </#list>
        </#if>

        <script>
            window.f4erp = window.f4erp || {};
            window.f4erp.user = window.f4erp.user || {};
            window.f4erp.user.email = '${(account.email!'')}';
            window.f4erp.user.firstName = '${(account.firstName!'')}';
            window.f4erp.user.lastName = '${(account.lastName!'')}';
            window.f4erp.user.username = '${(account.username!'')}';
        </script>

    </head>
    <body class="admin-console user ${bodyClass}">

    <header aria-label="Header" class="bx--header bx--header--website" role="banner">
        <a class="bx--skip-to-content"
           href="#main-content"
           tabindex="0">
            Skip to main content
        </a>
        <button aria-label="Open menu"
                class="bx--header__action--menu bx--header__action bx--header__menu-trigger bx--header__menu-toggle bx--header__menu-toggle__hidden"
                onclick="toggleMenu()"
                title="Open menu" type="button">
            <svg focusable="false" preserveAspectRatio="xMidYMid meet" style="will-change: transform;"
                 xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" aria-hidden="true">
                <path d="M2 14.8h16V16H2zm0-3.6h16v1.2H2zm0-3.6h16v1.2H2zM2 4h16v1.2H2z"></path>
            </svg>
        </button>
        <a class="bx--header__name" href="/">${ realm.displayName }&nbsp;<span>Accounts</span></a>
        <div class="bx--header__global">
            <#if referrer?has_content && referrer.url?has_content>
                <button role="button" onclick="window.location = '${referrer.url}'"
                        title="${msg("backTo",referrer.name)}"
                        aria-label="${msg("backTo",referrer.name)}" class="bx--header__action" type="button">
                    <svg focusable="false" preserveAspectRatio="xMidYMid meet" style="will-change: transform;"
                         xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20"
                         aria-hidden="true">
                        <path d="M15.5 15.5H18V18h-2.5zm-6.75 0h2.5V18h-2.5zM2 15.5h2.5V18H2zm13.5-6.75H18v2.5h-2.5zm-6.75 0h2.5v2.5h-2.5zM2 8.75h2.5v2.5H2zM15.5 2H18v2.5h-2.5zM8.75 2h2.5v2.5h-2.5zM2 2h2.5v2.5H2z"></path>
                    </svg>
                </button>
            </#if>
            <button aria-label="Logout" class="bx--header__action" type="button"
                    onclick="window.location = '${url.logoutUrl?esc}'">
                <svg focusable="false" preserveAspectRatio="xMidYMid meet" style="will-change: transform;"
                     xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 32 32" aria-hidden="true">
                    <path d="M6 30h12a2.002 2.002 0 0 0 2-2v-3h-2v3H6V4h12v3h2V4a2.002 2.002 0 0 0-2-2H6a2.002 2.002 0 0 0-2 2v24a2.002 2.002 0 0 0 2 2z"></path>
                    <path d="M20.586 20.586L24.172 17H10v-2h14.172l-3.586-3.586L22 10l6 6-6 6-1.414-1.414z"></path>
                </svg>
            </button>
        </div>
    </header>

    <nav class="bx--side-nav__navigation bx--side-nav SideBar" aria-label="Side navigation" id="sideNavigation">
        <script>
            var mediaQueryList = window.matchMedia('(max-width: 66rem)');
            if (mediaQueryList.matches) {
                document.getElementById('sideNavigation').classList.remove('bx--side-nav--expanded');
            } else {
                document.getElementById('sideNavigation').classList.add('bx--side-nav--expanded');
            }
        </script>
        <ul class="bx--side-nav__items">
            <li class="bx--side-nav__item">
                <a class="bx--side-nav__link <#if active=='applications'>active</#if>" href="${url.applicationsUrl}"
                   <#if active=='applications'>aria-current="page"</#if>>
                    <span class="bx--side-nav__link-text">${msg("applications")}</span>
                </a>
            </li>
            <li class="bx--side-nav__item">
                <a class="bx--side-nav__link <#if active=='account'>active</#if>" href="${url.accountUrl}"
                   <#if active=='account'>aria-current="page"</#if>>
                    <span class="bx--side-nav__link-text">${msg("account")}</span>
                </a>
            </li>
            <#if features.passwordUpdateSupported>
                <li class="bx--side-nav__item">
                    <a class="bx--side-nav__link <#if active=='password'>active</#if>" href="${url.passwordUrl}"
                       <#if active=='password'>aria-current="page"</#if>>
                        <span class="bx--side-nav__link-text">${msg("password")}</span>
                    </a>
                </li>
            </#if>
            <li class="bx--side-nav__item">
                <a class="bx--side-nav__link <#if active=='totp'>active</#if>" href="${url.totpUrl}"
                   <#if active=='totp'>aria-current="page"</#if>>
                    <span class="bx--side-nav__link-text">${msg("authenticator")}</span>
                </a>
            </li>
            <#if features.identityFederation>
                <li class="bx--side-nav__item">
                    <a href="${url.socialUrl}" class="bx--side-nav__link <#if active=='social'>active</#if>"
                       <#if active=='social'>aria-current="page"</#if>>
                        <span class="bx--side-nav__link-text">${msg("federatedIdentity")}</span>
                    </a>
                </li>
            </#if>
            <li class="bx--side-nav__item">
                <a class="bx--side-nav__link <#if active=='sessions'>active</#if>" href="${url.sessionsUrl}"
                   <#if active=='sessions'>aria-current="page"</#if>>
                    <span class="bx--side-nav__link-text">${msg("sessions")}</span>
                </a>
            </li>
            <#if features.log>
                <li class="bx--side-nav__item">
                    <a class="bx--side-nav__link <#if active=='log'>active</#if>" href="${url.logUrl}"
                       <#if active=='log'>aria-current="page"</#if>>
                        <span class="bx--side-nav__link-text">${msg("log")}</span>
                    </a>
                </li>
            </#if>
            <#if realm.userManagedAccessAllowed && features.authorization>
                <li class="bx--side-nav__item">
                    <a class="bx--side-nav__link <#if active=='authorization'>active</#if>" href="${url.resourceUrl}" <#if active=='authorization'>aria-current="page"</#if>>
                        <span class="bx--side-nav__link-text">${msg("myResources")}</span>
                    </a>
                </li>
            </#if>
        </ul>
    </nav>

    <#if message?has_content>

        <div data-notification
             id="notificationSnackbar"
             class="bx--inline-notification <#if message.type=='success' >bx--inline-notification--success</#if> <#if message.type=='error' >bx--inline-notification--error</#if> FixedNotification"
             role="alert">
            <div class="bx--inline-notification__details">
                <svg focusable="false" preserveAspectRatio="xMidYMid meet" style="will-change: transform;"
                     xmlns="http://www.w3.org/2000/svg" class="bx--inline-notification__icon" width="20" height="20"
                     viewBox="0 0 20 20" aria-hidden="true">
                    <path d="M10 1c-5 0-9 4-9 9s4 9 9 9 9-4 9-9-4-9-9-9zm3.5 13.5l-8-8 1-1 8 8-1 1z"></path>
                    <path d="M13.5 14.5l-8-8 1-1 8 8-1 1z" data-icon-path="inner-path" opacity="0"></path>
                </svg>
                <div class="bx--inline-notification__text-wrapper">
                    <p class="bx--inline-notification__title">${kcSanitize(message.summary)?no_esc}</p>
                </div>
            </div>
            <button data-notification-btn class="bx--inline-notification__close-button" type="button" aria-label="close"
                    onclick="document.getElementById('notificationSnackbar').style.display = 'none'">
                <svg focusable="false" preserveAspectRatio="xMidYMid meet" style="will-change: transform;"
                     xmlns="http://www.w3.org/2000/svg" class="bx--inline-notification__close-icon" width="16"
                     height="16" viewBox="0 0 16 16" aria-hidden="true">
                    <path d="M12 4.7l-.7-.7L8 7.3 4.7 4l-.7.7L7.3 8 4 11.3l.7.7L8 8.7l3.3 3.3.7-.7L8.7 8z"></path>
                </svg>
            </button>
        </div>
    </#if>

    <div class="bx--content" id="main-content">

        <noscript>
            This site require javascript
        </noscript>

        <#nested "content">
    </div>

    <#--    <aside class="bx--side-nav">-->



    <#--        <div class="bx-container">-->

    <#--        </div>-->

    <#--&lt;#&ndash;        <header class="navbar navbar-default navbar-pf navbar-main header">&ndash;&gt;-->
    <#--&lt;#&ndash;            <nav class="navbar" role="navigation">&ndash;&gt;-->
    <#--&lt;#&ndash;                <div class="navbar-header">&ndash;&gt;-->
    <#--&lt;#&ndash;                    <div class="container">&ndash;&gt;-->
    <#--&lt;#&ndash;                        <h1 class="navbar-title">Keycloak</h1>&ndash;&gt;-->
    <#--&lt;#&ndash;                    </div>&ndash;&gt;-->
    <#--&lt;#&ndash;                </div>&ndash;&gt;-->
    <#--&lt;#&ndash;                <div class="navbar-collapse navbar-collapse-1">&ndash;&gt;-->
    <#--&lt;#&ndash;                    <div class="container">&ndash;&gt;-->
    <#--&lt;#&ndash;                        <ul class="nav navbar-nav navbar-utility">&ndash;&gt;-->
    <#--&lt;#&ndash;                            <#if realm.internationalizationEnabled>&ndash;&gt;-->
    <#--&lt;#&ndash;                            <li>&ndash;&gt;-->
    <#--&lt;#&ndash;                                <div class="kc-dropdown" id="kc-locale-dropdown">&ndash;&gt;-->
    <#--&lt;#&ndash;                                    <a href="#" id="kc-current-locale-link">${locale.current}</a>&ndash;&gt;-->
    <#--&lt;#&ndash;                                    <ul>&ndash;&gt;-->
    <#--&lt;#&ndash;                                        <#list locale.supported as l>&ndash;&gt;-->
    <#--&lt;#&ndash;                                            <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li>&ndash;&gt;-->
    <#--&lt;#&ndash;                                        </#list>&ndash;&gt;-->
    <#--&lt;#&ndash;                                    </ul>&ndash;&gt;-->
    <#--&lt;#&ndash;                                </div>&ndash;&gt;-->
    <#--&lt;#&ndash;                            <li>&ndash;&gt;-->
    <#--&lt;#&ndash;                                </#if>&ndash;&gt;-->
    <#--&lt;#&ndash;                                <#if referrer?has_content && referrer.url?has_content>&ndash;&gt;-->
    <#--                            <li><a href="${referrer.url}" id="referrer">${msg("backTo",referrer.name)}</a></li></#if>-->
    <#--&lt;#&ndash;                            <li><a href="${url.logoutUrl}">${msg("doSignOut")}</a></li>&ndash;&gt;-->
    <#--&lt;#&ndash;                        </ul>&ndash;&gt;-->
    <#--&lt;#&ndash;                    </div>&ndash;&gt;-->
    <#--&lt;#&ndash;                </div>&ndash;&gt;-->
    <#--&lt;#&ndash;            </nav>&ndash;&gt;-->
    <#--&lt;#&ndash;        </header>&ndash;&gt;-->

    <#--        <div class="container">-->
    <#--&lt;#&ndash;            <div class="bs-sidebar col-sm-3">&ndash;&gt;-->
    <#--&lt;#&ndash;                <ul>&ndash;&gt;-->
<#--    <li class="<#if active=='account'>active</#if>">-->
<#--        <a href="${url.accountUrl}">${msg("account")}</a>-->
<#--    </li>-->
<#--    <#if features.passwordUpdateSupported>-->
<#--        <li class="<#if active=='password'>active</#if>">-->
<#--            <a href="${url.passwordUrl}">${msg("password")}</a>-->
<#--        </li>-->
<#--    </#if>-->
<#--    <li class="<#if active=='totp'>active</#if>">-->
<#--        <a href="${url.totpUrl}">${msg("authenticator")}</a>-->
<#--    </li>-->
<#--    <#if features.identityFederation>-->
<#--        <li class="<#if active=='social'>active</#if>">-->
<#--            <a href="${url.socialUrl}">${msg("federatedIdentity")}</a>-->
<#--        </li>-->
<#--    </#if>-->
<#--    <li class="<#if active=='sessions'>active</#if>">-->
<#--        <a href="${url.sessionsUrl}">${msg("sessions")}</a>-->
<#--    </li>-->
<#--    <li class="<#if active=='applications'>active</#if>">-->
<#--        <a href="${url.applicationsUrl}">${msg("applications")}</a>-->
<#--    </li>-->
<#--    <#if features.log>-->
<#--        <li class="<#if active=='log'>active</#if>">-->
<#--            <a href="${url.logUrl}">${msg("log")}</a>-->
<#--        </li>-->
<#--    </#if>-->
<#--    <#if realm.userManagedAccessAllowed && features.authorization>-->
<#--        <li class="<#if active=='authorization'>active</#if>">-->
<#--            <a href="${url.resourceUrl}">${msg("myResources")}</a>-->
<#--        </li>-->
<#--    </#if>-->
<#--    &lt;#&ndash;&lt;#&ndash;                </ul>&ndash;&gt;&ndash;&gt;-->
<#--    &lt;#&ndash;&lt;#&ndash;            </div>&ndash;&gt;&ndash;&gt;-->

<#--    &lt;#&ndash;            <div class="col-sm-9 content-area">&ndash;&gt;-->
<#--    <#if message?has_content>-->
<#--        <div class="alert alert-${message.type}">-->
<#--            <#if message.type=='success' ><span class="pficon pficon-ok"></span></#if>-->
<#--            <#if message.type=='error' ><span class="pficon pficon-error-octagon"></span><span-->
<#--                    class="pficon pficon-error-exclamation"></span></#if>-->
<#--            ${kcSanitize(message.summary)?no_esc}-->
<#--        </div>-->
<#--    </#if>-->

    <#--                <div class="bx--content">-->

    <#--                </div>-->
    <#--            </div>-->
    <#--        </div>-->

    </body>
    </html>
</#macro>
