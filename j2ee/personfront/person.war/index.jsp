<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dsp" uri="/WEB-INF/tld/dspjspTaglib1_0.tld" %>
<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld" %>
<%@ page import="atg.servlet.*"%>
<dsp:page>
    <html>
    <head><title>Task 4</title></head>
    <body>
    <h4>All Persons</h4>
    <table>
        <dsp:droplet name="/components/PersonsAll/">
            <dsp:param name="howMany" value="10"/>
            <dsp:oparam name="output">
                <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                    <dsp:param name="array" param="list"/>
                    <dsp:oparam name="output">
                        <ul><dsp:valueof param="element.name"/></ul>
                        <dsp:a href="details.jsp">more information
                            <dsp:param name="parId" param="element.id"/></dsp:a>
                        <dsp:a href="update.jsp">Edit person
                            <dsp:param name="parId" param="element.id"/></dsp:a>
                    </dsp:oparam>
                </dsp:droplet>
            </dsp:oparam>
        </dsp:droplet>

    </table>
    <dsp:a href="create.jsp">Create new person</dsp:a>
    <dsp:a href="delete.jsp">Create new person</dsp:a>
    </body>
    </html>
</dsp:page>