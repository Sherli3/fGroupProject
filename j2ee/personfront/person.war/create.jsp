<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="dsp" uri="/WEB-INF/tld/dspjspTaglib1_0.tld" %>
<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld" %>
<dsp:page>
    <html>
    <head><title>Task 4</title></head>
    <body>
    <h4>Add Person</h4>
    <dsp:form method="post">
        Name: <dsp:input type="text" bean="/components/RepositoryFormHandlersPersonAdd.value.name"/>
            <dsp:input bean="/components/RepositoryFormHandlersPersonAdd.create" type="submit" value="Add"/>
            <dsp:input bean="/components/RepositoryFormHandlersPersonAdd.createSuccessURL" type="hidden" value="index.jsp" />
            <dsp:input bean="/components/RepositoryFormHandlersPersonAdd.createErrorURL" type="hidden" value="details.jsp" />

    </dsp:form>
    </body>
    </html>
</dsp:page>
