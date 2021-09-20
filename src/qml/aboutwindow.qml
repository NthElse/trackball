import QtQuick 2.0
import QtQuick.Controls 2.5
import Qaterial 1.0 as Qaterial

Qaterial.Dialog {
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2
    title: qsTr("🖲️ About Trackball")
    Qaterial.Label {
        text: "Made with 🦄 by Nothing Else Lab."
    }
}
