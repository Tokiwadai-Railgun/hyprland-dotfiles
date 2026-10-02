// TODO: Change this theme to fit nier automata verison
import QtQuick

QtObject {
  readonly property color bgBase: "#cdc8b0"
  readonly property color bgSurface: "#dad4bb"
  readonly property color bgOverlay: "#d5d1bc"
  readonly property color bgHover: "#635f54"
  readonly property color bgSelected: "#48463d"
  readonly property color bgBorder: "#b1ac97"

  readonly property color textPrimary: "#403f34"
  readonly property color textSecondary: "#48493C"
  readonly property color textMuted: "#757160"

  readonly property color accentPrimary: "#48463d"
  readonly property color accentCyan: "#7a8c6e"
  readonly property color accentGreen: "#7a8c6e"
  readonly property color accentOrange: "#cd664d"
  readonly property color accentRed: "#cd664d"

  readonly property color urgencyLow: textMuted
  readonly property color urgencyNormal: accentPrimary
  readonly property color urgencyCritical: accentRed
  readonly property color batteryGood: accentGreen
  readonly property color batteryWarning: accentOrange
  readonly property color batteryCritical: accentRed

  readonly property var themes: []
  readonly property int currentIndex: 0
  readonly property string currentName: "YoRHa"
  readonly property string currentFamily: "YoRHa"
  readonly property int count: 0
  function setTheme(index) {}
}
