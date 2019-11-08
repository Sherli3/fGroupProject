<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="dsp" uri="/WEB-INF/tld/dspjspTaglib1_0.tld" %>
<dsp:page>
    <html>
    <head><title>Task 2</title></head>
    <body>
    <dsp:form name="statusForm">
    <dsp:valueof bean="/components/Person.status"/><p>
        Set status:
        <dsp:input name ="status" type="submit" value="key1" bean="/components/Person.action"/>
        <dsp:input name ="status" type="submit" value="key2" bean="/components/Person.action"/>
    </dsp:form>
    </body>
    </html>
</dsp:page>