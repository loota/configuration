PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE gesture_mappings (type INTEGER, name TEXT, command TEXT, direction TEXT);
INSERT INTO "gesture_mappings" VALUES(1,'','Browser:Back','L');
INSERT INTO "gesture_mappings" VALUES(1,'','Browser:Forward','R');
INSERT INTO "gesture_mappings" VALUES(1,'','Browser:ReloadSkipCache','D');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:GoUpperLevel','DU');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:IncrementURL','RURU');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:DecrementURL','RDRD');
INSERT INTO "gesture_mappings" VALUES(1,'','cmd_newNavigator','DRU');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:MinimizeWindow','RUD');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:MaximizeWindow','RDU');
INSERT INTO "gesture_mappings" VALUES(1,'','View:FullScreen','RDLU');
INSERT INTO "gesture_mappings" VALUES(1,'','cmd_close','DR');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:UndoCloseTab','DL');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:PreviousTab','UL');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:NextTab','UR');
INSERT INTO "gesture_mappings" VALUES(1,'','cmd_textZoomReset','LRUD');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:ScrollTop','LU');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:ScrollBottom','LD');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:ShowOnlyThisFrame','LDR');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:OpenFrameInTab','LDRU');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:OpenLinkInFgTab','U');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:SaveImage','DLD');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:SaveImageNow','DRD');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:WebSearch','LRU');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:OpenLinksInSelection','LUR');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:Preferences','LDRUL');
INSERT INTO "gesture_mappings" VALUES(1,'','Browser:ShowAllTabs','RL');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:ClosedTabsPopup','UDU');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:HybridViewSource','DUD');
INSERT INTO "gesture_mappings" VALUES(2,'Clear search bar and find bar, hide find bar','gFindBar.getElement("findbar-textbox").value = '''';
gFindBar.close();

document.getElementById("searchbar").value = '''';','LR');
INSERT INTO "gesture_mappings" VALUES(2,'Switch window','var windowManager = Components.classes[''@mozilla.org/appshell/window-mediator;1'']
                                      .getService(Components.interfaces.nsIWindowMediator);
var windows = windowManager.getEnumerator("navigator:browser");

while (windows.hasMoreElements()) {
  windows.getNext().focus();
}','LUL');
INSERT INTO "gesture_mappings" VALUES(2,'Toggle search bar','if (gFindBar.hidden) {
  gFindBar.open();
} else {
  gFindBar.close();
}','LRL');
INSERT INTO "gesture_mappings" VALUES(2,'Toggle Firebug window','var evt = document.createEvent("KeyEvents");
evt.initKeyEvent(
  "keypress",
  true,
  true,
  null,
  false,  // holds Ctrl key
  false,  // holds Alt key
  false,  // holds Shift key
  false,  // holds Meta key
  evt.DOM_VK_F12,  // presses a special key, @see http://mxr.mozilla.org/mozilla/source/dom/public/idl/events/nsIDOMKeyEvent.idl
  0  // presses a normal key, e.g. "A".charCodeAt(0),
);
document.documentElement.dispatchEvent(evt);','UD');
INSERT INTO "gesture_mappings" VALUES(2,'Open URL from clipboard','const IN_NEW_TAB = true;
const IN_BACKGROUND = false;

var str = readFromClipboard();
if (!str)
  return;
if (IN_NEW_TAB)
  gBrowser.loadOneTab(str, null, null, null, IN_BACKGROUND, false);
else
  gBrowser.loadURI(str);','RD');
INSERT INTO "gesture_mappings" VALUES(2,'Find selection in page','gFindBar.open();
gFindBar._findField.value = FireGestures.getSelectedText();
// On The second _find() is done because on the first time searching for the selection
// the selection itself is found. It is odd that this works and does not search every
// other term.
gFindBar._find();
gFindBar._find();
gFindBar.onFindAgainCommand();
','LRD');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:BFHistoryPopup','wheel-up');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:AllTabsPopup','wheel-down');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:PreviousTab','rocker-left');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:NextTab','rocker-right');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:OpenHoveredLinks','keypress-ctrl');
INSERT INTO "gesture_mappings" VALUES(1,'','FireGestures:SaveHoveredLinks','keypress-shift');
COMMIT;
