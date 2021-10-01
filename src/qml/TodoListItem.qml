import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.12
import Qaterial 1.0 as Qaterial

Item {
    width: parent.width-20
    height: 50

    Rectangle {
        id: bg
        width: parent.width
        height: parent.height
        color: mouseArea.containsMouse ? Qaterial.Style.colorTheme.background1 : Qaterial.Style.colorTheme.background12
        border.color: Qaterial.Style.dividersColor()
        border.width: 1
        radius: Qaterial.Style.card.radius
        layer.enabled: mouseArea.containsMouse
        layer.effect: Qaterial.ElevationEffect {
            elevation: 1
        }
        MouseArea {
            id: mouseArea
            hoverEnabled: true
            anchors.fill: parent

            RowLayout {
                anchors.verticalCenter: parent.verticalCenter
                Qaterial.CheckButton {
                    checked: finished
                    spacing: 0
                    verticalPadding: 0
                }
                Qaterial.Label {
                    text: if (priority) { "<b>(" + priority + ")</b>" }
                    font.family: "Lato"
                    color: if (priority == "A") {
                               Qaterial.Colors.red
                           } else if (priority == "B") {
                               Qaterial.Colors.orange
                           } else if (priority == "C") {
                               Qaterial.Colors.blue
                           }
                }
                Qaterial.Label {
                    text: description
                    font.family: "Lato"
                }
            }
        }
    }
}
