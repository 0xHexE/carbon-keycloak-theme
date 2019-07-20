<#import "template.ftl" as layout>
<@layout.mainLayout active='applications' bodyClass='applications'; section>
    <div class="DashboardProfilePictureWrapper">
        <div class="DashboardProfilePicture">
            <figure class="ProfileContent">
                <img alt="Profile"
                     style="display: none"
                     id="profileImage"
                     width="96"
                     height="96">
            </figure>
            <div class="ChangeGravatar" onclick="handleChangeAvatar()">
                <div></div>
            </div>
        </div>
    </div>

    <h1 class="GreetingsMessage" style="display: none" id="greetingsMessage">
        Good <span id="afterTime"></span>, <b class="Username">${ account.firstName! }</b>
    </h1>

    <form action="${url.applicationsUrl}" method="post">
        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
        <input type="hidden" id="referrer" name="referrer" value="${stateChecker}">

        <div class="CardList">
            <#list applications.applications as application>
                <#if application.effectiveUrl?has_content>
                    <a class="bx--tile bx--tile--clickable Card" href="${application.effectiveUrl}">
                        <svg focusable="false" preserveAspectRatio="xMidYMid meet" style="will-change: transform;"
                             class="Icon"
                             xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32"
                             aria-hidden="true">
                            <path d="M16 18H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2zM6 6v10h10V6zm20 6v4h-4v-4h4m0-2h-4a2 2 0 0 0-2 2v4a2 2 0 0 0 2 2h4a2 2 0 0 0 2-2v-4a2 2 0 0 0-2-2zm0 12v4h-4v-4h4m0-2h-4a2 2 0 0 0-2 2v4a2 2 0 0 0 2 2h4a2 2 0 0 0 2-2v-4a2 2 0 0 0-2-2zm-10 2v4h-4v-4h4m0-2h-4a2 2 0 0 0-2 2v4a2 2 0 0 0 2 2h4a2 2 0 0 0 2-2v-4a2 2 0 0 0-2-2z"></path>
                        </svg>
                        <span>
                            <#if application.client.name?has_content>${advancedMsg(application.client.name)}<#else>${application.client.clientId}</#if>
                        </span>
                    </a>
                </#if>
            </#list>
        </div>

        <#--        <table class="table table-striped table-bordered">-->
        <#--            <thead>-->
        <#--            <tr>-->
        <#--                <td>${msg("application")}</td>-->
        <#--                <td>${msg("availableRoles")}</td>-->
        <#--                <td>${msg("grantedPermissions")}</td>-->
        <#--                <td>${msg("additionalGrants")}</td>-->
        <#--                <td>${msg("action")}</td>-->
        <#--            </tr>-->
        <#--            </thead>-->

        <#--            <tbody>-->
        <#--            <#list applications.applications as application>-->
        <#--                <tr>-->
        <#--                    <td>-->
        <#--                        <#if application.effectiveUrl?has_content><a href="${application.effectiveUrl}"></#if>-->
        <#--                            <#if application.client.name?has_content>${advancedMsg(application.client.name)}<#else>${application.client.clientId}</#if>-->
        <#--                            <#if application.effectiveUrl?has_content></a></#if>-->
        <#--                    </td>-->

        <#--                    <td>-->
        <#--                        <#list application.realmRolesAvailable as role>-->
        <#--                            <#if role.description??>${advancedMsg(role.description)}<#else>${advancedMsg(role.name)}</#if>-->
        <#--                            <#if role_has_next>, </#if>-->
        <#--                        </#list>-->
        <#--                        <#list application.resourceRolesAvailable?keys as resource>-->
        <#--                            <#if application.realmRolesAvailable?has_content>, </#if>-->
        <#--                            <#list application.resourceRolesAvailable[resource] as clientRole>-->
        <#--                                <#if clientRole.roleDescription??>${advancedMsg(clientRole.roleDescription)}<#else>${advancedMsg(clientRole.roleName)}</#if>-->
        <#--                                ${msg("inResource")}-->
        <#--                                <strong><#if clientRole.clientName??>${advancedMsg(clientRole.clientName)}<#else>${clientRole.clientId}</#if></strong>-->
        <#--                                <#if clientRole_has_next>, </#if>-->
        <#--                            </#list>-->
        <#--                        </#list>-->
        <#--                    </td>-->

        <#--                    <td>-->
        <#--                        <#if application.client.consentRequired>-->
        <#--                            <#list application.clientScopesGranted as claim>-->
        <#--                                ${advancedMsg(claim)}<#if claim_has_next>, </#if>-->
        <#--                            </#list>-->
        <#--                        <#else>-->
        <#--                            <strong>${msg("fullAccess")}</strong>-->
        <#--                        </#if>-->
        <#--                    </td>-->

        <#--                    <td>-->
        <#--                        <#list application.additionalGrants as grant>-->
        <#--                            ${advancedMsg(grant)}<#if grant_has_next>, </#if>-->
        <#--                        </#list>-->
        <#--                    </td>-->

        <#--                    <td>-->
        <#--                        <#if (application.client.consentRequired && application.clientScopesGranted?has_content) || application.additionalGrants?has_content>-->
        <#--                            <button type='submit'-->
        <#--                                    class='${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!}'-->
        <#--                                    id='revoke-${application.client.clientId}' name='clientId'-->
        <#--                                    value="${application.client.id}">${msg("revoke")}</button>-->
        <#--                        </#if>-->
        <#--                    </td>-->
        <#--                </tr>-->
        <#--            </#list>-->
        <#--            </tbody>-->
        <#--        </table>-->
    </form>

</@layout.mainLayout>
