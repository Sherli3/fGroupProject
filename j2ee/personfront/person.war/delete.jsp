<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dsp" uri="/WEB-INF/tld/dspjspTaglib1_0.tld" %>
<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld" %>
<dsp:page>
    <html>
    <head><title>Task 4</title></head>
    <body>
    <h4>Delete Persons</h4>
    <table>
        <dsp:droplet name="/components/PersonsAll/">
            <dsp:param name="howMany" value="10"/>
            <dsp:oparam name="output">
                <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                    <dsp:param name="array" param="list"/>
                    <dsp:oparam name="output">
                        <ul> <dsp:valueof param="element.name"/>
                        <dsp:form action="<%=request.getRequestURI()%>" method="post">
                            <dsp:input type="hidden" bean="/components/RepositoryFormHandlersPersonDelete.repositoryId" paramvalue="element.id" />
                            <dsp:input bean="/components/RepositoryFormHandlersPersonDelete.delete" type="submit" value="delete"/>
                            <dsp:input bean="/components/RepositoryFormHandlersPersonDelete.deleteSuccessURL" type="hidden" value="index.jsp" />
                            <dsp:input bean="/components/RepositoryFormHandlersPersonDelete.deleteSuccessURL" type="hidden" value="details.jsp" />
                        </dsp:form></ul>
                    </dsp:oparam>
                </dsp:droplet>
            </dsp:oparam>
        </dsp:droplet>




    </table>
    </body>
    </html>
</dsp:page>
