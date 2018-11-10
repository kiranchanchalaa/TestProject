trigger AccountTrigger on Account (after insert,after update,before insert,before update) {
    TriggerFactory.createAndExecuteHandler(AccountHandler.class);
}