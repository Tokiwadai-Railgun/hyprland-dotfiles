import Quickshell
import Quickshell.Services.UPower
import Quickshell.Widgets
import QtQuick.Layouts
import QtQuick

RowLayout {
		spacing: 2
    readonly property color col: battery <= 20 ? root.red : root.colFg
		readonly property int battery: Math.round(UPower.displayDevice?.percentage * 100 ?? 0)

		WrapperRectangle {
				color: "transparent"
				implicitWidth: 35
				implicitHeight: 20
				border.color: col
				border.pixelAligned: true
				border.width: 1

				Item {
						Rectangle {
								anchors.left: parent.left
								anchors.top: parent.top
								anchors.bottom: parent.bottom
								anchors.margins: 2
								width: (parent.width - 4) * (battery / 100)
								color: col
								opacity: 0.6 
						}
						Text {
								anchors.centerIn: parent
								text: battery + "%"
								color: col
								font { family: root.fontFamily; pixelSize: 11; bold: true }
						}
				}

		}

		Rectangle {
				color: col
				width: 4
				height: 12
		}
}
