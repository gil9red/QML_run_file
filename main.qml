import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.0

Window {
    width: 300
    height: 300
    visible: true

    RowLayout {
        anchors.leftMargin: 8
        anchors.topMargin: 8
        anchors.rightMargin: 8
        anchors.bottomMargin: 8
        anchors.fill: parent

        TextField {
            id: fileNameTextField
            placeholderText: qsTr("Text Field")
        }

        Button {
            id: openButton
            text: qsTr("...")
            Layout.preferredHeight: 23
            Layout.preferredWidth: 24
            implicitWidth: parent.width

            onClicked: fileDialog.open()

            FileDialog {
                id: fileDialog
                folder: "."
                title: qsTr("Choose a file to open")
                selectMultiple: true
                nameFilters: [ qsTr("All files (*.*)") ]

                onAccepted: {
                    var fileName = fileUrl.toString();

                    // remove prefixed "file:///"
                    fileName = fileName.replace(/^(file:\/{3})/,"");

                    // unescape html codes like '%23' for '#'
                    fileName = decodeURIComponent(fileName);

                    fileNameTextField.text = fileName;
                    console.log(fileName);
                }

                onRejected: fileDialog.close()
            }
        }

        Button {
            id: runButton
            text: qsTr("Run")
            Layout.preferredHeight: 23
            Layout.preferredWidth: 86
            implicitWidth: parent.width

            onClicked: {
                Util.run(fileNameTextField.text);
            }
        }
    }
}
