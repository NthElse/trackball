import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Qaterial 1.0 as Qaterial

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
        anchors.margins: 10

        Row {
            Qaterial.OutlineButton {
                text: "Create"
                id: createOutButton
                icon.source: Qaterial.Icons.plus
            }
            Qaterial.OutlineButton {
                text: "Search"
                id: searchOutButton
                icon.source: Qaterial.Icons.magnify
            }
        }

        TodoList {
            id: todoList
            clip: true
            height: parent.height
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
