<%@page import="javax.jcr.RepositoryException"%>
<%@page import="org.jahia.services.content.JCRNodeWrapper"%>
<%@page import="org.apache.commons.lang.time.DateFormatUtils"%>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<template:addResources type="css" resources="event.css"/>

        <div class="eventsListItem" itemscope itemtype="http://schema.org/Event"><!--start eventsListItem -->
            <fmt:formatDate pattern="yyyy-MM-dd" value="${currentNode.properties.startDate.time}" var="startDate"/>
            <meta itemprop="url" content="<c:url value="${url.base}${renderContext.mainResource.node.path}.html">
                <c:param name="filter" value="{name:'startDate',value:'${startDate}',op:'eq',uuid:'${currentNode.parent.identifier}',format:'yyyy-MM-dd',type:'date'}"/>
                <c:param name="calStartDate" value="${startDate}"/></c:url>">
            <div class="eventsInfoDate">
                <div class="eventsDate">
                    <meta itemprop="startDate" content="${startDate}">
                    <span class="day"><fmt:formatDate pattern="dd" value="${currentNode.properties.startDate.time}"/></span>
                    <span class="month"><fmt:formatDate pattern="MM" value="${currentNode.properties.startDate.time}"/></span>
                    <span class="year"><fmt:formatDate pattern="yyyy" value="${currentNode.properties.startDate.time}"/></span>
                </div>
                <c:if test="${not empty currentNode.properties.endDate}">
                    <div class="eventsTxtDate">
                        <span><fmt:message key='to'/></span>
                    </div>
                    <div class="eventsDate">
                        <meta itemprop="endDate" content="<fmt:formatDate pattern="yyyy-MM-dd" value="${currentNode.properties.startDate.time}"/>">
                        <span class="day"><fmt:formatDate pattern="dd" value="${currentNode.properties.endDate.time}"/></span>
                        <span class="month"><fmt:formatDate pattern="MM" value="${currentNode.properties.endDate.time}"/></span>
                        <span class="year"><fmt:formatDate pattern="yyyy" value="${currentNode.properties.endDate.time}"/></span>
                    </div>
                </c:if>
            </div>
            <div class="eventsBody"><!--start eventsBody -->
                <p class="eventsLocation"><span itemprop="location">${currentNode.properties.location.string}</span></p>
                <p class="eventsType"><span>${currentNode.properties.eventsType.string}</span></p>
                <h4><span itemprop="name"><jcr:nodeProperty node="${currentNode}" name="jcr:title"/></span></h4>

                <div class="eventsResume" itemprop="description">
                    ${currentNode.properties.body.string}</div>
                    <div class="eventsMeta">
        	    <span class="categoryLabel"><fmt:message key='label.categories'/>:</span>
                        <jcr:nodeProperty node="${currentNode}" name="j:defaultCategory" var="cat"/>
                        <c:if test="${cat != null}">
                                    <c:forEach items="${cat}" var="category">
                                        <span class="categorytitle">${category.node.properties['j:nodename'].string}</span>
                                    </c:forEach>

                        </c:if>
                    </div>
            </div>
            <!--start eventsBody -->
            <div class="clear"> </div>
        </div>