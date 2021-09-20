import QtQuick 2.0
import QtQuick.Controls 2.5
import Qaterial 1.0 as Qaterial

Item {
    ListModel {
        id: mymodel
        ListElement {
            name: "Bill Smith"
            number: "555 3264"
        }
        ListElement {
            name: "John Brown"
            number: "555 8426"
        }
        ListElement {
            name: "Sam Wise"
            number: "555 0473"
        }
    }


    Column {
        anchors.fill: parent
        spacing: 4
        Repeater {
            width: parent.width
            model: mymodel
            delegate: TodoListItem {}
        }
    }
}
