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
<#-- Totals -->
<fo:table table-layout="fixed" width="100%" margin-top="0.6cm" space-after="0.3cm" font-size="8pt">
    <fo:table-column column-width="proportional-column-width(1)"/>
    <fo:table-column column-width="14.4cm"/>
    <fo:table-body>
      <fo:table-row >
        <fo:table-cell><fo:block/></fo:table-cell>
        <fo:table-cell>
          <fo:table table-layout="fixed" width="100%" border-style="solid" border-width="2">
            <fo:table-column column-width="20%"/><#-- taxable amount -->
            <fo:table-column column-width="15%"/><#-- VAT percentage -->
            <fo:table-column column-width="15%"/><#-- VAT amount -->
            <fo:table-column column-width="25%"/><#-- total -->
            <fo:table-column column-width="25%"/><#-- net to pay -->
            <fo:table-header text-align="center">
              <fo:table-row line-height="0.8cm">
                <fo:table-cell border-style="solid" border-width="1" display-align="center"><fo:block>${uiLabelMap.AccountingTotalHT}</fo:block></fo:table-cell>
                <fo:table-cell border-style="solid" border-width="1" display-align="center"><fo:block>${uiLabelMap.AccountingVatPourcentage}</fo:block></fo:table-cell>
                <fo:table-cell border-style="solid" border-width="1" display-align="center"><fo:block>${uiLabelMap.AccountingTotalTax}</fo:block></fo:table-cell>
                <fo:table-cell border-style="solid" border-width="1" display-align="center"><fo:block>${uiLabelMap.CommonTotal}</fo:block></fo:table-cell>
                <fo:table-cell border-left-style="solid" border-left-width="1" display-align="center" font-weight="bold">
                    <fo:block>${uiLabelMap.AccountingNetToPay}</fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-header>
            <fo:table-body>
              <fo:table-row line-height="0.6cm">
                <fo:table-cell border-style="solid" border-left-width="1" number-rows-spanned="2" display-align="center"><fo:block text-align="center"><#if invoiceNoTaxTotal??>${invoiceNoTaxTotal?string(",##0.00")}</#if></fo:block></fo:table-cell>
                <fo:table-cell border-style="solid" border-left-width="1" number-rows-spanned="2" display-align="center"><fo:block text-align="center"><#if vatPourcentage??>${vatPourcentage} %<#else> - </#if></fo:block></fo:table-cell>
                <fo:table-cell border-style="solid" border-left-width="1" number-rows-spanned="2" display-align="center"><fo:block text-align="center"><#if invoiceTaxTotal??>${invoiceTaxTotal?string(",##0.00")}</#if></fo:block></fo:table-cell>
                <fo:table-cell border-style="solid" border-left-width="1" number-rows-spanned="2" display-align="center"><fo:block text-align="center" font-weight="bold"><#if invoiceTotal??>${invoiceTotal?string(",##0.00")}</#if></fo:block></fo:table-cell>
                <fo:table-cell border-style="solid" border-left-width="1" background-color="${templateColor?default("#000")}"><fo:block text-align="center" font-weight="bold" color="#FFFFFF"><#if invoiceTotalNotApplied??>${invoiceTotalNotApplied!string(",##0.00")}</#if></fo:block></fo:table-cell>
              </fo:table-row>
              <fo:table-row line-height="0.4cm">
                <fo:table-cell border-left-style="solid" border-left-width="1"><fo:block text-align="center">${uiLabelMap.AccountingDeposit} <fo:inline text-align="center"><#if invoice.dueDate??>${invoice.dueDate?date}</#if></fo:inline></fo:block></fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>
        </fo:table-cell>
    </fo:table-row>
  </fo:table-body>
</fo:table>
</#escape>
