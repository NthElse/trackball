import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import Qaterial 1.0 as Qaterial

Item {
    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: 10
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        width: parent.width
        spacing: 20
        Repeater {
            model: todoListModel
            delegate: TodoListItem {}
        }
    }
}
