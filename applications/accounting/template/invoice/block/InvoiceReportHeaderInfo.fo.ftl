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
<fo:table table-layout="fixed" width="100%" margin-top="0.3cm" space-after="0.3cm">
    <fo:table-column column-width="1.3in"/>
    <fo:table-column column-width="2.2in"/>
    <fo:table-body>
    <#-- Title -->
        <fo:table-row line-height="0.8cm">
            <fo:table-cell number-columns-spanned="2" background-color="${templateColor?default("#000")}" padding-top="0.1cm" display-align="center">
                <fo:block font-weight="bold" font-size="13pt" text-align="center" color="#FFFFFF">
                    <#if invoice.invoiceTypeId == "SALES_INVOICE" || invoice.invoiceTypeId == "PURCHASE_INVOICE">
                        ${uiLabelMap.AccountingInvoice?string?upper_case}
                    <#else>
                        ${uiLabelMap.AccountingInvoiceCredit?string?upper_case}
                    </#if>
                    ${invoice.invoiceId}
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
    <#-- Blank space -->
        <fo:table-row>
            <fo:table-cell number-columns-spanned="2" padding-top="0.5cm"><fo:block/></fo:table-cell>
        </fo:table-row>
    <#-- Order -->
        <fo:table-row border-top-style="solid" border-bottom-style="solid" border-width="2" font-size="13pt">
            <fo:table-cell padding-top="0.1cm" padding-left="0.05cm" font-weight="bold"><fo:block>${uiLabelMap.AccountingOrderNr?string?upper_case}:</fo:block></fo:table-cell>
            <fo:table-cell padding-top="0.1cm" font-weight="bold"><fo:block>${orderId!}</fo:block></fo:table-cell>
        </fo:table-row>
    <#-- Invoice date -->
        <fo:table-row border-bottom-style="solid">
            <fo:table-cell padding-left="0.05cm">
                <fo:block><#if invoice.invoiceTypeId == "SALES_INVOICE" || invoice.invoiceTypeId == "PURCHASE_INVOICE">${uiLabelMap.AccountingInvoiceDate}:<#else>${uiLabelMap.AccountingCreditNoteDate}:</#if></fo:block>
            </fo:table-cell>
            <fo:table-cell font-weight="bold"><fo:block><#if invoice.invoiceDate??>${invoice.invoiceDate?date}</#if></fo:block></fo:table-cell>
        </fo:table-row>
        <#if invoice.invoiceTypeId == "SALES_INVOICE" || invoice.invoiceTypeId == "PURCHASE_INVOICE">
        <#-- Due date -->
            <fo:table-row border-bottom-style="solid">
                <fo:table-cell padding-left="0.05cm"><fo:block>${uiLabelMap.AccountingDueDate}:</fo:block></fo:table-cell>
                <fo:table-cell font-weight="bold"><fo:block><#if invoice.dueDate??>${invoice.dueDate?date}</#if></fo:block></fo:table-cell>
            </fo:table-row>
        <#-- Payment Term -->
            <#if paymentTerm??>
                <fo:table-row border-bottom-style="solid">
                    <fo:table-cell padding-left="0.05cm"><fo:block>${uiLabelMap.AccountingPaymentTerm}:</fo:block></fo:table-cell>
                    <fo:table-cell><fo:block>${paymentTerm!}</fo:block></fo:table-cell>
                </fo:table-row>
            </#if>
        <#-- Payment method -->
            <#if paymentMode??>
                <fo:table-row border-bottom-style="solid">
                    <fo:table-cell padding-left="0.05cm"><fo:block>${uiLabelMap.AccountingPaymentMethod}:</fo:block></fo:table-cell>
                    <fo:table-cell><fo:block>${paymentMode}</fo:block></fo:table-cell>
                </fo:table-row>
            </#if>
        </#if>
    </fo:table-body>
</fo:table>
</#escape>
