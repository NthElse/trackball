import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import Qaterial 1.0 as Qaterial

Item {
    anchors.fill: parent
    anchors.margins: 10

    ListView {
        width: parent.width
        height: parent.height
        model: todoListModel
        delegate: TodoListItem {}
        spacing: 5
        ScrollBar.vertical: ScrollBar {}
    }
}
