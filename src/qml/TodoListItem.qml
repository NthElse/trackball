import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Qaterial 1.0 as Qaterial

Item {
    width: parent.width
    height: 50

    Rectangle {
        id: bg
        width: parent.width
        height: parent.height
        color: "#FAFAFA"
        radius: 3
        MouseArea {
            hoverEnabled: true
            anchors.fill: parent
            onHoveredChanged: {
                bg.color = containsMouse ? "#F5F5F5" : "#FAFAFA"
            }
            RowLayout {
                anchors.verticalCenter: parent.verticalCenter
                Qaterial.CheckButton {
                    checked: finished
                }
                Qaterial.Icon {
                    icon: if (priority == "A") {
                              Qaterial.Icons.alphaACircle
                          } else if (priority == "B") {
                              Qaterial.Icons.alphaBCircle
                          } else if (priority == "C") {
                              Qaterial.Icons.alphaCCircle
                          }
                    size: 36
                    color: if (priority == "A") {
                               "#E91E63"
                           } else if (priority == "B") {
                               "#FFC107"
                           } else if (priority == "C") {
                               "#2196F3"
                           }
                }
                Label {
                    text: description
                }
            }
        }
    }
}
