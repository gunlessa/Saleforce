public with sharing class createCaseWithFile {
    
    //SELECT SELECT LinkedEntityId FROM ContentDocumentLink WHERE ContentDocumentID = '0695e000005UVdOAAW' Retorna o id do caso que está associado por determinado file
    
    public static void createAssociatedCaseWithFile(){
        // List <ContentDocument> fileSettings = [SELECT Id, FileExtension, ContentSize FROM ContentDocument WHERE ContentModifiedDate != null];
        Case createCase = new Case(Origin='Web', Status='New', CurrencyIsoCode='BRL');
        insert createCase;
        List <ContentDocument> fileSettings = (List <ContentDocument>)Trigger.new; //Casting para tranformar o resultado da trigger virar o objeto ContentDocument.
    }
}
