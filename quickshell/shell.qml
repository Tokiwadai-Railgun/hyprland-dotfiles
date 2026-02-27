# test quickshell
import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Services.UPower
import Quickshell.Widgets
import "components"

PanelWindow {
		id: root
		property color colBg: "#dad4bb"
		property color colFg: "#504d44"
		property color colSecondaryBg: "#4e4b42"
		property color colSelectedBg: "#4e4b42"
		property color colSelectedFg: "#c2bca5"

		property color red: "#cd664d"
		property color blue: "#56949f"
		property color yellow: "#f8ecaf"
		property color green: "#286983"

		property string fontFamily: "HermutNerdFont"
		property var numbers: ["一", "二", "三", "四", "五", "六", "七", "八", "九"]
		implicitHeight: 30

		color: "transparent"

		anchors {
				top: true
				left: true
				right: true
		}

		RowLayout {
				anchors.fill: parent
				anchors.margins: 8
				BatteryInfo {}

				Repeater {
						model: 9

						WrapperRectangle {
								property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
								property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)

								implicitWidth: 40
								color: isActive ? colSelectedBg : "transparent"

								Text {
										anchors.fill: parent
										text: numbers[index]
										// text: index + 1
										color: isActive ? red : (ws ? blue : colFg)
										font { pixelSize: 12; bold: true }



										MouseArea {
												anchors.fill: parent
												onClicked: Hyprland.dispatch("workspace " + (index + 1))
										}
								}
						}
				}

				Item { Layout.fillWidth: true }

		}

}
