<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dsp" uri="/WEB-INF/tld/dspjspTaglib1_0.tld" %>
<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld" %>
<%@ page import="atg.servlet.*" %>
<dsp:page>
    <html>
    <head><title>Task 5</title></head>
    <h1>Registration page</h1>
    <dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
    <dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach"/>
    <body>
    <dsp:form id="registerForm" method="post" action="registration.jsp">
        <table>
            <tbody>
            <tr>
                <td>First Name *</td>
                <td><dsp:input bean="ProfileFormHandler.value.firstName" type="text"/></td>
            </tr>

            <tr>
                <td>Last Name *</td>
                <td><dsp:input bean="ProfileFormHandler.value.lastName" type="text"/></td>
            </tr>

            <tr>
                <td>Username *</td>
                <td><dsp:input bean="ProfileFormHandler.value.login" type="text"/></td>
            </tr>

            <tr>
                <td>Password *</td>
                <td><dsp:input bean="ProfileFormHandler.value.password" type="password"/></td>
            </tr>

            <tr>
                <td>Confirm Password *</td>
                <td><dsp:input bean="ProfileFormHandler.value.confirmpassword" type="password"/></td>
            </tr>

            <dsp:select bean="ProfileFormHandler.roleId">
                Roles:
                <dsp:droplet name="/atg/dynamo/droplet/RQLQueryRange">
                    <dsp:param name="queryRQL" value="all"/>
                    <dsp:param name="repository" value="/atg/userprofiling/ProfileAdapterRepository"/>
                    <dsp:param name="howMany" value="10"/>
                    <dsp:param name="itemDescriptor" value="role"/>
                    <dsp:oparam name="output">
                        <dsp:option paramvalue="element.repositoryId">
                            <dsp:valueof param="element.repositoryId"/>
                            <dsp:valueof param="element.name"/>
                        </dsp:option>
                    </dsp:oparam>
                </dsp:droplet>
            </dsp:select>

            <tr>
                <td colspan="2">
                    <dsp:input bean="ProfileFormHandler.create" type="submit" value="Register"/>
                    <dsp:input bean="ProfileFormHandler.createSuccessURL" type="hidden" value="detail.jsp"/>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <ul>
                        <dsp:droplet name="ErrorMessageForEach">
                            <dsp:param bean="ProfileFormHandler.formExceptions" name="exceptions"/>
                            <dsp:oparam name="output">
                                <li>
                                    <dsp:valueof param="message"/>
                                </li>
                            </dsp:oparam>
                        </dsp:droplet>
                    </ul>
                </td>
            </tr>
            </tbody>
        </table>
    </dsp:form>
    </body>
    </html>
</dsp:page>