trigger caseWithFile on ContentDocument (after insert) {
    createCaseWithFile.createAssociatedCaseWithFile();
    //Integer arquiveSize = Trigger.New.size();
}