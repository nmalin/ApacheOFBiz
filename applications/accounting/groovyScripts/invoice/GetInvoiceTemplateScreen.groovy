/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */


import org.apache.ofbiz.base.util.Debug
import org.apache.ofbiz.entity.GenericValue
import org.apache.ofbiz.entity.condition.EntityConditionBuilder
import org.apache.ofbiz.entity.util.EntityTypeUtil
import org.apache.ofbiz.entity.util.EntityUtil

GenericValue invoice = from('Invoice').where(context).cache().queryOne()
String screenName = 'DefaultInvoicePDF'
String screenLocation = 'component://accounting/widget/AccountingPrintScreens.xml'
if (invoice) {
    String organizationPartyId = invoice.partyIdFrom
    if (EntityTypeUtil.hasParentType(delegator, 'InvoiceType', 'invoiceTypeId',
            invoice.invoiceTypeId, 'parentTypeId', 'PURCHASE_INVOICE')) {
        organizationPartyId = partyId
    }
    EntityConditionBuilder exprBldr = new EntityConditionBuilder()
    conditions = exprBldr.AND {
        EQUALS(partyId: organizationPartyId)
        EQUALS(invoiceTypeId: invoice.invoiceTypeId)
    }
    List<GenericValue> partyPrefDocTypeTplAndCustomScreens = select().from('PartyPrefDocTypeTplAndCustomScreen').where(conditions).cache().queryList()
    GenericValue partyPrefDocTypeTplAndCustomScreen = EntityUtil.getFirst(EntityUtil.filterByDate(partyPrefDocTypeTplAndCustomScreens, invoice.invoiceDate))
    if (partyPrefDocTypeTplAndCustomScreen) {
        screenLocation = partyPrefDocTypeTplAndCustomScreen.customScreenLocation;
        screenName = partyPrefDocTypeTplAndCustomScreen.customScreenName;
        if (Debug.infoOn()) {
            logInfo("found custom template for ${organizationPartyId}, ${screenLocation}#${screenName}")
        }
    }
}
context.screenName = screenName
context.screenLocation = screenLocation