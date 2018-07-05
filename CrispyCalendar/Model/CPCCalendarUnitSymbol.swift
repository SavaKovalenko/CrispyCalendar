//
//  CPCCalendarUnitSymbol.swift
//  Copyright © 2018 Cleverpumpkin, Ltd. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

/// Represents style of a localized string representing a calendar unit.
public enum CPCCalendarUnitSymbolStyle {
	/// Full localized name of a calendar unit.
	case normal;
	/// Shortened localized name of calendar unit. Usually consists of just several letters.
	case short;
	/// The very shortest localized name for a calendar unit. Usually contains just a single letter.
	case veryShort;
	
	/// Default symbol style that is used when no specific style is requested.
	public static let `default` = normal;
}

/// Calendar unit that has a localizable symbol in addition to an integer value.
public protocol CPCCalendarUnitSymbol {
	/// Get a localized name of a calendar unit.
	///
	/// - Parameters:
	///   - style: Style of returned value.
	///   - standalone: `true` indicates the intention of using the returned value in standalone context, e.g. as unit's label.
	/// - Returns: Localized symbol representing this calendar unit with requested style and context.
	func symbol (style: Style, standalone: Bool) -> String;
}

public extension CPCCalendarUnitSymbol {
	/// - SeeAlso: `CPCCalendarUnitSymbolStyle`
	public typealias Style = CPCCalendarUnitSymbolStyle;
	
	/// Get a localized name of a calendar unit.
	///
	/// - Returns: Localized symbol with default style.
	public func symbol () -> String {
		return self.symbol (style: .default, standalone: true);
	}
	
	/// Get a localized name of a calendar unit.
	///
	/// - Parameters:
	///   - standalone: `true` indicates the intention of using the returned value in standalone context, e.g. as unit's label.
	/// - Returns: Localized symbol with default style for requested context.
	func symbol (standalone: Bool) -> String {
		return self.symbol (style: .default, standalone: standalone);
	}
	
	/// Get a localized name of a calendar unit.
	///
	/// - Parameters:
	///   - style: Style of returned value.
	/// - Returns: Localized symbol for requested style.
	func symbol (style: Style) -> String {
		return self.symbol (style: style, standalone: true);
	}
}

extension CPCCalendarUnitSymbol.Style {
	/// `CPCCalendarUnitSymbolStyle` value, equivalent to this `CPCCalendarUnitSymbol.Style` value.
	public var cStyle: __CPCCalendarUnitSymbolStyle {
		switch (self) {
		case .normal:
			return .normal;
		case .short:
			return .short;
		case .veryShort:
			return .veryShort;
		}
	}
	
	/// Creates new `CPCCalendarUnitSymbol.Style` equivalent to a `CPCCalendarUnitSymbolStyle` value.
	///
	/// - Parameter cStyle: `CPCCalendarUnitSymbolStyle` value to copy.
	public init (_ cStyle: __CPCCalendarUnitSymbolStyle) {
		switch cStyle {
		case .normal:
			self = .normal;
		case .short:
			self = .short;
		case .veryShort:
			self = .veryShort;
		}
	}
}