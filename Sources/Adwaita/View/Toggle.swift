//
//  Toggle.swift
//  Adwaita
//
//  Created by david-swift on 19.12.23.
//

import Libadwaita

/// A toggle button widget.
public struct Toggle: Widget {

    /// The button's label.
    var label: String?
    /// The button's icon.
    var icon: Icon?
    /// Whether the toggle is on.
    @Binding var isOn: Bool
    /// Whether to use GtkCheckButton instead of GtkToggleButton
    var isCheckButton = false

    // swiftlint:disable function_default_parameter_at_end
    /// Initialize a toggle button.
    /// - Parameters:
    ///   - label: The button's label.
    ///   - icon: The button's icon.
    ///   - isOn: Whether the toggle is on.
    public init(_ label: String? = nil, icon: Icon? = nil, isOn: Binding<Bool>) {
        self.label = label
        self.icon = icon
        self._isOn = isOn
    }
    // swiftlint:enable function_default_parameter_at_end

    /// Initialize a toggle button.
    /// - Parameters:
    ///   - label: The buttons label.
    ///   - isOn: Whether the toggle is on.
    public init(_ label: String, isOn: Binding<Bool>) {
        self.label = label
        self._isOn = isOn
    }

    /// Update a toggle button's view storage.
    /// - Parameters:
    ///     - storage: The view storage.
    ///     - modifiers: Modify views before being updated.
    public func update(_ storage: ViewStorage, modifiers: [(View) -> View]) {
        if let toggle = storage.view as? Libadwaita.ToggleButton {
            updateState(toggle: toggle)
        } else if let toggle = storage.view as? Libadwaita.CheckButton {
            updateState(toggle: toggle)
        }
    }

    /// Get a button's view storage.
    /// - Parameter modifiers: Modify views before being updated.
    /// - Returns: The button's view storage.
    public func container(modifiers: [(View) -> View]) -> ViewStorage {
        if isCheckButton {
            let toggle: Libadwaita.CheckButton = .init(label ?? "")
            updateState(toggle: toggle)
            _ = toggle.handler {
                self.isOn.toggle()
            }
            return .init(toggle)
        } else {
            let toggle: Libadwaita.ToggleButton = .init(label ?? "")
            updateState(toggle: toggle)
            _ = toggle.handler {
                self.isOn.toggle()
            }
            return .init(toggle)
        }
    }

    /// Update the toggle's state.
    /// - Parameter toggle: The toggle.
    func updateState(toggle: Libadwaita.ToggleButton) {
        if let icon {
            toggle.setLabel(icon: icon, label: label)
        } else if let label {
            toggle.setLabel(label)
        }
        toggle.setActive(isOn)
    }

    /// Update the check button's state.
    /// - Parameter toggle: The toggle.
    func updateState(toggle: Libadwaita.CheckButton) {
        if let label {
            toggle.setLabel(label)
        }
        toggle.setActive(isOn)
    }

    /// Use the check button style.
    /// - Returns: The toggle.
    public func checkButton() -> Self {
        var newSelf = self
        newSelf.isCheckButton = true
        return newSelf
    }

}
