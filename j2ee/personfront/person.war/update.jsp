<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="dsp" uri="/WEB-INF/tld/dspjspTaglib1_0.tld" %>
<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld" %>
<dsp:page>
    <html>
    <head><title>Task 4</title></head>
    <body>
    <h4>Edit Person</h4>
    <dsp:getvalueof var="userId" param="parId" vartype="java.lang.String"/>

    <dsp:form method="post">
        <dsp:droplet name="/components/PersonDetails/">
            <dsp:param name="id" value="${userId}"/>
            <dsp:oparam name="output">
                <ul> Name: <dsp:valueof param="element.name"/></ul>
                <dsp:input type="hidden" bean="/components/RepositoryFormHandlersPersonEdit.idMentor" paramvalue="element.id" />
            </dsp:oparam>
            <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                <dsp:param name="array" param="element.mentor"/>
                <dsp:oparam name="output">
                    <ul>Mentored:<dsp:valueof param="element.name"/>
                        <dsp:valueof param="element.id"/>
                        <dsp:valueof param="element.repositoryId"/>
                        <dsp:param name="parId" value="${userId}"/>
                        <dsp:input type="hidden" bean="/components/RepositoryFormHandlersPersonEdit.person" paramvalue="element.repositoryId" />
                        <dsp:input  type="submit" value="Delete" bean="/components/RepositoryFormHandlersPersonEdit.delete"/></ul>
                </dsp:oparam>
            </dsp:droplet>
        </dsp:droplet>
    </dsp:form>

    <dsp:form method="post">

        <dsp:select bean="/components/RepositoryFormHandlersPersonEdit.mentors">
            Mentors:
            <dsp:droplet name="/atg/dynamo/droplet/RQLQueryRange">
                <dsp:param name="queryRQL" value="all"/>
                <dsp:param name="repository" value="/components/repository/PersonRepository"/>
                <dsp:param name="howMany" value="10"/>
                <dsp:param name="itemDescriptor" value="user"/>
                <dsp:oparam name="output">
                    <dsp:option paramvalue="element.repositoryId">
                        <dsp:valueof param="element.id"/>
                        <dsp:valueof param="element.name"/>
                    </dsp:option>
                </dsp:oparam>
            </dsp:droplet>
        </dsp:select>

        Name: <dsp:input type="text" bean="/components/RepositoryFormHandlersPersonEdit.value.name"/>
        <dsp:input type="hidden" bean="/components/RepositoryFormHandlersPersonEdit.repositoryId" value="${userId}"/>
        <dsp:input bean="/components/RepositoryFormHandlersPersonEdit.update" type="submit" value="Edit"/>
        <dsp:input bean="/components/RepositoryFormHandlersPersonEdit.updateSuccessURL" type="hidden"
                   value="index.jsp"/>
        <dsp:input bean="/components/RepositoryFormHandlersPersonEdit.updateErrorURL" type="hidden"
                   value="details.jsp"/>

    </dsp:form>


    </body>
    </html>
</dsp:page>
