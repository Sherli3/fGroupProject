<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dsp" uri="/WEB-INF/tld/dspjspTaglib1_0.tld" %>
<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld" %>
<dsp:page>
    <html>
    <head><title>Task 4</title></head>
    <body>
    <h2>Details for person</h2>
    <dsp:getvalueof var="userId" param="parId" vartype="java.lang.String"/>
    <table>
        Person - ${userId}
    <dsp:droplet name="/components/PersonDetails/">
        <dsp:param name="id" value="${userId}"/>
        <dsp:oparam name="output">
           <ul> Name: <dsp:valueof param="element.name"/></ul>
        </dsp:oparam>
        <dsp:droplet name="/atg/dynamo/droplet/ForEach">
        <dsp:param name="array" param="element.roles"/>
        <dsp:oparam name="output">
            <ul> Roles: <dsp:valueof param="element.nameRole"/></ul>
        </dsp:oparam>
        </dsp:droplet>
        <dsp:droplet name="/atg/dynamo/droplet/ForEach">
            <dsp:param name="array" param="element.mentoredUser"/>
            <dsp:oparam name="output">
                <ul>Mentored:<dsp:valueof param="element.name"/></ul>
            </dsp:oparam>
        </dsp:droplet>
        <dsp:droplet name="/atg/dynamo/droplet/ForEach">
            <dsp:param name="array" param="element.visits"/>
            <dsp:oparam name="output">
                <ul><p1> Visit Date</p1> : <dsp:valueof param="element.visitDate"/></ul>
                <ul> Approved: <dsp:valueof param="element.isOk"/></ul>
            </dsp:oparam>
        </dsp:droplet>
        <dsp:droplet name="/atg/dynamo/droplet/ForEach">
            <dsp:param name="array" param="element.scores"/>
            <dsp:oparam name="output">
            <ul>Score : <dsp:valueof param="element.score"/></ul>
            </dsp:oparam>
        </dsp:droplet>
    </dsp:droplet>

</table>
</body>
</html>
</dsp:page>