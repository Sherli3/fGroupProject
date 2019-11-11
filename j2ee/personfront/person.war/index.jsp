<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="dsp" uri="/WEB-INF/tld/dspjspTaglib1_0.tld" %>
<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld" %>
<dsp:page>
    <html>
    <head><title>Task 3</title></head>
    <body>
    <h2>RQL task for person</h2>
    <h4>All Persons</h4>
    <table>
        <dsp:droplet name="/atg/dynamo/droplet/RQLQueryRange">
            <dsp:param name="queryRQL" value="all"/>
            <dsp:param name="repository" value="/components/repository/PersonRepository"/>
            <dsp:param name="howMany" value="5"/>
            <dsp:param name="itemDescriptor" value="user"/>
            <dsp:oparam name="output">
                <td><dsp:valueof param="element.name"/></td>
            </dsp:oparam>
        </dsp:droplet>
    </table>
    <h4>Roles of Person All:</h4>
    <table>
        <dsp:droplet name="/atg/dynamo/droplet/RQLQueryRange">
        <dsp:param name="queryRQL" value="all"/>
        <dsp:param name="repository" value="/components/repository/PersonRepository"/>
        <dsp:param name="howMany" value="5"/>
        <dsp:param name="itemDescriptor" value="user"/>
        <tr>
            <td><dsp:valueof param="element.name"/></td>
            <td>
                <ul>
                    <dsp:oparam name="output">
                        <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                            <dsp:param name="array" param="element.roles"/>
                            <dsp:oparam name="output">
                                <li>
                                    <dsp:valueof param="element.nameRole"/>
                                </li>
                            </dsp:oparam>
                        </dsp:droplet>
                    </dsp:oparam>
                </ul>
                </dsp:droplet>
    </table>
    <h4>Roles of Person by Id:</h4>
    <table>
        <dsp:droplet name="/atg/dynamo/droplet/RQLQueryRange">
            <dsp:param name="idUser" value="2"/>
            <dsp:param name="queryRQL" value="id = :idUser"/>
            <dsp:param name="repository" value="/components/repository/PersonRepository"/>
            <dsp:param name="howMany" value="5"/>
            <dsp:param name="itemDescriptor" value="user"/>
            <dsp:oparam name="output">
                <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                    <dsp:param name="array" param="element.roles"/>
                    <dsp:oparam name="output">
                        <li>
                            <dsp:valueof param="element.nameRole"/>
                        </li>
                    </dsp:oparam>
                </dsp:droplet>
            </dsp:oparam>
        </dsp:droplet>
    </table>


    <h4>Scores person:</h4>
    <table>
        <dsp:droplet name="/atg/dynamo/droplet/RQLQueryRange">
            <dsp:param name="idUser" value="2"/>
            <dsp:param name="queryRQL" value="idUser=:idUser order by score sort desc"/>
            <dsp:param name="repository" value="/components/repository/PersonRepository"/>
            <dsp:param name="howMany" value="5"/>
            <dsp:param name="itemDescriptor" value="scores"/>
            <li>
            <dsp:oparam name="output">
                <dsp:valueof param="element.score"/>
                </li>
            </dsp:oparam>
        </dsp:droplet>
    </table>

    <h4>Mentored Persons:</h4>
    <table>
        <dsp:droplet name="/atg/dynamo/droplet/RQLQueryRange">
            <dsp:param name="idUser" value="2"/>
            <dsp:param name="queryRQL" value="id = :idUser"/>
            <dsp:param name="repository" value="/components/repository/PersonRepository"/>
            <dsp:param name="howMany" value="5"/>
            <dsp:param name="itemDescriptor" value="user"/>
            <dsp:param name="array" param="element.mentorUser"/>
            <dsp:oparam name="output">
                <li><dsp:droplet name="/atg/dynamo/droplet/ForEach">
                <dsp:valueof param="element.name"/>
                <dsp:oparam name="output"></li>
                </dsp:oparam>
            </dsp:droplet>
            </dsp:oparam>
        </dsp:droplet>
    </table>

    <h4>Persons who visited isOk = true and "2019/11/08":</h4>
    <table>
        <dsp:droplet name="/atg/dynamo/droplet/RQLQueryRange">
            <dsp:param name="date" value="08/NOV/2019"/>
            <dsp:param name="queryRQL" value="visitDate=:date and isOk = true"/>
            <dsp:param name="repository" value="/components/repository/PersonRepository"/>
            <dsp:param name="howMany" value="5"/>
            <dsp:param name="itemDescriptor" value="visit"/>
            <dsp:oparam name="output">
                <li>
                    <dsp:valueof param="element.visitDate"/>
                    <dsp:valueof param="element.isOk"/>
                </li>
            </dsp:oparam>
        </dsp:droplet>
    </table>

    </body>
    </html>
</dsp:page>