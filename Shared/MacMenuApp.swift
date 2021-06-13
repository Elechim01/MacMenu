//
//  MacMenuApp.swift
//  Shared
//
//  Created by Michele Manniello on 13/06/21.
//

import SwiftUI

@main
struct MacMenuApp: App {
//    Connecting App Delegate..
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
//Going to Build Menù Button and Pop Over Menu.....
class  AppDelegate : NSObject,NSApplicationDelegate {
//    Status Bar Item...
    var statusItem : NSStatusItem?
//    PopOver...
    var popOver = NSPopover()
    func applicationDidFinishLaunching(_ notification: Notification) {
//        menu view
        let menuview = MenuView()
//        Creating PopOver...
        popOver.behavior = .transient
        popOver.animates = true
//        Setting Empty View Controller..
//        And Setting view as SwiftUi View..
//        with the help of Hosting controller
        popOver.contentViewController = NSViewController()
        popOver.contentViewController?.view = NSHostingView(rootView: menuview)
//        also Making Viw as MainView
        popOver.contentViewController?.view.window?.makeKey()
        
        
//        Creating Status Bar Button....
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
//        Safe Check id status Button is Available or not....
        if let MenuButton = statusItem?.button{
            MenuButton.image = NSImage(systemSymbolName: "icloud.and.arrow.up.fill", accessibilityDescription: nil)
            MenuButton.action = #selector(MenuButtonToggle)
        }
    }
//    Button Action...
    @objc func MenuButtonToggle(sender : AnyObject){
        if popOver.isShown{
            popOver.performClose(sender)
        }else{
            //        showing Popover...
            if let menuButton = statusItem?.button{
                //            Top Get Button Location For PopOver Arrow...
                self.popOver.show(relativeTo: menuButton.bounds, of: menuButton, preferredEdge: NSRectEdge.minY)
            }
        }
    }
}
