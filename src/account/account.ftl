<#import "template.ftl" as layout>
<@layout.mainLayout active='account' bodyClass='user'; section>

    <h1 class="GreetingsMessage NoMargin">
        ${msg("editAccountHtmlTitle")}
    </h1>

    <form action="${url.accountUrl}" class="AccountForm" method="post">

        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

        <#if !realm.registrationEmailAsUsername>
            <div class="bx--form-item bx--text-input-wrapper">
                <label for="username" class="bx--label">${msg("username")}</label>
                <div class="bx--text-input__field-wrapper" ${messagesPerField.printIfExists('username','data-invalid')}>
                    <#if messagesPerField.exists('username')>
                        <svg focusable="false" preserveAspectRatio="xMidYMid meet" style="will-change: transform;"
                             xmlns="http://www.w3.org/2000/svg" class="bx--text-input__invalid-icon" width="16"
                             height="16"
                             viewBox="0 0 16 16" aria-hidden="true">
                            <path d="M8 1C4.2 1 1 4.2 1 8s3.2 7 7 7 7-3.1 7-7-3.1-7-7-7zm-.5 3h1v5h-1V4zm.5 8.2c-.4 0-.8-.4-.8-.8s.3-.8.8-.8c.4 0 .8.4.8.8s-.4.8-.8.8z"></path>
                            <path d="M7.5 4h1v5h-1V4zm.5 8.2c-.4 0-.8-.4-.8-.8s.3-.8.8-.8c.4 0 .8.4.8.8s-.4.8-.8.8z"
                                  data-icon-path="inner-path" opacity="0"></path>
                        </svg>
                    </#if>
                    <input id="username" type="text"
                           class="bx--text-input ${ messagesPerField.printIfExists('username', 'bx--text-input--invalid') }"
                           placeholder="${ msg('username') }" <#if !realm.editUsernameAllowed>disabled="disabled"</#if>
                           name="username"
                           value="${(account.username!'')}">
                </div>
                <#if messagesPerField.exists('username')>
                    <div class="bx--form-requirement">${ messagesPerField.get('username') }</div>
                </#if>
            </div>
        </#if>

        <div class="bx--form-item bx--text-input-wrapper">
            <label for="email" class="bx--label">${msg("email")}</label>
            <div class="bx--text-input__field-wrapper" ${messagesPerField.printIfExists('email','data-invalid')}>
                <#if messagesPerField.exists('email')>
                    <svg focusable="false" preserveAspectRatio="xMidYMid meet" style="will-change: transform;"
                         xmlns="http://www.w3.org/2000/svg" class="bx--text-input__invalid-icon" width="16" height="16"
                         viewBox="0 0 16 16" aria-hidden="true">
                        <path d="M8 1C4.2 1 1 4.2 1 8s3.2 7 7 7 7-3.1 7-7-3.1-7-7-7zm-.5 3h1v5h-1V4zm.5 8.2c-.4 0-.8-.4-.8-.8s.3-.8.8-.8c.4 0 .8.4.8.8s-.4.8-.8.8z"></path>
                        <path d="M7.5 4h1v5h-1V4zm.5 8.2c-.4 0-.8-.4-.8-.8s.3-.8.8-.8c.4 0 .8.4.8.8s-.4.8-.8.8z"
                              data-icon-path="inner-path" opacity="0"></path>
                    </svg>
                </#if>
                <input id="email" type="text"
                       class="bx--text-input ${ messagesPerField.printIfExists('username', 'bx--text-input--invalid') }"
                       autofocus
                       name="email"
                       placeholder="${ msg('email') }"
                       value="${(account.email!'')}">
            </div>
            <#if messagesPerField.exists('email')>
                <div class="bx--form-requirement">${ messagesPerField.get('email') }</div>
            </#if>
        </div>

        <#--        <#if !realm.registrationEmailAsUsername>-->
        <#--            <div class="form-group ${messagesPerField.printIfExists('username','has-error')}">-->
        <#--                <div class="col-sm-2 col-md-2">-->
        <#--                    <label for="username" class="control-label"></label> <#if realm.editUsernameAllowed><span-->
        <#--                            class="required">*</span></#if>-->
        <#--                </div>-->

        <#--                <div class="col-sm-10 col-md-10">-->
        <#--                    <input type="text" class="form-control" id="username" name="username" "/>-->
        <#--                </div>-->
        <#--            </div>-->
        <#--        </#if>-->

        <div class="bx--form-item bx--text-input-wrapper">
            <label for="firstName" class="bx--label">${msg("firstName")}</label>
            <div class="bx--text-input__field-wrapper" ${messagesPerField.printIfExists('firstName','data-invalid')}>
                <#if messagesPerField.exists('firstName')>
                    <svg focusable="false" preserveAspectRatio="xMidYMid meet" style="will-change: transform;"
                         xmlns="http://www.w3.org/2000/svg" class="bx--text-input__invalid-icon" width="16" height="16"
                         viewBox="0 0 16 16" aria-hidden="true">
                        <path d="M8 1C4.2 1 1 4.2 1 8s3.2 7 7 7 7-3.1 7-7-3.1-7-7-7zm-.5 3h1v5h-1V4zm.5 8.2c-.4 0-.8-.4-.8-.8s.3-.8.8-.8c.4 0 .8.4.8.8s-.4.8-.8.8z"></path>
                        <path d="M7.5 4h1v5h-1V4zm.5 8.2c-.4 0-.8-.4-.8-.8s.3-.8.8-.8c.4 0 .8.4.8.8s-.4.8-.8.8z"
                              data-icon-path="inner-path" opacity="0"></path>
                    </svg>
                </#if>
                <input id="firstName" type="text"
                       class="bx--text-input ${ messagesPerField.printIfExists('username', 'bx--text-input--invalid') }"
                       autofocus
                       name="firstName"
                       placeholder="${ msg('firstName') }"
                       value="${(account.firstName!'')}">
            </div>
            <#if messagesPerField.exists('firstName')>
                <div class="bx--form-requirement">${ messagesPerField.get('firstName') }</div>
            </#if>
        </div>

        <div class="bx--form-item bx--text-input-wrapper">
            <label for="lastName" class="bx--label">${msg("lastName")}</label>
            <div class="bx--text-input__field-wrapper" ${messagesPerField.printIfExists('lastName','data-invalid')}>
                <#if messagesPerField.exists('lastName')>
                    <svg focusable="false" preserveAspectRatio="xMidYMid meet" style="will-change: transform;"
                         xmlns="http://www.w3.org/2000/svg" class="bx--text-input__invalid-icon" width="16" height="16"
                         viewBox="0 0 16 16" aria-hidden="true">
                        <path d="M8 1C4.2 1 1 4.2 1 8s3.2 7 7 7 7-3.1 7-7-3.1-7-7-7zm-.5 3h1v5h-1V4zm.5 8.2c-.4 0-.8-.4-.8-.8s.3-.8.8-.8c.4 0 .8.4.8.8s-.4.8-.8.8z"></path>
                        <path d="M7.5 4h1v5h-1V4zm.5 8.2c-.4 0-.8-.4-.8-.8s.3-.8.8-.8c.4 0 .8.4.8.8s-.4.8-.8.8z"
                              data-icon-path="inner-path" opacity="0"></path>
                    </svg>
                </#if>
                <input id="lastName" type="text"
                       class="bx--text-input ${ messagesPerField.printIfExists('username', 'bx--text-input--invalid') }"
                       autofocus
                       name="lastName"
                       placeholder="${ msg('lastName') }"
                       value="${(account.lastName!'')}">
            </div>
            <#if messagesPerField.exists('lastName')>
                <div class="bx--form-requirement">${ messagesPerField.get('lastName') }</div>
            </#if>
        </div>

        <#--        <div class="form-group ${messagesPerField.printIfExists('firstName','has-error')}">-->
        <#--            <div class="col-sm-2 col-md-2">-->
        <#--                <label for="firstName" class="control-label">${msg("firstName")}</label> <span class="required">*</span>-->
        <#--            </div>-->

        <#--            <div class="col-sm-10 col-md-10">-->
        <#--                <input type="text" class="form-control" id="firstName" name="firstName"-->
        <#--                       value="${(account.firstName!'')}"/>-->
        <#--            </div>-->
        <#--        </div>-->

        <#--        <div class="form-group ${messagesPerField.printIfExists('lastName','has-error')}">-->
        <#--            <div class="col-sm-2 col-md-2">-->
        <#--                <label for="lastName" class="control-label">${msg("lastName")}</label> <span class="required">*</span>-->
        <#--            </div>-->

        <#--            <div class="col-sm-10 col-md-10">-->
        <#--                <input type="text" class="form-control" id="lastName" name="lastName" value="${(account.lastName!'')}"/>-->
        <#--            </div>-->
        <#--        </div>-->

        <div class="DisplayFlex">
            <#if url.referrerURI??>
                <div>
                    <a role="button" class="bx--btn bx--btn--primary" type="button" href="${url.referrerURI}">
                        ${kcSanitize(msg("backToApplication")?no_esc)}
                    </a>
                </div>
            </#if>

            <div>
                <button type="submit"
                        class="bx--btn bx--btn--primary"
                        name="submitAction" value="Save">${msg("doSave")}</button>
            </div>

            <div>
                <button type="submit"
                        class="bx--btn bx--btn--tertiary"
                        name="submitAction" value="Cancel">${msg("doCancel")}</button>
            </div>
        </div>
    </form>

</@layout.mainLayout>
