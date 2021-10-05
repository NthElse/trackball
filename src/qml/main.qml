import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Qaterial 1.0 as Qaterial

// Qt.labs in Qaterial
// for windeployqt
import Qt.labs.platform 1.1
import Qt.labs.settings 1.0
import Qt.labs.folderlistmodel 2.14

Qaterial.ApplicationWindow {
    id: window

    width: 500
    height: 300

    minimumWidth: 100
    minimumHeight: 100

    menuBar: Qaterial.MenuBar {
        Qaterial.Menu {
            title: qsTr("File")
            Qaterial.MenuItem {
                text: qsTr("Quit")
                onTriggered: Qt.quit()
            }
            Qaterial.MenuSeparator {}
            Qaterial.MenuItem {
                text: "Style"
                onTriggered: themeDialog.open()
            }
        }
        Qaterial.Menu {
            title: qsTr("Help")
            Qaterial.MenuItem {
                text: qsTr("About")
                onTriggered: aboutWindow.open()
            }
        }
    }

    Column {
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10

        Row {
            id: toolbar
            Qaterial.SquareButton {
                id: createSquareButton
                icon.source: Qaterial.Icons.plus
            }
            Qaterial.SquareButton {
                id: searchSquareButton
                icon.source: Qaterial.Icons.magnify
            }
        }

        TodoList {
            id: todoList
            clip: true
            height: parent.height-toolbar.height-5
            width: parent.width
        }
    }

    Qaterial.FabButton {
        id: createButton
        icon.source: Qaterial.Icons.plus

        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 20

        highlighted: true
        enabled: true
        enabledScale: true
        extendedOnHovered: true
    }

    // Save and restore x, y, width, height
    Qaterial.WindowLayoutSave {}

    AboutWindow {
        id: aboutWindow
        width: window.width * 0.8
    }

    Qaterial.StyleSettingsDialog {
        id: themeDialog
        width: window.width * 0.8
    }
}
