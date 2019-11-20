<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dsp" uri="/WEB-INF/tld/dspjspTaglib1_0.tld" %>
<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld" %>
<%@ page import="atg.servlet.*"%>
<dsp:page>
    <dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
    <html>
    <head><title>Task 5</title></head>
    <body>
    Details:
    <dsp:form action="detail.jsp" method="post">
    <dsp:droplet name="/atg/dynamo/droplet/Compare">
        <dsp:param bean="/atg/userprofiling/Profile.securityStatus" name="obj1"/>
        <dsp:param bean="/atg/userprofiling/PropertyManager.securityStatusLogin" name="obj2"/>
        <dsp:oparam name="equal">
            <li> Name: <dsp:valueof bean="/atg/userprofiling/ProfileFormHandler.value.login"/></li>
            <li> First name: <dsp:valueof bean="/atg/userprofiling/ProfileFormHandler.value.firstName"/></li>
            <li> Last name: <dsp:valueof bean="/atg/userprofiling/ProfileFormHandler.value.lastName"/></li>
            Roles:
            <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                <dsp:param name="array" bean="/atg/userprofiling/ProfileFormHandler.value.roles"/>
                <dsp:oparam name="output">
                    <li>
                        <dsp:valueof param="element.name"/>
                    </li>
                </dsp:oparam>
            </dsp:droplet>

            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.logout" type="Submit" value="Logout"/>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.logoutSuccessURL" type="hidden" value="login.jsp" />
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.logoutErrorURL" type="hidden" value="logout.jsp" />
        </dsp:oparam>

    </dsp:droplet>
    </dsp:form>
    </body>
    </html>
</dsp:page>