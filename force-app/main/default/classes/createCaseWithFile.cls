public with sharing class createCaseWithFile {

    //SELECT SELECT LinkedEntityId FROM ContentDocumentLink WHERE ContentDocumentID = '0695e000005UVdOAAW' Retorna o id do caso que está associado por determinado file

    public static void createAssociatedCaseWithFile(List<ContentDocumentLink> lstContentDocument){
        if (String.valueOf(lstContentDocument[0].LinkedEntityId).startsWith('005')) {
            Case createCase = new Case(Origin='Web', Status='New', CurrencyIsoCode='BRL');
            insert createCase;
            ContentDocumentLink newContentDocumentLink = new ContentDocumentLink();
            newContentDocumentLink.ContentDocumentId = lstContentDocument[0].ContentDocumentId;
            newContentDocumentLink.LinkedEntityId = createCase.Id;
            newContentDocumentLink.ShareType = 'V';
            newContentDocumentLink.Visibility = 'AllUsers';
            insert newContentDocumentLink;
        }
    }
}
