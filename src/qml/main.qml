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

    TodoList {
        width: window.width
        id: todoList
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
