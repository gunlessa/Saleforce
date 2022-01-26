trigger ContentDocumentLinkTrigger on ContentDocumentLink (after insert, before insert) {
    if (Trigger.isInsert) {
        /*if (Trigger.isAfter) { 
            createCaseWithFile.createAssociatedCaseWithFile(Trigger.new);
        }else*/ if(Trigger.isBefore) {
            createCaseWithFile.fileSettingsMethod(Trigger.new);
        }
    }
}