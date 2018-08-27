<script type="text/javascript">
    function refreshcaptchacode(obj) {
        obj.setAttribute("src", "captchacode?date=" + new Date());
    }
</script>

<jsp:directive.include file="includes/top.jsp"/>

<c:if test="${not pageContext.request.secure}">
    <div id="msg" class="errors">
        <h2>Non-secure Connection</h2>
        <p>You are currently accessing CAS over a non-secure connection. Single Sign On WILL NOT WORK. In order to have
            single sign on work, you MUST log in over HTTPS.</p>
    </div>
</c:if>

<div class="box fl-panel fl-login"  style=" display: flex;
    justify-content: center;
    align-items:  center;" id="login">
    <form:form method="post" id="fm1" cssClass="fm-v clearfix" commandName="${commandName}" htmlEscape="true">
        <form:errors path="*" id="msg" cssClass="errors" element="div"/>
        <!-- <spring:message code="screen.welcome.welcome"/> -->
        <h2><spring:message code="screen.welcome.instructions"/></h2>
        <div class="row fl-controls-left">
            <label for="username" class="fl-label"><spring:message code="screen.welcome.label.netid"/></label>
            <c:if test="${not empty sessionScope.openIdLocalId}">
                <strong>${sessionScope.openIdLocalId}</strong>
                <input type="hidden" id="username" name="username" value="${sessionScope.openIdLocalId}"/>
            </c:if>

            <c:if test="${empty sessionScope.openIdLocalId}">
                <spring:message code="screen.welcome.label.netid.accesskey" var="userNameAccessKey"/>
                <form:input cssClass="required" cssErrorClass="error" id="username" size="25" tabindex="1" value="admin"
                            accesskey="${userNameAccessKey}" path="username" autocomplete="false" htmlEscape="true"/>
            </c:if>
        </div>
        <div class="row fl-controls-left">
            <label for="password" class="fl-label"><spring:message code="screen.welcome.label.password"/></label>
            <spring:message code="screen.welcome.label.password.accesskey" var="passwordAccessKey"/>
            <form:password cssClass="required" cssErrorClass="error" id="password" size="25" tabindex="2" value="admin"
                           path="password" accesskey="${passwordAccessKey}" htmlEscape="true" autocomplete="off"/>
        </div>
        <div class="row fl-controls-left">
            <form:input cssClass="required" cssErrorClass="error" id="imgverifycode" path="imgverifycode" style="width:120px"
                   htmlEscape="true" tabindex="3"
                   autocomplete="off" />
            <img id="cimg" src="captchacode" onclick="refreshcaptchacode(this)" title="refresh" style="vertical-align:middle"/>
        </div>
        <div class="row check">
            <input id="warn" name="warn" value="true" tabindex="4"
                   accesskey="<spring:message code="screen.welcome.label.warn.accesskey" />" type="checkbox"/>
            <label for="warn"><spring:message code="screen.welcome.label.warn"/></label>
        </div>
        <div class="row btn-row">
            <input type="hidden" name="lt" value="${loginTicket}"/>
            <input type="hidden" name="execution" value="${flowExecutionKey}"/>
            <input type="hidden" name="_eventId" value="submit"/>

            <input class="btn-submit" name="submit" accesskey="l"
                   value="<spring:message code="screen.welcome.button.login" />" tabindex="5" type="submit"/>
            <input class="btn-reset" name="reset" accesskey="c"
                   value="<spring:message code="screen.welcome.button.clear" />" tabindex="6" type="reset"/>
        </div>
    </form:form>
</div>
<%--<div id="sidebar">
    <div class="sidebar-content">
        <p class="fl-panel fl-note fl-bevel-white fl-font-size-80"><spring:message code="screen.welcome.security"/></p>
        <div id="list-languages" class="fl-panel">
            <%final String queryString = request.getQueryString() == null ? "" : request.getQueryString().replaceAll("&locale=([A-Za-z][A-Za-z]_)?[A-Za-z][A-Za-z]|^locale=([A-Za-z][A-Za-z]_)?[A-Za-z][A-Za-z]", "");%>
            <c:set var='query' value='<%=queryString%>'/>
            <c:set var="xquery" value="${fn:escapeXml(query)}"/>
            <h3>Languages:</h3>
            <c:choose>
                <c:when test="${not empty requestScope['isMobile'] and not empty mobileCss}">
                    <form method="get" action="login?${xquery}">
                        <select name="locale">
                            <option value="en">English</option>
                            <option value="es">Spanish</option>
                            <option value="fr">French</option>
                            <option value="ru">Russian</option>
                            <option value="nl">Nederlands</option>
                            <option value="sv">Svenska</option>
                            <option value="it">Italiano</option>
                            <option value="ur">Urdu</option>
                            <option value="zh_CN">Chinese (Simplified)</option>
                            <option value="zh_TW">Chinese (Traditional)</option>
                            <option value="de">Deutsch</option>
                            <option value="ja">Japanese</option>
                            <option value="hr">Croatian</option>
                            <option value="cs">Czech</option>
                            <option value="sl">Slovenian</option>
                            <option value="pl">Polish</option>
                            <option value="ca">Catalan</option>
                            <option value="mk">Macedonian</option>
                            <option value="fa">Farsi</option>
                            <option value="ar">Arabic</option>
                            <option value="pt_PT">Portuguese</option>
                            <option value="pt_BR">Portuguese (Brazil)</option>
                        </select>
                        <input type="submit" value="Switch">
                    </form>
                </c:when>
                <c:otherwise>
                    <c:set var="loginUrl" value="login?${xquery}${not empty xquery ? '&' : ''}locale="/>
                    <ul
                    >
                        <li class="first"><a href="${loginUrl}en">English</a></li
                        >
                        <li><a href="${loginUrl}es">Spanish</a></li
                        >
                        <li><a href="${loginUrl}fr">French</a></li
                        >
                        <li><a href="${loginUrl}ru">Russian</a></li
                        >
                        <li><a href="${loginUrl}nl">Nederlands</a></li
                        >
                        <li><a href="${loginUrl}sv">Svenska</a></li
                        >
                        <li><a href="${loginUrl}it">Italiano</a></li
                        >
                        <li><a href="${loginUrl}ur">Urdu</a></li
                        >
                        <li><a href="${loginUrl}zh_CN">Chinese (Simplified)</a></li
                        >
                        <li><a href="${loginUrl}zh_TW">Chinese (Traditional)</a></li
                        >
                        <li><a href="${loginUrl}de">Deutsch</a></li
                        >
                        <li><a href="${loginUrl}ja">Japanese</a></li
                        >
                        <li><a href="${loginUrl}hr">Croatian</a></li
                        >
                        <li><a href="${loginUrl}cs">Czech</a></li
                        >
                        <li><a href="${loginUrl}sl">Slovenian</a></li
                        >
                        <li><a href="${loginUrl}ca">Catalan</a></li
                        >
                        <li><a href="${loginUrl}mk">Macedonian</a></li
                        >
                        <li><a href="${loginUrl}fa">Farsi</a></li
                        >
                        <li><a href="${loginUrl}ar">Arabic</a></li
                        >
                        <li><a href="${loginUrl}pt_PT">Portuguese</a></li
                        >
                        <li><a href="${loginUrl}pt_BR">Portuguese (Brazil)</a></li
                        >
                        <li class="last"><a href="${loginUrl}pl">Polish</a></li
                        >
                    </ul>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>--%>
<jsp:directive.include file="includes/bottom.jsp"/>