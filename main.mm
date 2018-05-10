table=@[@"13800138000"];
NSString* nowRecept = table[0];  

IMAccountController* _kcls = [NSClassFromString(@"IMAccountController") sharedInstance];
IMAccount* account = (IMAccount*)[_kcls __ck_bestAccountForAddress: nowRecept];
DebugPrint(@"recept account %@", account);
NSArray * accounts = [NSArray arrayWithObjects:&nowRecept count:1];
IMHandle* handle = [account __ck_handlesFromAddressStrings:accounts];
CKConversationList * convs = [NSClassFromString(@"CKConversationList") sharedConversationList];
DebugPrint(@"convs %@", convs);
CKConversation* conv = [convs conversationForHandles:handle displayName:nil joinedChatsOnly:YES create:YES];
DebugPrint(@"conv %@", conv);

NSAttributedString* text = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"Hello whats the fuck text ...."]];
CKComposition* composition = [[NSClassFromString(@"CKComposition") alloc] initWithText:text subject:nil];

id with = [conv messageWithComposition:composition];
DebugPrint(@"with type [%@] %@", getObjectTypeName(with), with);
[conv sendMessage:with newComposition:YES];
