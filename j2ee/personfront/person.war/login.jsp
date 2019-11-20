<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dsp" uri="/WEB-INF/tld/dspjspTaglib1_0.tld" %>
<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld" %>
<%@ page import="atg.servlet.*"%>
<dsp:page>
    <html>
    <head><title>Task 5</title></head>
    <h1>Authentication page</h1>
    <dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
    <dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach"/>
    <body>
    <dsp:form formid="loginForm" action="login.jsp" method="post">
        Login: <dsp:input bean="ProfileFormHandler.value.login" maxlength="30" size="25" type="text" required="true"/>
        Password:<dsp:input bean="ProfileFormHandler.value.password" maxlength="30" size="25" type="password" required="true"/>
        <dsp:input bean="ProfileFormHandler.login" type="submit" value="Log In"/>
        <dsp:input bean="ProfileFormHandler.loginSuccessURL" type="hidden" value="detail.jsp"/>
        <dsp:input bean="ProfileFormHandler.loginErrorURL" type="hidden" value="logout.jsp"/>

        <dsp:droplet name="ErrorMessageForEach">
            <dsp:param bean="ProfileFormHandler.formExceptions" name="exceptions"/>
            <dsp:oparam name="output">
                <li>
                    <dsp:valueof param="message"/>
                </li>
            </dsp:oparam>
        </dsp:droplet>
    </dsp:form>
    </body>
    </html>
</dsp:page>