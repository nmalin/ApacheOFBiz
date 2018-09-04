<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->
<#escape x as x?xml>
<fo:table table-layout="fixed" width="100%" margin-top="0.5cm" space-after="0.2cm" border-style="solid" border-color="${templateColor?default("#000")}">
    <fo:table-column column-width="100%"/>
<fo:table-body>
    <fo:table-row height="0.6cm">
        <fo:table-cell background-color="${templateColor?default("#000")}" display-align="center">
            <fo:block color="#FFFFFF" font-size="10pt" font-weight="bold" text-align="center">${uiLabelMap.PartyShippingAddress?string?upper_case}:</fo:block>
        </fo:table-cell>
    </fo:table-row>
    <fo:table-row>
        <fo:table-cell padding-left="0.1cm" padding-top="0.1cm">
        <#if sendingAddress??>
            ${setContextField("postalAddress", sendingAddress)}
            ${screens.render("component://accounting/widget/AccountingPrintScreens.xml#postalAddressPdfFormatter")}
        <#else>
        <fo:block>${uiLabelMap.AccountingNoGenBilAddressFound} ${sendingParty.partyId!}</fo:block>
        </#if>
        <fo:block padding-top="0.2cm"/>
        <#if shippingPhone??><fo:block>${uiLabelMap.CommonTelephoneAbbr}: ${shippingPhone.phoneNumber!}</fo:block></#if>
        <#if shippingEmail??><fo:block>${uiLabelMap.CommonEmail}: ${shippingEmail.infoString!}</fo:block></#if>
        </fo:table-cell>
    </fo:table-row>
  </fo:table-body>
</fo:table>
<fo:block><fo:inline border-bottom-style="solid" font-weight="bold">${uiLabelMap.AccountingShippingInfo}:</fo:inline></fo:block>
 <#if shipDate??><fo:block>${uiLabelMap.AccountingShipDate}: ${shipDate?date}</fo:block></#if>
 <#if incoterm??><fo:block>${uiLabelMap.AccountingIncoterm} ${incoterm}</fo:block></#if>
</#escape>
