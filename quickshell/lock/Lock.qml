import QtQuick
import Quickshell
import Quickshell.Wayland
import QtQuick.Controls
import Quickshell.Services.Pam

Scope {
	WlSessionLock {
		id: lock
		locked: false

		WlSessionLockSurface {
			Rectangle {
				anchors.fill: parent
				color: "black"

				Column {
					anchors.centerIn: parent
					spacing: 10

					TextField {
						id: passwordField
						echoMode: TextInput.password
						placeholderText: "Password Input ..."
						onAccepted: {
							pam.respond(text);
							clear();
						}
					}

					Text {
						id: statusText
						color: "white"
						text: "Type password and press enter"
					}
				}
			}
		}
	}

	PamContext {
		id: pam
		config: "login"

		onResponseRequiredChange

		onCompleted: result => {
			if (this.responseRequired == true) {
				this.respond(root.currentText)
			}
		} 
	}
}
