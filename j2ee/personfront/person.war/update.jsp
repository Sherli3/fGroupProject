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
        Name: <dsp:input type="text" bean="/components/RepositoryFormHandlersPersonEdit.value.name"/>
        <dsp:input type="hidden" bean="/components/RepositoryFormHandlersPersonEdit.repositoryId" value="${userId}" />
        <dsp:input bean="/components/RepositoryFormHandlersPersonEdit.update" type="submit" value="Edit"/>
        <dsp:input bean="/components/RepositoryFormHandlersPersonEdit.updateSuccessURL" type="hidden" value="index.jsp" />
        <dsp:input bean="/components/RepositoryFormHandlersPersonEdit.updateErrorURL" type="hidden" value="details.jsp" />

    </dsp:form>
    </body>
    </html>
</dsp:page>
