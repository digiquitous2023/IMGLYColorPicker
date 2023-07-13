protocol Numeric: Comparable, ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
    var value: Double { set get }
    init(_ value: Double)
}

func %<T: Numeric> (lhs: T, rhs: T) -> T {
    return T(lhs.value.truncatingRemainder(dividingBy: rhs.value))
}

func + <T: Numeric> (lhs: T, rhs: T) -> T {
    return T(lhs.value + rhs.value)
}

func - <T: Numeric> (lhs: T, rhs: T) -> T {
    return T(lhs.value - rhs.value)
}

func < <T: Numeric> (lhs: T, rhs: T) -> Bool {
    return lhs.value < rhs.value
}

func == <T: Numeric> (lhs: T, rhs: T) -> Bool {
    return lhs.value == rhs.value
}

prefix func - <T: Numeric> (number: T) -> T {
    return T(-number.value)
}

func += <T: Numeric> (lhs: inout T, rhs: T) {
    lhs.value = lhs.value + rhs.value
}

func -= <T: Numeric> (lhs: inout T, rhs: T) {
    lhs.value = lhs.value - rhs.value
}

struct DisplayP3Value: Numeric {
    var value: Double

    init(_ value: Double) {
        self.value = value
    }
}

extension DisplayP3Value: ExpressibleByIntegerLiteral {
    init(integerLiteral value: IntegerLiteralType) {
        self.init(Double(value))
    }
}

extension DisplayP3Value: ExpressibleByFloatLiteral {
    init(floatLiteral value: FloatLiteralType) {
        self.init(Double(value))
    }
}

struct ExtendedSRGBValue: Numeric {
    var value: Double

    init(_ value: Double) {
        self.value = value
    }
}

extension ExtendedSRGBValue: ExpressibleByIntegerLiteral {
    init(integerLiteral value: IntegerLiteralType) {
        self.init(Double(value))
    }
}

extension ExtendedSRGBValue: ExpressibleByFloatLiteral {
    init(floatLiteral value: FloatLiteralType) {
        self.init(Double(value))
    }
}
