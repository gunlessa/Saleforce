public with sharing class createCaseWithFile {

    public static void createAssociatedCaseWithFile(List<ContentDocumentLink> lstContentDocument){
        List<ContentDocument> lstFileSettings = new List<ContentDocument>();
        Map<String, Case> mapIdContentDocument = new Map<String, Case>();
        List<String> lstValidDocLinkId = new List<String>();
        for (ContentDocumentLink iDocLink : lstContentDocument) {
            if (String.valueOf(iDocLink.LinkedEntityId).startsWith('005')) {
                lstValidDocLinkId.add(iDocLink.ContentDocumentId);
            }
        }
        if (!lstValidDocLinkId.isEmpty()) {
            lstFileSettings = [SELECT Id, Title, ContentSize, FileExtension FROM ContentDocument WHERE Id IN: lstValidDocLinkId];
        }
        if (!lstFileSettings.isEmpty()) {
            for (ContentDocument iDoc : lstFileSettings) {
                String strFileSettings = 'ID = ' + iDoc.id +' Title = '+ iDoc.Title +' ContentSize = '+ iDoc.ContentSize +' FileExtension = '+ iDoc.FileExtension;
                Case createCase = new Case(Origin='Web', Status='New', CurrencyIsoCode='BRL', AttachmentInformation__c=strFileSettings);
                mapIdContentDocument.put(iDoc.Id, createCase);
            }
            if (mapIdContentDocument.values().isEmpty()) {
                return;
            }
            Database.insert(mapIdContentDocument.values());
            List<ContentDocumentLink> lstCreatedContentDocumentLink = new List<ContentDocumentLink>();
            for (String iDocId : mapIdContentDocument.keySet()) {
                ContentDocumentLink newContentDocumentLink = new ContentDocumentLink();
                newContentDocumentLink.ContentDocumentId = iDocId;
                newContentDocumentLink.LinkedEntityId = mapIdContentDocument.get(iDocId).Id;
                newContentDocumentLink.ShareType = 'V';
                newContentDocumentLink.Visibility = 'AllUsers';
                lstCreatedContentDocumentLink.add(newContentDocumentLink);
            }
            if (!lstCreatedContentDocumentLink.isEmpty()) {
                Database.insert(lstCreatedContentDocumentLink);
            }
        }
    }

    /*@AuraEnabled(cacheable=true)
    public static List<ContentDocument> fileSettingsMethod(List<ContentDocumentLink> lstContentDocument){
        List<ContentDocument> lstFileSettings = new List<ContentDocument>();
        lstFileSettings = [SELECT ContentSize FROM ContentDocument WHERE Id IN: lstValidDocLinkId];
    }*/
}
