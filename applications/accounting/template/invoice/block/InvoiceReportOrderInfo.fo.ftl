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
<fo:table table-layout="fixed" width="100%" margin-top="0.3cm" space-after="0.3cm" border-style="solid">
    <fo:table-column column-width="100%"/>
    <fo:table-body>
        <fo:table-row>
            <fo:table-cell border-bottom-style="solid" padding-top="0.05cm" padding-bottom="0.05cm">
                <#-- Internal Order Number block -->
                <fo:block>
                    <fo:inline font-weight="bold">${uiLabelMap.AccountingReferenceNumber}: </fo:inline>
                    <fo:inline>${invoice.referenceNumber!}</fo:inline>
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
        <fo:table-row height="0.6cm">
            <fo:table-cell padding-top="0.05cm" padding-bottom="0.05cm">
                <#-- Comment block -->
                <fo:block>
                    <fo:inline font-weight="bold">${uiLabelMap.CommonComment}: </fo:inline>
                    <fo:inline>${comments!}</fo:inline>
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
  </fo:table-body>
</fo:table>
</#escape>
