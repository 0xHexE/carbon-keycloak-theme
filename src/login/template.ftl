<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayWide=false>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
            "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="robots" content="noindex, nofollow">

        <#if properties.meta?has_content>
            <#list properties.meta?split(' ') as meta>
                <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
            </#list>
        </#if>

        <title>${msg("loginTitle", (realm.displayName!''))}</title>

        <link rel="icon" href="${url.resourcesPath}/img/favicon.ico"/>

        <#if properties.styles?has_content>
            <#list properties.styles?split(' ') as style>
                <link href="${url.resourcesPath}/${style}" rel="stylesheet"/>
            </#list>
        </#if>

        <#if properties.scripts?has_content>
            <#list properties.scripts?split(' ') as script>
                <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
            </#list>
        </#if>

        <#if scripts??>
            <#list scripts as script>
                <script src="${script}" type="text/javascript"></script>
            </#list>
        </#if>
    </head>

    <body class="${properties.kcBodyClass!}">
    <header aria-label="Header" class="bx--header bx--header--website" role="banner">
        <a class="bx--skip-to-content"
           href="#main-content"
           tabindex="0">
            Skip to main content
        </a>
        <a class="bx--header__name" href="/">
            ${kcSanitize(msg("loginTitleHtml",(realm.displayNameHtml!'')))?no_esc}
        </a>
    </header>

    <div class="${properties.kcLoginClass!} bx--content" id="main-content">
        <div class="${properties.kcFormCardClass!} form-card bx--tile <#if displayWide>${properties.kcFormCardAccountClass!} bx--wide</#if>">
            <header class="${properties.kcFormHeaderClass!}">
                <h1 id="kc-page-title" class="page-title"><#nested "header"></h1>
            </header>
            <div id="kc-content">
                <div id="kc-content-wrapper">

                    <#if displayMessage && message?has_content>
                        <div class="alert alert-${message.type}">
                            <#if message.type = 'success'><span
                                class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                            <#if message.type = 'warning'><span
                                class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                            <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                            <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                            <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
                        </div>
                    </#if>

                    <#nested "form">

                    <#if displayInfo>
                        <div id="kc-info" class="${properties.kcSignUpClass!}">
                            <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                                <#nested "info">
                            </div>
                        </div>
                    </#if>
                </div>
            </div>
        </div>
    </div>
    <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
        <div class="FixedLanguageSelect">
            <span class="FillFlex"></span>
            <div class="bx--select">
                <label for="select-id" class="bx--label">Select language</label>
                <div class="bx--select-input__wrapper">
                    <select id="select-id" class="bx--select-input" onchange="window.location = this.value" >
                        <#list locale.supported as l>
                            <option class="bx--select-option"value="${ l.url }" <#if locale.current == l.label>selected</#if>>
                                ${l.label}
                            </option>
                        </#list>
                    </select>
                    <svg focusable="false" preserveAspectRatio="xMidYMid meet" style="will-change: transform;"
                         xmlns="http://www.w3.org/2000/svg" class="bx--select__arrow" width="10" height="6"
                         viewBox="0 0 10 6" aria-hidden="true">
                        <path d="M5 6L0 1 .7.3 5 4.6 9.3.3l.7.7z"></path>
                    </svg>
                </div>
            </div>
        </div>
    </#if>
    </body>
    </html>
</#macro>
