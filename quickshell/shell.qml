import Quickshell
import Quickshell.Io
import QtQuick
import "notifications"
import "bar"


Scope {
	Bar {}
	NotificationPopup { theme: DefaultTheme {} }
}
