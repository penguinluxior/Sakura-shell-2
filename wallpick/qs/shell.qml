
import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland

ShellRoot {
    id: shellRoot

    Component.onCompleted: Quickshell.execDetached(["mkdir", "-p", Config.thumbsDir])

    PanelWindow {
        id: masterWindow

        anchors {
            top: true
            bottom: true
            left: true
            right: true
        }

        color: "transparent"

        WlrLayershell.namespace: "wallpick"
        WlrLayershell.layer: WlrLayer.Overlay
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive
        exclusionMode: ExclusionMode.Ignore

        Rectangle {
            anchors.fill: parent
            color: Config.colors.backdrop

            MouseArea {
                anchors.fill: parent
                onClicked: Qt.quit()
            }
        }

        Picker {
            id: picker
            anchors.fill: parent
            focus: true

            onApplyRequested: path => {
                applyProc.command = [
                    "bash",
                    Config.home + "/.config/wallpick/apply-with-matugen.sh",
                    Config.appDir + "/scripts/apply.sh",
                    path,
                    Config.screen,
                    Config.transition
                ]

                applyProc.running = true
            }

            onCloseRequested: Qt.quit()
        }
    }

    Process {
        id: applyProc

        stderr: StdioCollector {
            onStreamFinished: {
                if (this.text.trim() !== "")
                    console.warn("wallpick:", this.text.trim())
            }
        }

        stdout: StdioCollector {
            onStreamFinished: {
                if (this.text.trim() !== "")
                    console.log("wallpick:", this.text.trim())
            }
        }
    }
}
