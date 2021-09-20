import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import Qaterial 1.0 as Qaterial

Item {
    ListModel {
        id: mymodel
        ListElement {
            finished: false
            priority: "A"
            desc: "做语文作业"
        }
        ListElement {
            finished: false
            priority: "B"
            desc: "Do English homework"
        }
        ListElement {
            finished: true
            priority: "C"
            desc: "1+1=2"
        }
        ListElement {
            finish: true
            desc: "s=vt"
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: 10
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        width: parent.width
        spacing: 20
        Repeater {
            model: mymodel
            delegate: TodoListItem {}
        }
    }
}
