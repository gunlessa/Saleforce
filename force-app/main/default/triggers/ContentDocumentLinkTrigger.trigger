trigger ContentDocumentLinkTrigger on ContentDocumentLink (after insert) {
    if (Trigger.isInsert) {
        if (Trigger.isAfter) { 
            createCaseWithFile.createAssociatedCaseWithFile(Trigger.new);
        } 
    }
}