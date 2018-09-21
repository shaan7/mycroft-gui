import QtQuick 2.4
import QtQuick.Controls 2.2 as Controls
import org.kde.kirigami 2.4 as Kirigami

DelegateBase {
    id: control

    //this to make all items children of the scrollview item so everything will have paddings automagically
    default property alias data: main.contentData

    leftPadding: main.mainItem.hasOwnProperty("contentHeight") ? 0 : Kirigami.Units.largeSpacing
    topPadding: main.mainItem.hasOwnProperty("contentHeight") ? 0 : Kirigami.Units.largeSpacing
    rightPadding: main.mainItem.hasOwnProperty("contentHeight") ? 0 : Kirigami.Units.largeSpacing
    bottomPadding: main.mainItem.hasOwnProperty("contentHeight") ? 0 : Kirigami.Units.largeSpacing

    Component.onCompleted: main.contentItem.clip = false
    contentItem: Controls.ScrollView {
        id: main
        contentWidth: width
        clip: false
        //if mainItem is == contentItem then the main item is a flickable, otherwise is auto created internally
        property Item mainItem: contentChildren[contentChildren.length-1]

        contentHeight: mainItem.hasOwnProperty("contentHeight") ? mainItem.contentHeight : mainItem.height
    }
}
