import QtQuick 2.0
import QtQuick.Controls 2.5
import Qaterial 1.0 as Qaterial

Qaterial.Dialog {
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2
    title: qsTr("🖲️ About Trackball")
    Column {
        Qaterial.Label {
            text: "A <a href=\"http://todotxt.org/\">todo.txt</a> desktop app. Written in C++ & Qt Quick. <br/>"
            onLinkActivated: Qt.openUrlExternally(link)
        }
        Qaterial.LabelOverline {
            text: "Made with 🦄 by <a href=\"https://github.com/NthElse\">Nothing Else Lab.</a>"
            onLinkActivated: Qt.openUrlExternally(link)
        }
    }
}
