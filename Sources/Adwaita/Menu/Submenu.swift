//
//  Submenu.swift
//  Adwaita
//
//  Created by david-swift on 22.10.23.
//

import Libadwaita

/// A submenu widget.
public struct Submenu: MenuItem {

    /// The submenu's label.
    var label: String
    /// The content of the submenu.
    var submenuContent: MenuContent

    /// Initialize a submenu.
    /// - Parameters:
    ///   - label: The submenu's label.
    ///   - content: The content of the submenu.
    public init(_ label: String, @MenuBuilder content: () -> MenuContent) {
        self.label = label
        self.submenuContent = content()
    }

    /// Add the submenu to a menu.
    /// - Parameters:
    ///   - menu: The menu.
    ///   - app: The application containing the menu.
    ///   - window: The application window containing the menu.
    public func addMenuItem(menu: Libadwaita.Menu, app: GTUIApp, window: GTUIApplicationWindow?) {
        let submenu = Libadwaita.Menu()
        _ = menu.append(label, submenu: submenu)
        for element in submenuContent {
            element.addMenuItems(menu: submenu, app: app, window: window)
        }
    }

}
