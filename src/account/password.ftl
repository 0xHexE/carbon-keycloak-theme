<#import "template.ftl" as layout>
<@layout.mainLayout active='password' bodyClass='password'; section>

    <h1 class="GreetingsMessage NoMargin">
        ${msg("changePasswordHtmlTitle")}
    </h1>

    <form action="${url.passwordUrl}" class="form-horizontal AccountForm" method="post">
        <input type="text" id="username" name="username"
               value="${(account.username!'')}"
               autocomplete="username"
               readonly="readonly" style="display:none;">

        <#if password.passwordSet>

            <div class="bx--form-item bx--text-input-wrapper">
                <label for="password" class="bx--label">${msg("password")}</label>
                <div class="bx--text-input__field-wrapper" ${messagesPerField.printIfExists('password','data-invalid')}>
                    <#if messagesPerField.exists('password')>
                        <svg focusable="false" preserveAspectRatio="xMidYMid meet" style="will-change: transform;"
                             xmlns="http://www.w3.org/2000/svg" class="bx--text-input__invalid-icon" width="16"
                             height="16"
                             viewBox="0 0 16 16" aria-hidden="true">
                            <path d="M8 1C4.2 1 1 4.2 1 8s3.2 7 7 7 7-3.1 7-7-3.1-7-7-7zm-.5 3h1v5h-1V4zm.5 8.2c-.4 0-.8-.4-.8-.8s.3-.8.8-.8c.4 0 .8.4.8.8s-.4.8-.8.8z"></path>
                            <path d="M7.5 4h1v5h-1V4zm.5 8.2c-.4 0-.8-.4-.8-.8s.3-.8.8-.8c.4 0 .8.4.8.8s-.4.8-.8.8z"
                                  data-icon-path="inner-path" opacity="0"></path>
                        </svg>
                    </#if>
                    <input id="password"
                           class="bx--text-input ${ messagesPerField.printIfExists('password', 'bx--text-input--invalid') }"
                           type="password"
                           placeholder="${ msg('password') }"
                           name="password"
                           autocomplete="current-password"
                           value="${(account.password!'')}">
                </div>
                <#if messagesPerField.exists('password')>
                    <div class="bx--form-requirement">${ messagesPerField.get('password') }</div>
                </#if>
            </div>
        </#if>

        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

        <div class="bx--form-item bx--text-input-wrapper">
            <label for="passwordNew" class="bx--label">${msg("passwordNew")}</label>
            <div class="bx--text-input__field-wrapper" ${messagesPerField.printIfExists('password','data-invalid')}>
                <#if messagesPerField.exists('password')>
                    <svg focusable="false" preserveAspectRatio="xMidYMid meet" style="will-change: transform;"
                         xmlns="http://www.w3.org/2000/svg" class="bx--text-input__invalid-icon" width="16"
                         height="16"
                         viewBox="0 0 16 16" aria-hidden="true">
                        <path d="M8 1C4.2 1 1 4.2 1 8s3.2 7 7 7 7-3.1 7-7-3.1-7-7-7zm-.5 3h1v5h-1V4zm.5 8.2c-.4 0-.8-.4-.8-.8s.3-.8.8-.8c.4 0 .8.4.8.8s-.4.8-.8.8z"></path>
                        <path d="M7.5 4h1v5h-1V4zm.5 8.2c-.4 0-.8-.4-.8-.8s.3-.8.8-.8c.4 0 .8.4.8.8s-.4.8-.8.8z"
                              data-icon-path="inner-path" opacity="0"></path>
                    </svg>
                </#if>
                <input id="passwordNew"
                       class="bx--text-input ${ messagesPerField.printIfExists('password', 'bx--text-input--invalid') }"
                       type="password"
                       placeholder="${ msg('password') }"
                       name="password-new"
                       autocomplete="current-password"
                       value="${(account.password!'')}">
            </div>
            <#if messagesPerField.exists('password')>
                <div class="bx--form-requirement">${ messagesPerField.get('password') }</div>
            </#if>
        </div>

        <div class="bx--form-item bx--text-input-wrapper">
            <label for="password-confirm" class="bx--label">${msg("passwordConfirm")}</label>
            <div class="bx--text-input__field-wrapper" ${messagesPerField.printIfExists('passwordConfirm','data-invalid')}>
                <#if messagesPerField.exists('password')>
                    <svg focusable="false" preserveAspectRatio="xMidYMid meet" style="will-change: transform;"
                         xmlns="http://www.w3.org/2000/svg" class="bx--text-input__invalid-icon" width="16"
                         height="16"
                         viewBox="0 0 16 16" aria-hidden="true">
                        <path d="M8 1C4.2 1 1 4.2 1 8s3.2 7 7 7 7-3.1 7-7-3.1-7-7-7zm-.5 3h1v5h-1V4zm.5 8.2c-.4 0-.8-.4-.8-.8s.3-.8.8-.8c.4 0 .8.4.8.8s-.4.8-.8.8z"></path>
                        <path d="M7.5 4h1v5h-1V4zm.5 8.2c-.4 0-.8-.4-.8-.8s.3-.8.8-.8c.4 0 .8.4.8.8s-.4.8-.8.8z"
                              data-icon-path="inner-path" opacity="0"></path>
                    </svg>
                </#if>
                <input id="password-confirm"
                       class="bx--text-input ${ messagesPerField.printIfExists('password-confirm', 'bx--text-input--invalid') }"
                       type="password"
                       placeholder="${ msg('passwordConfirm') }"
                       name="password-confirm"
                       autocomplete="current-password">
            </div>
            <#if messagesPerField.exists('password')>
                <div class="bx--form-requirement">${ messagesPerField.get('password') }</div>
            </#if>
        </div>

<#--        <div class="form-group">-->
<#--            <div class="col-sm-2 col-md-2">-->
<#--                <label for="password-confirm" class="control-label" class="two-lines">${msg("passwordConfirm")}</label>-->
<#--            </div>-->

<#--            <div class="col-sm-10 col-md-10">-->
<#--                <input type="password" class="form-control" id="password-confirm" name="password-confirm"-->
<#--                       autocomplete="new-password">-->
<#--            </div>-->
<#--        </div>-->

        <div class="FlexDisplay">
            <button type="submit"
                    class="bx--btn bx--btn--primary ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}"
                    name="submitAction" value="Save">
                ${msg("doSave")}
            </button>
        </div>
    </form>

</@layout.mainLayout>
