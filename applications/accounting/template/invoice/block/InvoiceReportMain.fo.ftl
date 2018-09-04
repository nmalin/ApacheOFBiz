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
<#if !multiInvoice?has_content>
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" font-family="Helvetica">

    <fo:layout-master-set>
        <fo:simple-page-master master-name="main-page"
              page-width="21cm" page-height="29.7cm"
              margin-top="1.2cm" margin-bottom="1.2cm"
              margin-left="1cm" margin-right="1cm">
            <#-- main body -->
            <fo:region-body margin-top="12cm" margin-bottom="1cm"/>
            <#-- the header -->
            <fo:region-before extent="2.5cm"/>
            <#-- the footer -->
            <fo:region-after extent="2.5cm"/>
        </fo:simple-page-master>
        <fo:simple-page-master master-name="main-page-landscape"
              page-width="21cm" page-height="29.7cm"
              margin-top="1.2cm" margin-bottom="1.2cm"
              margin-left="1.2cm" margin-right="1.2cm"
              reference-orientation="90">
            <#-- main body -->
            <fo:region-body margin-top="12cm" margin-bottom="1.2cm"/>
            <#-- the header -->
            <fo:region-before extent="2.5cm"/>
            <#-- the footer -->
            <fo:region-after extent="2.5cm"/>
        </fo:simple-page-master>
    </fo:layout-master-set>
</#if>

    <fo:page-sequence master-reference="${pageLayoutName?default("main-page")}">

        <#-- Header -->
        <#-- The elements it it are positioned using a table composed by one row
             composed by two cells (each 50% of the total table that is 100% of the page):
             in the left side cell the "topLeft" template is included
             in the right side cell the "topRight" template is included
        -->
        <fo:static-content flow-name="xsl-region-before">
            <fo:table table-layout="fixed" width="100%" font-size="8pt">
                <fo:table-column column-number="1" column-width="proportional-column-width(48)"/>
                <fo:table-column column-number="2" column-width="proportional-column-width(4)"/>
                <fo:table-column column-number="3" column-width="proportional-column-width(48)"/>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell>
${sections.render("topColumn1")}
                        </fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell>
${sections.render("topColumn2")}
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell>
${sections.render("shipping")}
                        </fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell>
${sections.render("billing")}
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row >
                        <fo:table-cell number-columns-spanned="3">
${sections.render("headerBottom")}
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:static-content>

        ${sections.render("footer")}

        <#-- the body -->
        <fo:flow flow-name="xsl-region-body">
        ${sections.render("body")}
            <fo:block id="theEnd"/>  <#-- marks the end of the pages and used to identify page-number at the end -->
        </fo:flow>
    </fo:page-sequence>
<#if !multiInvoice?has_content>
</fo:root>
</#if>
