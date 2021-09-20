import QtQuick 2.0
import QtQuick.Controls 2.5
import Qaterial 1.0 as Qaterial

Component {
    Item {
        width: 180
        height: 40
        Column {
            Text {
                text: '<b>Name:</b> ' + name
            }
            Text {
                text: '<b>Number:</b> ' + number
            }
        }
    }
}
