func cardViewCoordinate(c: (Int, Int, Int, Int)) -> Int {
    return c.0 * 27 + c.1 * 9 + c.2 * 3 + c.3
}